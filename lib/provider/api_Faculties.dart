import 'dart:convert';
import 'dart:io';
import 'package:devide_manager/provider/api_link.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../object/FacultyOject.dart';

class FacultyProvider {
  static List<FacultyObject> parseFaculty(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<FacultyObject>((e) => FacultyObject.fromJson(e)).toList();
  }

  //lấy danh sách khoa
  static Future<List<FacultyObject>> fetchFaculty(
      http.Client httpClient) async {
    Ngrok ngrok = Ngrok();
    final response = await httpClient.get(Uri.parse(ngrok.api_Faculties));

    if (response.statusCode == 200) {
      return parseFaculty(response.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  static Future<http.Response> getImageFromFirebaseStorage(
      String imageUrl) async {
    return http.get(Uri.parse(imageUrl));
  }

  // Thêm khoa

// Thêm hình ảnh vào API
  static Future<bool> addFaculty(
  String name, String imagePath, int status) async {
  try {
    Directory appDir = await getTemporaryDirectory();
    String fullImagePath = '${appDir.path}/$imagePath';

    if (!File(fullImagePath).existsSync()) {
      throw Exception('Image file does not exist');
    }

    String imageUrl = await uploadImageToApi(fullImagePath);

    Ngrok ngrok = Ngrok();

    final response = await http.post(
      Uri.parse(ngrok.api_Faculties),
      body: {
        'facultyName': name,
        'image': imageUrl,
        'status': status.toString(),
      },
    );

    if (response.statusCode == 200) {
      return true; // Faculty added successfully
    } else {
      return false; // Failed to add faculty
    }
  } catch (error) {
    print('Error adding faculty: $error');
    throw Exception('Failed to add faculty: $error');
  }
}

// Upload hình ảnh vào API
static Future<String> uploadImageToApi(String imagePath) async {
  try {
    File imageFile = File(imagePath);

    if (!imageFile.existsSync()) {
      throw Exception('Image file does not exist');
    }

    final firebase_storage.Reference storageRef =
        firebase_storage.FirebaseStorage.instance.ref();
    final String fileName = imageFile.path.split('/').last;

    // Tải hình ảnh lên Firebase Storage
    await storageRef.child(fileName).putFile(imageFile);

    // Lấy URL của hình ảnh từ Firebase Storage
    final imageUrl = await storageRef.child(fileName).getDownloadURL();

    return imageUrl;
  } catch (error) {
    print('Error uploading image to API: $error');
    throw Exception('Failed to upload image to API: $error');
  }
}

}
