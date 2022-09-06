
class PrescriptionModel{
  PrescriptionModel({required this.medicine,this.othersDescription="no description"});
  String medicine;
  String? othersDescription;
  String? dose;
  String? duration;
  @override
  String toString(){
    return medicine;
  }

  Map<String, String?> toJson() {
    return {
      "medicine": medicine,
      "othersDescription": othersDescription,
      "dose": dose,
      "duration": duration,
    };
  }
}


