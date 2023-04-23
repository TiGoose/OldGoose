import 'package:mongo_dart/mongo_dart.dart';
import 'package:old_goose/Order.dart';
import 'package:old_goose/services/UserDataService.dart';

class DbHelper {
  static final DbHelper _singleton = DbHelper._internal();
  static Db? _db;

  factory DbHelper() {
    return _singleton;
  }

  DbHelper._internal();

  static Future<void> connect() async {
    var connectionString =
        'mongodb://vincent:1357924680@v.walila.fun:27017/goose?authSource=admin&ssl=false&writeConcern=majority';
    if (_db == null) {
      _db = Db(connectionString);
      await _db!.open();
    }
  }

  static Future<void> close() async {
    if (_db != null) {
      await _db!.close();
    }
  }

  static Future<void> insertUserData() async{
    await Future.delayed(const Duration(seconds: 10));
    final Map<String, dynamic> userData = await UserDataService.generateUserData();
    var userCol = _db!.collection('user_data');


    userCol.insertOne(userData);
  }

  static Future<String> UpdateStatus(String id, String status) async{
    if (_db == null) {
      await connect();
    }
    var colOrder = _db!.collection('order');
    var modify = {
      r'$set': {
        'Status': status,
        'ModifyTime': DateTime.now().toUtc(),
      }
    };

    var result = await colOrder.updateOne(where.eq('_id', ObjectId.parse(id)), modify);
    return result.id.toHexString();
  }

  static Future<String> UpdateOrderId(String id, String orderId) async{
    if (_db == null) {
      await connect();
    }
    var colOrder = _db!.collection('order');
    var modify = {
      r'$set': {
        'Status': 'BookDone',
        'ModifyTime': DateTime.now().toUtc(),
        'OrderId': orderId,
      }
    };

    var result = await colOrder.updateOne(where.eq('_id', ObjectId.parse(id)), modify);
    return result.id.toHexString();
  }

  // DbHelper.insertOrder(Order.NewOrder(email: 'vincent7326@yahoo.com', amount: 3));
  static Future<String> insertOrder(Order order) async {
    if (_db == null) {
      await connect();
    }
    var colOrder = _db!.collection('order');

    // var result = await colOrder.insertOne(OrderToMap(order));
    // var result = await colOrder.insert(OrderToMap(order));
    var result = await colOrder.insertOne(OrderToMap(order));
    var id = result.id.toHexString();

    return id;
    // await colOrder.insert(order.OrderToMap());

    // await colOrder.insert({
    //   'orderNo': 1,
    //   'status': 'Init',
    //   'orderTime': DateTime.now().toUtc(),
    //   'email': 'vincent-vincent@yahoo.com.tw',
    //   'Amount': 1
    // });
  }

  static Future<Order?> GetOrderById(String id) async {
    if (_db == null) {
      await connect();
    }
    var colOrder = _db!.collection('order');
    var map = await colOrder.findOne(where.eq('_id', id));
    return OrderFromMap(map);

  }
  static Future<List<Order?>> GetOrderByEMail(String email) async {
    if (_db == null) {
      await connect();
    }
    var colOrder = _db!.collection('order');
    var cursor = colOrder.find(where.eq('Email', email));
    var orderList = await cursor.map((doc) => OrderFromMap(doc)).toList();
    return orderList;
  }
}
