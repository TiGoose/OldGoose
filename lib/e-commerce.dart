/*
Flutter UI
flutterui.design
----------------
lib/apps/simple_ecommerce.dart
*/

import 'dart:convert';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:old_goose/DBHelper.dart';
import 'package:old_goose/package.dart';
import 'package:old_goose/payment.dart';
import 'package:old_goose/services/GrailService.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

import 'Order.dart';

// Package saintMichelPackage = Package(
//     title: '聖米歇爾山',
//     imageUrl:
//         'https://www.leo-travel.idv.tw/wp-content/uploads/france-paris-mont-saint-michel-shutterstock_527012107.jpg',
//     adultPrice: 2023,
//     childPrice: 1000,
//     description: 'this is 聖米歇爾山的介紹得斯~~ 哈哈哈哈',
//     keywords: '聖米歇爾山 Mont Saint Michel 法國',
//     from: 'xxx',
//     to: 'qqqq');
// Package schlossNeuschwansteinCastlePackage = Package(
//     title: '新天鵝堡',
//     imageUrl:
//         'https://travelwithmiya.com/wp-content/uploads/2022/07/Neuschwanstein-05.jpg',
//     adultPrice: 50556,
//     childPrice: 20886,
//     description: 'this is 新天鵝堡的介紹得斯~~ 顆顆顆顆',
//     keywords: '新天鵝堡 Schloss Neuschwanstein castle 慕尼黑 德國',
//     from: 'xxx',
//     to: 'qqqq');
// Package frankfurtPackage = Package(
//     title: '法蘭克福兩日遊',
//     imageUrl: 'https://mimihan.tw/wp-content/uploads/20190408150845_16.jpg',
//     adultPrice: 3000,
//     childPrice: 2300,
//     description: '',
//     keywords:
//         '#羅馬廣場 #市政廳 #法蘭克福大教堂 #鐵橋 #歐洲中央銀行 #歌德故居 #法蘭克福歌劇院 #正義之泉 #聖保羅教堂 #法蘭克福證券交易所',
//     from: 'xxx',
//     to: 'qqqq');
// Package berlinPackage = Package(
//     title: '柏林三日遊',
//     imageUrl:
//         'https://www.leo-travel.idv.tw/wp-content/uploads/germany-berlin-berliner-dom-spree-river-cruise-DSC_6387-photo-17701.jpg',
//     adultPrice: 3000,
//     childPrice: 2300,
//     description: '',
//     keywords:
//         '#勃蘭登堡門 #德國國會大廈#柏林大教堂 #菩提樹下大街 #歐洲猶太人紀念碑 #波茨坦廣場 #勝利紀念柱 #柏林墻遺址 #東德安全部博物館 #佩加蒙博物館 #玉林廣場',
//     from: 'xxx',
//     to: 'qqqq');
// Package munichPackage = Package(
//     title: '慕尼黑兩日遊',
//     imageUrl:
//         'https://www.leo-travel.idv.tw/wp-content/uploads/germany-munich-Marienplatz-1476964067.jpg',
//     adultPrice: 3000,
//     childPrice: 2300,
//     description: '',
//     keywords:
//         '#慕尼黑啤酒屋 德國  #聖瑪利亞廣場 #寶馬博物館 #安聯拜仁慕尼黑球場 #奧林匹克公園 #瑪麗安教堂 #慕尼黑凱旋門 #慕尼黑新市政廳 #慕尼黑王宮 #寧芬堡宮 #英國花園',
//     from: 'xxx',
//     to: 'qqqq'
// );

// List<Package> packages = [
//   saintMichelPackage,
//   schlossNeuschwansteinCastlePackage,
//   frankfurtPackage,
//   berlinPackage,
//   munichPackage,
// ];


Cart cart = Cart();

