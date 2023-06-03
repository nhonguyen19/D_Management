
class TeacherInformationObject {
  int? id;
  int? faculty_ID;
  String? userName;
  String? password;
  String? teacher_Name;
  String? phone_Number;
  String? address;

  TeacherInformationObject({
    this.id,
    this.faculty_ID,
    this.userName,
    this.password,
    this.teacher_Name,
    this.phone_Number,
    this.address
    });

  TeacherInformationObject.fromJson(Map<String, dynamic> json) {
    id = json['ID_Teacher'];
    faculty_ID = json['Faculty_ID'];
    userName = json['Username'];
    password = json['Password'];
    teacher_Name = json['Teacher_Name'];
    phone_Number = json['Phone_Number'];
    address = json['Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID_Teacher '] = id;
    data['Faculty_ID'] = faculty_ID;
    data['Username']=userName;
    data['Password']=password;
    data['Teacher_Name']=teacher_Name;
    data['Phone_Number']=phone_Number;
    data['Address ']=address;
    return data;
  }
}