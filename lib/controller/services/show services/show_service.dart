import 'dart:convert';

import 'package:tv_maze/model/shows%20model/shows_model.dart';
import 'package:http/http.dart' as http;

class ShowService {
  final String url = 'https://api.tvmaze.com/shows';

  Future<List<ShowsModel>> fetchShows() async {
    List<ShowsModel> results= [];
    try {
     
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('object');
        List<dynamic> jsonData = json.decode(response.body);
        results =  jsonData.map((data) => ShowsModel.fromJson(data)).toList();
      }
    } catch (e) {
      print(e.toString());
   
    }
    return results;
  }
}
