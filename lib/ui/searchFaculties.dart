
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MySearchFunction {
  static Future<List<String>> search(String query) async {
    final response = await http.get(Uri.parse('https://x2rso.localto.net/api/faculties?q=$query'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<String> searchResults = List<String>.from(data);
      return searchResults;
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
