
class ConfigurationObject {
  int? id;
  int? Device_Type_ID;
  int? Configuration_Detail_ID;

  ConfigurationObject({
    this.id,
    this.Device_Type_ID,
    this.Configuration_Detail_ID
    });

  ConfigurationObject.fromJson(Map<String, dynamic> json) {
    id = json['ID_Configuration'];
    Device_Type_ID = json['Device_Type_ID'];
    Configuration_Detail_ID = json['Configuration_Detail_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID_Configuration'] = id;
    data['Device_Type_ID'] = Device_Type_ID;
    data['Configuration_Detail_ID']=Configuration_Detail_ID;
    return data;
  }
}