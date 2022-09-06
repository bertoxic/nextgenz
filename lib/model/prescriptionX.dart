class PrescriptionX {
  String? sId;
  String? consultation;
  List<Medicines>? medicines;
  List<LabTests>? labTests;
  String? date;
  int? iV;

  PrescriptionX(
      {this.sId,
        this.consultation,
        this.medicines,
        this.labTests,
        this.date,
        this.iV});

  PrescriptionX.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    consultation = json['consultation'];
    if (json['medicines'] != null) {
      medicines = <Medicines>[];
      json['medicines'].forEach((v) {
        medicines!.add(new Medicines.fromJson(v));
      });
    }
    if (json['labTests'] != null) {
      labTests = <LabTests>[];
      json['labTests'].forEach((v) {
        labTests!.add(new LabTests.fromJson(v));
      });
    }
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['consultation'] = this.consultation;
    if (this.medicines != null) {
      data['medicines'] = this.medicines!.map((v) => v.toJson()).toList();
    }
    if (this.labTests != null) {
      data['labTests'] = this.labTests!.map((v) => v.toJson()).toList();
    }
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}

class Medicines {
  int? morning;
  int? afternoon;
  int? night;
  bool? beforeFood;
  int? duration;
  String? sId;
  String? medicine;
  String? othersDescription;

  Medicines(
      {this.morning,
        this.afternoon,
        this.night,
        this.beforeFood,
        this.duration,
        this.sId,
        this.medicine,
        this.othersDescription});

  Medicines.fromJson(Map<String, dynamic> json) {
    morning = json['morning'];
    afternoon = json['afternoon'];
    night = json['night'];
    beforeFood = json['beforeFood'];
    duration = json['duration'];
    sId = json['_id'];
    medicine = json['medicine'];
    othersDescription = json['othersDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['morning'] = this.morning;
    data['afternoon'] = this.afternoon;
    data['night'] = this.night;
    data['beforeFood'] = this.beforeFood;
    data['duration'] = this.duration;
    data['_id'] = this.sId;
    data['medicine'] = this.medicine;
    data['othersDescription'] = this.othersDescription;
    return data;
  }
}

class LabTests {
  String? sId;
  String? name;
  String? description;

  LabTests({this.sId, this.name, this.description});

  LabTests.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
