import 'dart:convert';
import 'package:http/http.dart' as http;

import '../object/FacultyOject.dart';

class FacultyProvider {

  static List<FacultyObject> parseFaculty(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<FacultyObject>((e) => FacultyObject.fromJson(e)).toList();
}

static Future<List<FacultyObject>> fetchFaculty(http.Client http) async {
 const String url= 'https://29ed-115-79-225-122.ngrok-free.app/api/faculties';
  final response =  await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return parseFaculty(response.body);
  } else {
    throw Exception('Failed to load');
  }
}

}
