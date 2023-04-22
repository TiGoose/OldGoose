import 'package:mongo_dart/mongo_dart.dart';
import 'package:old_goose/Order.dart';

class DbHelper {
  static final DbHelper _singleton = DbHelper._internal();
  Db? _db;

  factory DbHelper() {
    return _singleton;
  }

  DbHelper._internal();

  Future<void> connect() async {
    var connectionString =
        'mongodb://vincent:1357924680@v.walila.fun:27017/goose?authSource=admin&ssl=false';
    if (_db == null) {
      _db = Db(connectionString);
      await _db!.open();
    }
  }

  Future<void> close() async {
    if (_db != null) {
      await _db!.close();
    }
  }

  Future<void> insertOrder(Order order) async {
    if (_db == null) {
      await connect();
    }
    var colOrder = _db!.collection('order');

    await colOrder.insert(order.toMap());

    // await colOrder.insert({
    //   'orderNo': 1,
    //   'status': 'Init',
    //   'orderTime': DateTime.now().toUtc(),
    //   'email': 'vincent-vincent@yahoo.com.tw',
    //   'Amount': 1
    // });
  }

  Future<List<Order>> GetOrderByEMail(String Email) async {
    if (_db == null) {
      await connect();
    }
    var colOrder = _db!.collection('order');
    var cursor = colOrder.find(where.eq('Email', Email));
    var orderList = await cursor.map((doc) => Order.fromMap(doc)).toList();
    return orderList;
  }
}
