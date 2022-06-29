class DoctorModel {
  List<Data>? data;
  int? count;

  DoctorModel({this.data, this.count});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Data {
  Hospital? hospital;
  Registration? registration;
  Bank? bank;
  String? gender;
  String? emailId;
  int? mobileNumber;
  Null? dateOfBirth;
  String? city;
  String? state;
  List<String>? degrees;
  String? specialty;
  String? summary;
  int? consultationFees;
  List<String>? languages;
  bool? approved;
  String? sId;
  String? name;
  int? iV;
  String? fcmtoken;
  Address? address;

  Data(
      {this.hospital,
        this.registration,
        this.bank,
        this.gender,
        this.emailId,
        this.mobileNumber,
        this.dateOfBirth,
        this.city,
        this.state,
        this.degrees,
        this.specialty,
        this.summary,
        this.consultationFees,
        this.languages,
        this.approved,
        this.sId,
        this.name,
        this.iV,
        this.fcmtoken,
        this.address});

  Data.fromJson(Map<String, dynamic> json) {
    hospital = json['hospital'] != null
        ? new Hospital.fromJson(json['hospital'])
        : null;
    registration = json['registration'] != null
        ? new Registration.fromJson(json['registration'])
        : null;
    bank = json['bank'] != null ? new Bank.fromJson(json['bank']) : null;
    gender = json['gender'];
    emailId = json['emailId'];
    mobileNumber = json['mobileNumber'];
    dateOfBirth = json['dateOfBirth'];
    city = json['city'];
    state = json['state'];
    degrees = json['degrees'].cast<String>();
    specialty = json['specialty'];
    summary = json['summary'];
    consultationFees = json['consultationFees'];
    languages = json['languages'].cast<String>();
    approved = json['approved'];
    sId = json['_id'];
    name = json['name'];
    iV = json['__v'];
    fcmtoken = json['fcmtoken'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.hospital != null) {
      data['hospital'] = this.hospital!.toJson();
    }
    if (this.registration != null) {
      data['registration'] = this.registration!.toJson();
    }
    if (this.bank != null) {
      data['bank'] = this.bank!.toJson();
    }
    data['gender'] = this.gender;
    data['emailId'] = this.emailId;
    data['mobileNumber'] = this.mobileNumber;
    data['dateOfBirth'] = this.dateOfBirth;
    data['city'] = this.city;
    data['state'] = this.state;
    data['degrees'] = this.degrees;
    data['specialty'] = this.specialty;
    data['summary'] = this.summary;
    data['consultationFees'] = this.consultationFees;
    data['languages'] = this.languages;
    data['approved'] = this.approved;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['__v'] = this.iV;
    data['fcmtoken'] = this.fcmtoken;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Hospital {
  String? hospitalType;
  String? name;
  String? address;
  String? city;
  Null? state;
  int? pincode;

  Hospital(
      {this.hospitalType,
        this.name,
        this.address,
        this.city,
        this.state,
        this.pincode});

  Hospital.fromJson(Map<String, dynamic> json) {
    hospitalType = json['hospitalType'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hospitalType'] = this.hospitalType;
    data['name'] = this.name;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    return data;
  }
}

class Registration {
  String? number;
  String? council;

  Registration({this.number, this.council});

  Registration.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    council = json['council'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['council'] = this.council;
    return data;
  }
}

class Bank {
  Null? accountNo;
  String? bank;
  String? branch;
  String? accountHolderName;
  String? accountType;
  String? ifsc;

  Bank(
      {this.accountNo,
        this.bank,
        this.branch,
        this.accountHolderName,
        this.accountType,
        this.ifsc});

  Bank.fromJson(Map<String, dynamic> json) {
    accountNo = json['accountNo'];
    bank = json['bank'];
    branch = json['branch'];
    accountHolderName = json['accountHolderName'];
    accountType = json['accountType'];
    ifsc = json['ifsc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountNo'] = this.accountNo;
    data['bank'] = this.bank;
    data['branch'] = this.branch;
    data['accountHolderName'] = this.accountHolderName;
    data['accountType'] = this.accountType;
    data['ifsc'] = this.ifsc;
    return data;
  }
}

class Address {
  String? address;
  int? pincode;
  String? city;

  Address({this.address, this.pincode, this.city});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    pincode = json['pincode'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['city'] = this.city;
    return data;
  }
}
