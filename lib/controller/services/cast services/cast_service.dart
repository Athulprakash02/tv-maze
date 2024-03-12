import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tv_maze/model/cast%20model/cast_model.dart';

class CastService {
  final String url = 'https://api.tvmaze.com/shows/';

  Future<List<CastModel>> fetchCast(String id) async {
    List<CastModel> results = [];
    try {
      final response = await http.get(Uri.parse('$url$id/cast'));
      
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        results = jsonData.map((data) => CastModel.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load cast data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching cast data: $e');
    }
    return results;
  }
}
