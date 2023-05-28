import 'dart:convert';
import 'package:devide_manager/object/BrandObject.dart';
import 'package:http/http.dart' as http;

class BrandProvide {

  static List<BrandObject> parseBrand(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<BrandObject>((e) => BrandObject.fromJson(e)).toList();
}

static Future<List<BrandObject>> fetchBrand(http.Client http) async {
 const String url= 'https://x2rso.localto.net/api/brands';
  final response =  await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return parseBrand(response.body);
  } else {
    throw Exception('Failed to load');
  }
}

}