class SimpleEcommerce extends StatelessWidget {
  const SimpleEcommerce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Builder(
        builder: (context) => const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String searchString;
  late List<Package> packages;
  late List<Widget> packageTiles;

  @override
  void initState() {
    searchString = '';
    super.initState();
    _loadPackages();
  }

  void setSearchString(String value) => setState(() {
        searchString = value;
      });

  Future<void> _loadPackages() async {
    await DbHelper.connect();
    final pkgs = await DbHelper.GetAllPackage();
    setState(() {
      packages = pkgs;


      // for(var pkg in packages){
      //   packageTiles.add(PackageTile(package: pkg, widget: PackageScreen(package: pkg)));
      //   packageTiles.add(const SizedBox(height: 16));
      // }

      packageTiles = packages.map((package) =>
          Column(
            children: [
              PackageTile(
                package: package,
                widget: PackageScreen(package: package),
              ),
              const SizedBox(height: 20)
            ],
          )
      ).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    var listViewPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 24);
    List<Widget> searchResultTiles = [];
    if (searchString.isNotEmpty && packages.isNotEmpty) {
      searchResultTiles = packages
          .where(
              (p) => p.keywords.toLowerCase().contains(searchString.toLowerCase()))
          .map(
            (p) =>
            Column(
              children: [
                PackageTile(package: p, widget: PackageScreen(package: p)),
                SizedBox(height: 20,)
              ],
            )
      )
          .toList();

    }
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          onChanged: setSearchString,
        ),
        actions: const [
          LiveChatBarAction(),
        ],
      ),
      body: searchString.isNotEmpty
          ? ListView(
            padding: listViewPadding,
            children: searchResultTiles,
          )
          : ListView(
              padding: listViewPadding,
              children: [
                  const SizedBox(height: 16),
                ...packageTiles,
              ],
              // children: [
              //   const SizedBox(height: 16),
              // ...packageTiles
              // ],
            ),
    );
  }
}

class LiveChatBarAction extends StatefulWidget {
  const LiveChatBarAction({Key? key}) : super(key: key);

  @override
  State<LiveChatBarAction> createState() => _LiveChatBarActionState();
}

class _LiveChatBarActionState extends State<LiveChatBarAction> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(
        alignment: Alignment.center,
        children: const [
          Icon(
            Icons.chat,
          )
        ],
      ),
      onPressed: () async {
        const url = 'http://oldgoose.v.walila.fun/';
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          throw 'Could not launch http://oldgoose.v.walila.fun/';
        }
      }
    );
  }
}

class CartAppBarAction extends StatefulWidget {
  const CartAppBarAction({Key? key}) : super(key: key);

  @override
  State<CartAppBarAction> createState() => _CartAppBarActionState();
}

class _CartAppBarActionState extends State<CartAppBarAction> {
  // TODO: Setup cart to listen for changes based on your own state management. Could use riverpod, provider, bloc, etc..
  @override
  void initState() {
    cart.addListener(blankSetState);
    super.initState();
  }

  @override
  void dispose() {
    cart.removeListener(blankSetState);
    super.dispose();
  }

