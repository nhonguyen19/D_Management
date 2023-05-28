import 'dart:convert';
import 'package:http/http.dart' as http;

import '../object/RoomObject.dart';

class RoomProvider {

  static List<RoomObject> parseRoom(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<RoomObject>((e) => RoomObject.fromJson(e)).toList();
}

static Future<List<RoomObject>> fetchRoom(http.Client http) async {
 const String url= 'https://x2rso.localto.net/api/rooms';
  final response =  await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return parseRoom(response.body);
  } else {
    throw Exception('Failed to load');
  }
}

}
