import 'dart:async';
import 'package:ciak_time/models/movie_cast_model.dart';
import 'package:ciak_time/models/movie_details_model.dart';
import 'package:ciak_time/models/movie_images_model.dart';
import 'package:ciak_time/models/movie_model.dart';
import 'package:ciak_time/models/person_details_model.dart';
import 'package:ciak_time/models/person_model.dart';
import 'package:ciak_time/models/person_movies_model.dart';
import 'package:ciak_time/models/reviews_model.dart';
import 'package:ciak_time/models/watch_providers_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';


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
      throw Exception('Failed to load popular movies');
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
      throw Exception('Failed to load upcoming movies');
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
      throw Exception('Failed to load popular people');
    }
  }

  Future<MovieModel> fetchSearchResultsList(queryString) async {
    //print("entered");
    final response = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/search/movie?api_key=$_apiKey&query=$queryString&include_adult=true"));

    //print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load search results');
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
      throw Exception('Failed to load movie images');
    }
  }

  Future<MovieDetailsModel> fetchMovieDetailsList(movieId) async {
    final response = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId?api_key=$_apiKey&language=en-US"));
    //print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieDetailsModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load movie details');
    }
  }

  Future<WatchProvidersModel> fetchWatchProvidersList(movieId) async {
    final response = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId/watch/providers?api_key=$_apiKey"));

    //print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return WatchProvidersModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load watch providers');
    }
  }

  Future<MovieCastModel> fetchMovieCastList(movieId) async {
    final response = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$_apiKey&language=en-US"));

    //print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieCastModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load movie cast');
    }
  }

  Future<PersonDetailsModel> fetchPersonDetails(personId) async {
    final response = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/person/$personId?api_key=$_apiKey&language=en-US"));

    //print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return PersonDetailsModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load person details');
    }
  }

  Future<PersonMoviesModel> fetchPersonMoviesList(personId) async {
    final response = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/person/$personId/movie_credits?api_key=$_apiKey&language=en-US"));

    //print(response.body.toString())
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return PersonMoviesModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load person movies');
    }
  }

  Future<ReviewsModel> fetchReviewsList(movieId) async {
    final response = await client.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId/reviews?api_key=$_apiKey&language=en-US"));

    //print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ReviewsModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load reviews');
    }
  }
}
