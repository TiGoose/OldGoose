class SearchResponse {
  Railway? railway;
  bool? loading;
  List<Solutions>? solutions;

  SearchResponse({this.railway, this.loading, this.solutions});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    railway =
    json['railway'] != null ? new Railway.fromJson(json['railway']) : null;
    loading = json['loading'];
    if (json['solutions'] != null) {
      solutions = <Solutions>[];
      json['solutions'].forEach((v) {
        solutions!.add(new Solutions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.railway != null) {
      data['railway'] = this.railway!.toJson();
    }
    data['loading'] = this.loading;
    if (this.solutions != null) {
      data['solutions'] = this.solutions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Railway {
  String? code;

  Railway({this.code});

  Railway.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    return data;
  }
}

class Solutions {
  From? from;
  From? to;
  String? departure;
  Duration? duration;
  int? transferTimes;

  Solutions(
      {this.from, this.to, this.departure, this.duration, this.transferTimes});

  Solutions.fromJson(Map<String, dynamic> json) {
    from = json['from'] != null ? new From.fromJson(json['from']) : null;
    to = json['to'] != null ? new From.fromJson(json['to']) : null;
    departure = json['departure'];
    duration = json['duration'] != null
        ? new Duration.fromJson(json['duration'])
        : null;
    transferTimes = json['transfer_times'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.from != null) {
      data['from'] = this.from!.toJson();
    }
    if (this.to != null) {
      data['to'] = this.to!.toJson();
    }
    data['departure'] = this.departure;
    if (this.duration != null) {
      data['duration'] = this.duration!.toJson();
    }
    data['transfer_times'] = this.transferTimes;
    return data;
  }
}

class From {
  String? code;
  String? name;
  String? helpUrl;

  From({this.code, this.name, this.helpUrl});

  From.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    helpUrl = json['help_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['help_url'] = this.helpUrl;
    return data;
  }
}

class Duration {
  int? hour;
  int? minutes;

  Duration({this.hour, this.minutes});

  Duration.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    minutes = json['minutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hour'] = this.hour;
    data['minutes'] = this.minutes;
    return data;
  }
}

class Sections {
  List<Section>? sections;

  Sections({this.sections});

  Sections.fromJson(Map<String, dynamic> json) {
    if (json['sections'] != null) {
      sections = <Section>[];
      json['sections'].forEach((v) {
        sections!.add(new Section.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Section {
  String? carrierDescription;
  String? carrierCode;
  List<Offers>? offers;

  Section({this.carrierDescription, this.carrierCode, this.offers});

  Section.fromJson(Map<String, dynamic> json) {
    carrierDescription = json['carrier_description'];
    carrierCode = json['carrier_code'];
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carrier_description'] = this.carrierDescription;
    data['carrier_code'] = this.carrierCode;
    if (this.offers != null) {
      data['offers'] = this.offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offers {
  String? code;
  String? description;
  String? ticketType;
  String? seatType;
  String? refundType;
  String? changeType;
  String? confirmAgain;
  String? detail;
  Restriction? restriction;
  List<Services>? services;

  Offers(
      {this.code,
        this.description,
        this.ticketType,
        this.seatType,
        this.refundType,
        this.changeType,
        this.confirmAgain,
        this.detail,
        this.restriction,
        this.services});

  Offers.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    ticketType = json['ticket_type'];
    seatType = json['seat_type'];
    refundType = json['refund_type'];
    changeType = json['change_type'];
    confirmAgain = json['confirm_again'];
    detail = json['detail'];
    restriction = json['restriction'] != null
        ? new Restriction.fromJson(json['restriction'])
        : null;
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    data['ticket_type'] = this.ticketType;
    data['seat_type'] = this.seatType;
    data['refund_type'] = this.refundType;
    data['change_type'] = this.changeType;
    data['confirm_again'] = this.confirmAgain;
    data['detail'] = this.detail;
    if (this.restriction != null) {
      data['restriction'] = this.restriction!.toJson();
    }
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Restriction {
  String? code;
  String? description;
  String? detail;

  Restriction({this.code, this.description, this.detail});

  Restriction.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    data['detail'] = this.detail;
    return data;
  }
}

class Services {
  String? code;
  String? description;
  String? detail;
  Available? available;
  AverageUnitPrice? averageUnitPrice;
  AverageUnitPrice? price;
  String? bookingCode;
  String? bookingType;

  Services(
      {this.code,
        this.description,
        this.detail,
        this.available,
        this.averageUnitPrice,
        this.price,
        this.bookingCode,
        this.bookingType});

  Services.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    detail = json['detail'];
    available = json['available'] != null
        ? new Available.fromJson(json['available'])
        : null;
    averageUnitPrice = json['average_unit_price'] != null
        ? new AverageUnitPrice.fromJson(json['average_unit_price'])
        : null;
    price = json['price'] != null
        ? new AverageUnitPrice.fromJson(json['price'])
        : null;
    bookingCode = json['booking_code'];
    bookingType = json['booking_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    data['detail'] = this.detail;
    if (this.available != null) {
      data['available'] = this.available!.toJson();
    }
    if (this.averageUnitPrice != null) {
      data['average_unit_price'] = this.averageUnitPrice!.toJson();
    }
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['booking_code'] = this.bookingCode;
    data['booking_type'] = this.bookingType;
    return data;
  }
}

class Available {
  int? seats;

  Available({this.seats});

  Available.fromJson(Map<String, dynamic> json) {
    seats = json['seats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seats'] = this.seats;
    return data;
  }
}

class AverageUnitPrice {
  String? currency;
  int? cents;

  AverageUnitPrice({this.currency, this.cents});

  AverageUnitPrice.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    cents = json['cents'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['cents'] = this.cents;
    return data;
  }
}