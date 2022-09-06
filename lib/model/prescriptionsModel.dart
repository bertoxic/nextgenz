
class PrescriptionModel{
  PrescriptionModel({ this.medicine,this.othersDescription="no description",this.dose,this.medicineType});
  String? medicine;
  String? othersDescription;
  String? dose;
  String? duration;
  String? medicineType;
  // @override
  // String toString(){
  //   return medicine;
  // }

  Map<String, String?> toJson() {
    return {
      "medicine": medicine,
      "othersDescription": othersDescription,
      "dose": dose,
      "duration": duration,
      "medicineType":medicineType,
    };
  }

  PrescriptionModel.fromJson(Map<String, dynamic> json){
    medicine=json["medicine"];
  }

  PrescriptionModel fromxJson(Map<String, dynamic> json){
   return PrescriptionModel(
     medicine: json['medicine']
   );
  }
}


