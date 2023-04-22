class BookingRequest {
  List<Passengers>? passengers;
  List<String>? sections;
  bool? seatReserved;
  String? memo;

  BookingRequest({this.passengers, this.sections, this.seatReserved, this.memo});

  BookingRequest.fromJson(Map<String, dynamic> json) {
    passengers = json["passengers"] == null ? null : (json["passengers"] as List).map((e) => Passengers.fromJson(e)).toList();
    sections = json["sections"] == null ? null : List<String>.from(json["sections"]);
    seatReserved = json["seat_reserved"];
    memo = json["memo"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(passengers != null) {
      _data["passengers"] = passengers?.map((e) => e.toJson()).toList();
    }
    if(sections != null) {
      _data["sections"] = sections;
    }
    _data["seat_reserved"] = seatReserved;
    _data["memo"] = memo;
    return _data;
  }
}

class Passengers {
  String? id; // add this for booking response
  String? firstName;
  String? lastName;
  String? birthdate;
  String? email;
  String? phone;
  String? gender;

  Passengers({this.id, this.firstName, this.lastName, this.birthdate, this.email, this.phone, this.gender});

  Passengers.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    birthdate = json["birthdate"];
    email = json["email"];
    phone = json["phone"];
    gender = json["gender"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["first_name"] = firstName;
    _data["last_name"] = lastName;
    _data["birthdate"] = birthdate;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["gender"] = gender;
    return _data;
  }
}