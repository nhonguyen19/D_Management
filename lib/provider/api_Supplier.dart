import 'dart:convert';
import 'package:http/http.dart' as http;

import '../object/SupplierObject.dart';

class SupplierProvider {

  static List<SupplierObject> parseSupplier(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<SupplierObject>((e) => SupplierObject.fromJson(e)).toList();
}

static Future<List<SupplierObject>> fetchSupplier(http.Client http) async {
 const String url= 'https://29ed-115-79-225-122.ngrok-free.app/api/suppliers';
  final response =  await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return parseSupplier(response.body);
  } else {
    throw Exception('Failed to load');
  }
}

}
