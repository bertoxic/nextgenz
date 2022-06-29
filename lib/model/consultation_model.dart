class ConsultationModel {
  List<ConsultationData>? data;
  int? count;

  ConsultationModel({this.data, this.count});

  ConsultationModel.fromJson(List<dynamic> json) {
    if (json.isNotEmpty) {
      data = <ConsultationData>[];
      json.forEach((v) {
        data!.add(new ConsultationData.fromJson(v));
      });
    }
    count = json.length;
  }
}

class ConsultationData {
  Feedback? feedback;
  Patient? patient;
  String? status;
  String? sId;
  User? user;
  Doctor? doctor;
  String? date;
  String? slot;
  String? problem;
  int? iV;

  ConsultationData(
      {this.feedback,
      this.patient,
      this.status,
      this.sId,
      this.user,
      this.doctor,
      this.date,
      this.slot,
      this.problem,
      this.iV});

  ConsultationData.fromJson(Map<String, dynamic> json) {
    feedback = json['feedback'] != null
        ? new Feedback.fromJson(json['feedback'])
        : null;
    patient =
        json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
    status = json['status'];
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    doctor =
        json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    date = json['date'];
    slot = json['slot'];
    problem = json['problem'];
    iV = json['__v'];
  }
}

class Feedback {
  int? rating;
  String? text;

  Feedback({this.rating, this.text});

  Feedback.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    text = json['text'];
  }
}

class Patient {
  String? type;
  int? age;
  String? gender;

  Patient({this.type, this.age, this.gender});

  Patient.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    age = json['age'];
    gender = json['gender'];
  }
}

class User {
  Address? address;
  String? sId;
  String? name;
  String? gender;
  String? emailId;
  int? mobileNumber;
  String? fcmtoken;

  User(
      {this.address,
      this.sId,
      this.name,
      this.gender,
      this.emailId,
      this.mobileNumber,
      this.fcmtoken});

  User.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    sId = json['_id'];
    name = json['name'];
    gender = json['gender'];
    emailId = json['emailId'];
    mobileNumber = json['mobileNumber'];
    fcmtoken = json['fcmtoken'];
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
}

class Doctor {
  Hospital? hospital;
  Registration? registration;
  Bank? bank;
  String? gender;
  String? emailId;
  int? mobileNumber;
  String? dateOfBirth;
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

  Doctor(
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
      this.fcmtoken});

  Doctor.fromJson(Map<String, dynamic> json) {
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
  }
}

class Hospital {
  String? hospitalType;
  String? name;
  String? address;
  String? city;
  String? state;
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
}

class Registration {
  String? number;
  String? council;

  Registration({this.number, this.council});

  Registration.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    council = json['council'];
  }
}

class Bank {
  int? accountNo;
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
}
