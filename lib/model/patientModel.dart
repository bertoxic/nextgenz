class PatientModel {
  List<PatientData>? data;
  int? count;

  PatientModel({this.data, this.count});

  PatientModel.fromJson(List<dynamic> json) {
    if (json.isNotEmpty) {
      data = <PatientData>[];
      json.forEach((v) {
        data!.add(new PatientData.fromJson(v));
      });
    }
    count = json.length;
  }
}

class PatientData {
  String? name;
  String? Gender;
  String? status;
  String? sId;
  int? userID;
  int? age;
  String? date;
  String? dob;
  String? problem;
  int? iV;

  PatientData(
      {this.name,
        this.Gender,
        this.status,
        this.sId,
        this.userID,
        this.age,
        this.date,
        this.dob,
        this.problem,
        this.iV});

  PatientData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    Gender = json['gender'] ;
    status = json['status'];
    sId = json['_id'];
    userID = json['userID'] ;
    age = json['age'] ;
    date = json['date'];
    dob = json['dob'];
    problem = json['problem'];
    iV = json['__v'];
  }
}
