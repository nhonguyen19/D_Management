import 'dart:convert';
import 'package:devide_manager/object/DonViOject.dart';
import 'package:http/http.dart' as http;

class DonViProvider {

  static List<DonViObject> parseDonVi(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<DonViObject>((e) => DonViObject.fromJson(e)).toList();
}

static Future<List<DonViObject>> fetchDonVi(http.Client http) async {
 const String url= 'https://ju3i0.localto.net/api/faculties';
  final response =  await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return parseDonVi(response.body);
  } else {
    throw Exception('Failed to load');
  }
}

}
