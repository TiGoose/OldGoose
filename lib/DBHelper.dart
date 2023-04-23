import 'package:mongo_dart/mongo_dart.dart';
import 'package:old_goose/Order.dart';

class DbHelper {
  static final DbHelper _singleton = DbHelper._internal();
  static Db? _db;

  factory DbHelper() {
    return _singleton;
  }

  DbHelper._internal();

  static Future<void> connect() async {
    var connectionString =
        'mongodb://vincent:1357924680@v.walila.fun:27017/goose?authSource=admin&ssl=false';
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

  // DbHelper.insertOrder(Order.NewOrder(email: 'vincent7326@yahoo.com', amount: 3));
  static Future<String> insertOrder(Order order) async {
    if (_db == null) {
      await connect();
    }
    var colOrder = _db!.collection('order');

    // var result = await colOrder.insertOne(OrderToMap(order));
    var result = await colOrder.insert(OrderToMap(order));
    return result['\$oid'];

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
