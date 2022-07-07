
class Prescriptions{
  Prescriptions({required this.medicine,this.med_Discription="no description"});
  String medicine;
  String? med_Discription;
  @override
  String toString(){
    return medicine;
  }

  Map<String, String?> tojson() {
    return {
      "medicine": medicine,
      "med_Discription": med_Discription,
    };
  }
}


