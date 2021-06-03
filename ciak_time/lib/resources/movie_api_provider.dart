import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '2d5faa7cea05a407ab79da921919b5f3';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    final response = await client.get(Uri.parse(
        "http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"));

    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<ItemModel> fetchUpcomingMoviesList() async {
    print("entered");
    final response = await client.get(Uri.parse(
        "http://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey"));

    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
