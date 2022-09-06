

class LabModel {
  LabModel({this.name, this.description});
  String? name;
  String? description;

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
    };
  }
}
