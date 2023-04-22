import 'package:mongo_dart/mongo_dart.dart';

class Order {
  ObjectId? _id;
  DateTime OrderTime;
  String Status;
  String Email;
  int Amount;

  Order({required this.OrderTime, required this.Status, required this.Email
    , required this.Amount});

  Map<String, dynamic> toMap(){
    return{
      '_id': _id,
      'OrderTime': OrderTime,
      'Status': Status,
      'Email': Email,
      'Amount': Amount
    };
  }

  static Order fromMap(Map<String, dynamic> map){
    var order = Order(OrderTime: map['OrderTime'], Status: map['Status'], Email: map['Email']
        , Amount: map['Amount']);
    order._id = map['_id'];
    return order;
  }
}