  void blankSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.shopping_cart,
          ),
          if (cart.itemsInCart.isNotEmpty)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        cart.itemsInCart.length.toString(),
                        style: const TextStyle(
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      onPressed: () => _pushScreen(
        context: context,
        screen: const CartScreen(),
      ),
    );
  }
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({required this.product, Key? key}) : super(key: key);
  final Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product get product => widget.product;
  String? selectedImageUrl;
  String? selectedSize;

  @override
  void initState() {
    selectedImageUrl = product.imageUrls.first;
    selectedSize = product.sizes?.first;
    super.initState();
  }

  void setSelectedImageUrl(String url) {
    setState(() {
      selectedImageUrl = url;
    });
  }

  void setSelectedSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> imagePreviews = product.imageUrls
        .map(
          (url) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () => setSelectedImageUrl(url),
              child: Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: selectedImageUrl == url
                      ? Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1.75)
                      : null,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  url,
                ),
              ),
            ),
          ),
        )
        .toList();

    List<Widget> sizeSelectionWidgets = product.sizes
            ?.map(
              (s) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    setSelectedSize(s);
                  },
                  child: Container(
                    height: 42,
                    width: 38,
                    decoration: BoxDecoration(
                      color: selectedSize == s
                          ? Theme.of(context).colorScheme.secondary
                          : null,
                      border: Border.all(
                        color: Colors.grey[350]!,
                        width: 1.25,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        s,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: selectedSize == s ? Colors.white : null),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList() ??
        [];

    return Scaffold(
      appBar: AppBar(
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .35,
            color: kGreyBackground,
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    selectedImageUrl!,
                    fit: BoxFit.cover,
                    color: kGreyBackground,
                    colorBlendMode: BlendMode.multiply,
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imagePreviews,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '\$${product.cost}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    product.description ??
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis purus laoreet, efficitur libero vel, feugiat ante. Vestibulum tempor, ligula.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.5),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  if (sizeSelectionWidgets.isNotEmpty) ...[
                    Text(
                      'Size',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: sizeSelectionWidgets,
                    ),
                  ],
                  const Spacer(),
                  Center(
                    child: CallToActionButton(
                      onPressed: () => cart.add(
                        OrderItem(
                          product: product,
                          selectedSize: selectedSize,
                        ),
                      ),
                      labelText: 'Add to Cart',
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CallToActionButton extends StatelessWidget {
  const CallToActionButton(
      {required this.onPressed,
      required this.labelText,
      this.minSize = const Size(266, 45),
      Key? key})
      : super(key: key);
  final Function onPressed;
  final String labelText;
  final Size minSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      style: ElevatedButton.styleFrom(
        minimumSize: minSize,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Text(
        labelText,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

class PackageScreen extends StatefulWidget {
  const PackageScreen({Key? key, required this.package}) : super(key: key);
  final Package package;

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  final passportController = TextEditingController();
  final ticketTimeController = TextEditingController();
  final couponController = TextEditingController();

  int _adultCount = 0;
  int _childCount = 0;
  String _email = '';
  Map<String, dynamic>? paymentIntent;
  var clientkey = "sk_test_51MzZGsAal8fGT9eQSbcU99X0lPZRRro6amrKu8vbFUz9zFkmEqEoi71EMt8vGlcKf9fBmJ4IshSqP2JBHYLCP4kG00Pd6voMhq"; // Secret Key
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });}

  _increaseAdultCount() {
    setState(() {
      _adultCount = (_adultCount + 1).clamp(0, 10);
    });
  }

  _decreaseAdultCount() {
    setState(() {
      _adultCount = (_adultCount - 1).clamp(0, 10);
    });
  }

  _increaseChildCount() {
    setState(() {
      _childCount = (_childCount + 1).clamp(0, 10);
    });
  }

  _decreaseChildCount() {
    setState(() {
      _childCount = (_childCount - 1).clamp(0, 10);
    });
  }

  Package get package => widget.package;

  @override
  void dispose() {
    emailController.dispose();
    mobileController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    passportController.dispose();
    ticketTimeController.dispose();
    couponController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(package.title),
        actions: const [
          LiveChatBarAction(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              package.imageUrl,
            ),
            SizedBox(height: 20),
            Text(
              package.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '成人價： \$' + package.adultPrice.toString(),
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
              ),
            ),
            Text(
              '孩童價： \$' + package.childPrice.toString(),
              style: TextStyle(
                fontSize: 24,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Selected Date:',
                  ),
                  Text(
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select date'),
                  ),
                ],
              ),
              // TextFormField(
              //   controller: ticketTimeController,
              //   keyboardType: TextInputType.datetime,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: '出發日期',
              //     hintText: '請選擇您的出發日期',
              //   ),
              //   // validator: validateQuantity,
              // ),
            ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('成人所需數量', textAlign: TextAlign.left),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: _decreaseAdultCount,
                          color: _adultCount == 0 ? Colors.grey : Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '$_adultCount',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: _increaseAdultCount,
                          color: _adultCount == 10 ? Colors.grey : Colors.black,
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('孩童所需數量', textAlign: TextAlign.left),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: _decreaseChildCount,
                          color: _childCount == 0 ? Colors.grey : Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '$_childCount',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: _increaseChildCount,
                          color: _childCount == 10 ? Colors.grey : Colors.black,
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: '請輸入您的 email',
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '手機號碼',
                  hintText: '請輸入您的手機號碼',
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: lastNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '姓氏',
                  hintText: '請輸入您的姓氏',
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: firstNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '名字',
                  hintText: '請輸入您的名字',
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: passportController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '護照號碼',
                  hintText: '請輸入您的護照號碼',
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: couponController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '优惠码',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var insurancePolicyId = 0;
                await DialogUtils.displayDialogOKCallBack(context).then((value) => {
                  if(value != null && value ){
                    insurancePolicyId = 1
                  }
                });

                var adultC = _adultCount;
                var childC = _childCount;
                if (adultC < 1 && childC < 1) {
                  throw ArgumentError('成人或小孩票數量都是0');
                }

                var totalAmount = package.adultPrice * adultC +
                    package.childPrice * childC;
                totalAmount = insurancePolicyId == 1 ? totalAmount * (105 / 100).toInt() : totalAmount;
                _email = emailController.text;
                log("insurancePolicyId" + insurancePolicyId.toString());
                var orderId = await DbHelper.insertOrder(Order.NewOrder(
                    email: _email,
                    orderId: '',
                    amount: totalAmount,
                    adultCount: adultC,
                    childCount: childC,
                    session: '',
                    lastName: lastNameController.text,
                    firstName: firstNameController.text,
                    mobile: mobileController.text,
                    birthday: '',
                    passport: passportController.text,
                    gender: 'M',
                    insurancePolicyId: insurancePolicyId));

                Future(() async {
                  try {
                    var grailService = GrailService();
                    var searchResponse = await grailService.search(
                        package.from,
                        package.to,
                        selectedDate.toString(),
                        "15:00",
                        _adultCount,
                        _childCount);

                    String? bookingCode = '';

                    for (int i = 0; i < searchResponse.data!.length; i++) {
                      if (searchResponse.data![i].solutions!.length > 0 ) {
                        bookingCode = searchResponse.data![i].solutions![0].sections?[0].offers?[0].services?[0].bookingCode;
                        break;
                      }
                    }

                    var onlineOrderId = await grailService.booking(
                        bookingCode!, emailController.text, _adultCount, _childCount, orderId);
                    await DbHelper.UpdateOrderId(orderId, onlineOrderId);

                    var confirmResponse = await grailService.confirm(onlineOrderId);

                  } catch (e) {
                    await DbHelper.UpdateStatus(orderId, 'BookingFail');
                  }
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmationWidget(
                        orderId: orderId,
                        currency: 'TWD',
                        amount: totalAmount,
                        email: _email),
                  ),
                );
              },
              child: Text('確認購買'),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogUtils {
  static Future<bool?> displayDialogOKCallBack(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('更安心'),
          content:  const Text('你知道嗎？加購旅遊保險，讓你的旅遊之路不再充滿驚險！讓我們一起喊出口號：「保險保你玩，出遊不再慘！」'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('先不用'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('我要加購！'),
            ),
          ],
        );
      },
    );
  }
}

class ConfirmationWidget extends StatefulWidget {
  String orderId;
  String currency;
  int amount;
  String email;

  ConfirmationWidget(
      {super.key,
        required this.orderId,
        required this.currency,
        required this.amount,
        required this.email});

  @override
  ConfirmationWidgetState createState() => ConfirmationWidgetState();
}

class ConfirmationWidgetState extends State<ConfirmationWidget> {
  Map<String, dynamic>? paymentIntent;
  var clientkey = "sk_test_51MzZGsAal8fGT9eQSbcU99X0lPZRRro6amrKu8vbFUz9zFkmEqEoi71EMt8vGlcKf9fBmJ4IshSqP2JBHYLCP4kG00Pd6voMhq"; // Secret Key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('交易狀態'),
          actions: const [
            LiveChatBarAction(),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: 20),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall,
                      ),
                      Text(
                        '${widget.currency}${widget.amount.toStringAsFixed(2)}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CallToActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BankTransferWidget(
                                amount: widget.amount,
                                orderId: widget.orderId,
                                email: widget.email,
                                currency: widget.currency,
                              ),
                        ),
                      );
                    },
                    labelText: '银行转账',
                    minSize: const Size(220, 45),
                  ),
                  SizedBox(height: 20),
                  CallToActionButton(
                    onPressed: () {
                      makePayment(widget.currency, widget.amount.toString(), widget.orderId);
                    },
                    labelText: '信用卡',
                    minSize: const Size(220, 45),
                  ),
                  SizedBox(height: 20),
                  CallToActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PaymentWidget(
                                  amount: widget.amount,
                                  orderId: widget.orderId,
                                  email: widget.email),
                        ),
                      );
                    },
                    labelText: 'USDT',
                    minSize: const Size(220, 45),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
  createPaymentIntent(String amount, String currency) async {
    try {

      // TODO: Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      // TODO: POST request to stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $clientkey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      log('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      log('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }

  Future<void> makePayment(String currency, String amount, String orderId) async {
    try {
      // TODO: Create Payment intent
      paymentIntent = await createPaymentIntent(amount, currency);

      // TODO: Initialte Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          applePay: null,
          googlePay: null,
          style: ThemeMode.light,
          merchantDisplayName: 'OldGoose',
        ),
      ).then((value) async {
      // TODO: now finally display payment sheeet
        displayPaymentSheet(orderId);
      }
      );

    } catch (e, s) {
      String ss = "exception 1 :$e";
      String s2 = "reason :$s";
      log('hihi');
      log("exception 1:$e");
    }
  }

  displayPaymentSheet(String orderId) async {
    try {
      var order = await DbHelper.GetOrderById(orderId);

      Future(() async {
        try {
          var grailService = GrailService();
          var confirmResponse = await grailService.confirm(order!.OrderId);
          print('confirm here >>>>' + confirmResponse.toString());
          // var bookingCode = confirmResponse.data?[1].solutions?[0]
          //     .sections?[0].offers?[0].services?[0].bookingCode;
          // var onlineOrderId = await grailService.booking(
          //     bookingCode!, emailController.text);
          // await DbHelper.UpdateOrderId(orderId, onlineOrderId);
        } catch (e) {
          // await DbHelper.UpdateStatus(orderId, 'BookingFail');
        }
      });

      //call g2rail confirm api

      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    ),
                    Text("Payment Successfull"),
                  ],
                ),
              ],
            ),
          ),
        );
        Future.delayed(Duration(seconds: 1), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StatusWidget(), // can put order in status page
            ),
          );
        });

        // TODO: update payment intent to null
        paymentIntent = null;
      }).onError((error, stackTrace) {
        String ss = "exception 2 :$error";
        String s2 = "reason :$stackTrace";
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      String ss = "exception 3 :$e";
    } catch (e) {
      log('$e');
    }
  }
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({required this.category, Key? key}) : super(key: key);
  final Category category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

