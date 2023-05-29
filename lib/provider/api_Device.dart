import 'dart:convert';
import 'package:devide_manager/object/DeviceObject.dart';
import 'package:http/http.dart' as http;

class DeviceProvider {

  static List<DeviceObject> parseDevice(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<DeviceObject>((e) => DeviceObject.fromJson(e)).toList();
}

static Future<List<DeviceObject>> fetchDevice(http.Client http) async {
 const String url= 'https://29ed-115-79-225-122.ngrok-free.app/api/devices';
  final response =  await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return parseDevice(response.body);
  } else {
    throw Exception('Failed to load');
  }
}

}
