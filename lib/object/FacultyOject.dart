class FacultyObject {
  int? id;
  String? name;
  String? image;

  FacultyObject({this.id, this.name});

  FacultyObject.fromJson(Map<String, dynamic> json) {
    id = json['Faculty_ID'];
    name = json['Faculty_Name'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Faculty_ID'] = id;
    data['Faculty_Name'] = name;
    data['Image']=image;
    return data;
  }
}