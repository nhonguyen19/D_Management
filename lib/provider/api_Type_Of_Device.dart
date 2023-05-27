import 'dart:convert';
import 'package:devide_manager/object/TypeOfDeviceObject.dart';
import 'package:http/http.dart' as http;

class TypeOfDeviceProvider {

  static List<TypeOfDiviceObject> parseTypeOfDevice(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<TypeOfDiviceObject>((e) => TypeOfDiviceObject.fromJson(e)).toList();
}

static Future<List<TypeOfDiviceObject>> fetchTypeOfDivice(http.Client http) async {
 const String url= 'https://x2rso.localto.net/api/type-of-devices';
  final response =  await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return parseTypeOfDevice(response.body);
  } else {
    throw Exception('Failed to load');
  }
}

}
