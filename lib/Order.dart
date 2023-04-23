import 'package:mongo_dart/mongo_dart.dart';

class Order {
  ObjectId? _id;
  DateTime OrderTime;
  String Status;
  String Email;
  int TotalAmount;
  int AdultCount;
  int ChildCount;
  DateTime TicketTime;
  String Session;

  String LastName;
  String FirstName;
  String Mobile;
  String Birthday;
  String Passport;
  String Gender;

  Order(
      {required this.OrderTime,
      required this.Status,
      required this.Email,
      required this.TotalAmount,
      required this.AdultCount,
      required this.ChildCount,
      required this.TicketTime,
      required this.Session,
      required this.LastName,
      required this.FirstName,
      required this.Mobile,
      required this.Birthday,
      required this.Passport,
      required this.Gender});

  factory Order.NewOrder({
    required String email,
    required int amount,
    required int adultCount,
    required int childCount,
    required String session,
    required String lastName,
    required String firstName,
    required String mobile,
    required String birthday,
    required String passport,
    required String gender,
  }) {
    if (!isValidEmail(email)) {
      throw ArgumentError('Invalid email address');
    }

    return Order(
      OrderTime: DateTime.now().toUtc(),
      Status: 'Init',
      Email: email,
      TotalAmount: amount,
      AdultCount: adultCount,
      ChildCount: childCount,
      TicketTime: DateTime.now().toUtc(),
      Session: session,
      LastName: lastName,
      FirstName: firstName,
      Mobile: mobile,
      Birthday: birthday,
      Passport: passport,
      Gender: gender,
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

bool isValidEmail(String email) {
  final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      caseSensitive: false,
      multiLine: false);
  return emailRegExp.hasMatch(email);
}
Map<String, dynamic> OrderToMap(Order order) {
  return {
    '_id': order._id?.toHexString(),
    'OrderTime': order.OrderTime.toIso8601String(),
    'Status': order.Status,
    'Email': order.Email,
    'TotalAmount': order.TotalAmount,
    'AdultCount': order.AdultCount,
    'ChildCount': order.ChildCount,
    'TicketTime': order.TicketTime.toIso8601String(),
    'Session': order.Session,
    'LastName': order.LastName,
    'FirstName': order.FirstName,
    'Mobile': order.Mobile,
    'Birthday': order.Birthday,
    'Passport': order.Passport,
    'Gender': order.Gender,
  };
}

Order? OrderFromMap(Map<String, dynamic>? map) {
  if (map == null) {
    return null;
  }
  return Order(
    OrderTime: DateTime.parse(map['OrderTime']),
    Status: map['Status'],
    Email: map['Email'],
    TotalAmount: map['TotalAmount'],
    AdultCount: map['AdultCount'] ?? 0,
    ChildCount: map['ChildCount'] ?? 0,
    TicketTime: DateTime.parse(map['TicketTime']),
    Session: map['Session'],
    LastName: map['LastName'],
    FirstName: map['FirstName'],
    Mobile: map['Mobile'],
    Birthday: map['Birthday'],
    Passport: map['Passport'],
    Gender: map['Gender'],
  ).._id = map['_id'] != null ? ObjectId.parse(map['_id']) : null;
}