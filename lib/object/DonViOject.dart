class DonViObject {
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  DonViObject({this.id, this.name});

  DonViObject.fromJson(Map<String, dynamic> json) {
    id = json['Faculty_ID'];
    name = json['Faculty_Name'];
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Faculty_ID'] = this.id;
    data['Faculty_Name'] = this.name;
    data['Image']=this.image;
    return data;
  }
}