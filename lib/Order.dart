import 'package:mongo_dart/mongo_dart.dart';

class Order {
  ObjectId? _id;
  DateTime OrderTime;
  String Status;
  String Email;
  int Amount;

  Order({required this.OrderTime, required this.Status, required this.Email
    , required this.Amount});

  factory Order.NewOrder(
      {required String email, required int amount}) {
    return Order(
      OrderTime: DateTime.now().toUtc(),
      Status: 'Init',
      Email: email,
      Amount: amount,
    );
  }
}
  // Map<String, dynamic> OrderToMap(){
  //   return{
  //     '_id': _id,
  //     'OrderTime': OrderTime,
  //     'Status': Status,
  //     'Email': Email,
  //     'Amount': Amount
  //   };
  // }

  // static Order OrderFromMap(Map<String, dynamic> map){
  //   var order = Order(OrderTime: map['OrderTime'], Status: map['Status'], Email: map['Email']
  //       , Amount: map['Amount']);
  //   order._id = map['_id'];
  //   return order;
  // }

  Map<String, dynamic> OrderToMap(Order order) {
    return {
      '_id': order._id,
      'OrderTime': order.OrderTime,
      'Status': order.Status,
      'Email': order.Email,
      'Amount': order.Amount,
    };
  }

  Order? OrderFromMap(Map<String, dynamic>? map) {
  if(map == null) {
    return null;
  }
    return Order(
      OrderTime: map['OrderTime'],
      Status: map['Status'],
      Email: map['Email'],
      Amount: map['Amount'],
    ).._id = map['_id'];
  }
