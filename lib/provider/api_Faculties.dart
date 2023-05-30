import 'dart:convert';
import 'package:devide_manager/provider/link_api.dart';
import 'package:http/http.dart' as http;

import '../object/FacultyOject.dart';

class FacultyProvider {

  static List<FacultyObject> parseFaculty(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<FacultyObject>((e) => FacultyObject.fromJson(e)).toList();
}

//lấy danh sách khoa
static Future<List<FacultyObject>> fetchFaculty(http.Client http) async {
  Ngrok ngrok= Ngrok();
  final response =  await http.get(Uri.parse(ngrok.api_Faculties));

  if (response.statusCode == 200) {
    return parseFaculty(response.body);
  } else {
    throw Exception('Failed to load');
  }
}
//thêm khoa
  static Future<bool> addFaculty(String name, String imagePath) async {
     Ngrok ngrok= Ngrok();
    try {
      final response = await http.post(
        Uri.parse(ngrok.api_Faculties), // Thay YOUR_API_URL bằng URL của API thêm khoa
        body: {
          'name': name,
          'image': imagePath,
        },
      );

      if (response.statusCode == 200) {
        // Thêm khoa thành công
        return true;
      } else {
        // Thêm khoa thất bại
        return false;
      }
    } catch (error) {
      print('Error adding faculty: $error');
      throw error; 
    }
}

}