enum Filters { popular, recent, sale }

class _CategoryScreenState extends State<CategoryScreen> {
  Category get category => widget.category;
  Filters filterValue = Filters.popular;
  String? selection;
  late List<Product> _products;

  @override
  void initState() {
    selection = category.selections.first;
    _products = products.where((p) => p.category == category).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductRow> productRows = category.selections
        .map((s) => ProductRow(
              productType: s,
              products: _products
                  .where((p) => p.productType.toLowerCase() == s.toLowerCase())
                  .toList(),
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.title),
        actions: const [
          CartAppBarAction(),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 18),
        itemCount: productRows.length,
        itemBuilder: (_, index) => productRows[index],
        separatorBuilder: (_, index) => const SizedBox(
          height: 18,
        ),
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  const ProductRow(
      {required this.products, required this.productType, Key? key})
      : super(key: key);
  final String productType;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    List<ProductTile> productTiles =
        products.map((p) => ProductTile(product: p)).toList();

    return productTiles.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
                child: Text(
                  productType,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 205,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  itemCount: productTiles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => productTiles[index],
                  separatorBuilder: (_, index) => const SizedBox(
                    width: 24,
                  ),
                ),
              ),
            ],
          );
  }
}

class ProductTile extends StatelessWidget {
  const ProductTile({required this.product, Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemSound.play(SystemSoundType.click);
        _pushScreen(
          context: context,
          screen: ProductScreen(product: product),
        );
      },
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(product: product),
            const SizedBox(
              height: 8,
            ),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            Text(
              '\$${product.cost.toString()}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            )
          ],
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: .95,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: kGreyBackground,
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.network(
          product.imageUrls.first,
          loadingBuilder: (_, child, loadingProgress) => loadingProgress == null
              ? child
              : const Center(child: CircularProgressIndicator()),
          color: kGreyBackground,
          colorBlendMode: BlendMode.multiply,
        ),
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    cart.addListener(updateState);
  }

