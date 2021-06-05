import 'dart:async';
import 'package:ciak_time/models/movie_images_model.dart';
import 'package:ciak_time/models/person_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/movie_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '2d5faa7cea05a407ab79da921919b5f3';

  Future<MovieModel> fetchPopularMovieList() async {
    //print("entered");
    final response = await client.get(Uri.parse(
        "http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"));

    //print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<MovieModel> fetchUpcomingMovieList() async {
    //print("entered");
    final response = await client.get(Uri.parse(
        "http://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey"));

    //print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<PersonModel> fetchPopularPeopleList() async {
    //print("entered");
    final response = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/person/popular?api_key=$_apiKey"));

    //print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return PersonModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<MovieModel> fetchSearchResultsList(queryString) async {
    //print("entered");
    final response = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/search/movie?api_key=$_apiKey&query=$queryString&include_adult=false"));

    //print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<MovieImagesModel> fetchMovieImagesList(movieId) async {
    final response = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId/images?api_key=$_apiKey&language=en-US&include_image_language=en"));

    //print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieImagesModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