  @override
  void dispose() {
    cart.removeListener(updateState);
    super.dispose();
  }

  void updateState() => setState(() {});

  @override
  Widget build(BuildContext context) {
    List<Widget> orderItemRows = cart.itemsInCart
        .map(
          (item) => Row(
            children: [
              SizedBox(
                width: 125,
                child: ProductImage(
                  product: item.product,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.product.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '\$${item.product.cost}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => cart.remove(item),
                color: Colors.red,
              )
            ],
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Column(
          children: [
            const Text('Cart'),
            Text(
              '${cart.itemsInCart.length} items',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          if (orderItemRows.isNotEmpty)
            Expanded(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                itemCount: orderItemRows.length,
                itemBuilder: (_, index) => orderItemRows[index],
                separatorBuilder: (_, index) => const SizedBox(
                  height: 16,
                ),
              ),
            )
          else
            const Expanded(
              child: Center(
                child: Text('Your cart is empty'),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '\$${cart.totalCost.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                CallToActionButton(
                  onPressed: () {},
                  labelText: 'Check Out',
                  minSize: const Size(220, 45),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class PackageTile extends StatelessWidget {
  const PackageTile(
      {required this.package,
      this.imageAlignment = Alignment.center,
      Key? key,
      required this.widget})
      : super(key: key);
  final Package package;
  final StatefulWidget widget;

  /// Which part of the image to prefer
  final Alignment imageAlignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FirebaseAnalytics.instance.logEvent(name: "${package.title}Pressed");
        _pushScreen(context: context, screen: widget);
        },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              package.imageUrl,
              color: kGreyBackground,
              colorBlendMode: BlendMode.darken,
              alignment: imageAlignment,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                package.title.toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0, // shadow blur
                      color: Colors.black, // shadow color
                      offset: Offset(2.0, 2.0), // how much shadow will be shown
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {required this.category,
      required this.imageUrl,
      this.imageAlignment = Alignment.center,
      Key? key})
      : super(key: key);
  final String imageUrl;
  final Category category;

  /// Which part of the image to prefer
  final Alignment imageAlignment;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pushScreen(
        context: context,
        screen: CategoryScreen(
          category: category,
        ),
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              color: kGreyBackground,
              colorBlendMode: BlendMode.darken,
              alignment: imageAlignment,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                category.title.toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({required this.onChanged, Key? key}) : super(key: key);

  final Function(String) onChanged;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        onChanged: widget.onChanged,
        controller: _textEditingController,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding:
              kIsWeb ? const EdgeInsets.only(top: 10) : EdgeInsets.zero,
          prefixIconConstraints: const BoxConstraints(
            minHeight: 36,
            minWidth: 36,
          ),
          prefixIcon: const Icon(
            Icons.search,
          ),
          hintText: 'Search for a product',
          suffixIconConstraints: const BoxConstraints(
            minHeight: 36,
            minWidth: 36,
          ),
          suffixIcon: IconButton(
            constraints: const BoxConstraints(
              minHeight: 36,
              minWidth: 36,
            ),
            splashRadius: 24,
            icon: const Icon(
              Icons.clear,
            ),
            onPressed: () {
              _textEditingController.clear();
              widget.onChanged(_textEditingController.text);
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ),
    );
  }
}

class Category {
  final String title;
  final List<String> selections;

  Category({required this.title, required this.selections});
}

void _pushScreen({required BuildContext context, required Widget screen}) {
  ThemeData themeData = Theme.of(context);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => Theme(data: themeData, child: screen),
    ),
  );
}

class Product {
  final String name;
  final List<String> imageUrls;
  final double cost;
  final String? description;
  final List<String>? sizes;

  /// Which overall category this product belongs in. e.g - Men, Women, Pets, etc.
  final Category category;

  /// Represents type of product such as shirt, jeans, pet treats, etc.
  final String productType;

  Product(
      {required this.name,
      required this.imageUrls,
      required this.cost,
      this.description,
      this.sizes,
      required this.category,
      required this.productType});
}

class Cart with ChangeNotifier {
  List<OrderItem> itemsInCart = [];

  double get totalCost {
    double total = 0;
    for (var item in itemsInCart) {
      total += item.product.cost;
    }
    return total;
  }

  void add(OrderItem orderItem) {
    itemsInCart.add(orderItem);
    notifyListeners();
  }

  void remove(OrderItem orderItem) {
    // print(orderItem.product.name);
    itemsInCart.remove(orderItem);
    // print(t);
    notifyListeners();
  }
}

class OrderItem {
  Product product;

  /// Selected size of product; This can be null
  String? selectedSize;

  /// Selected color of product; This can be null
  String? selectedColor;

  OrderItem({required this.product, this.selectedSize, this.selectedColor});
}

final kGreyBackground = Colors.grey[200];

// TODO: Fetch products and feed into widgets
List<Product> products = [];
