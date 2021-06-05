import 'dart:async';
import 'package:ciak_time/models/movie_images_model.dart';
import 'package:ciak_time/models/person_model.dart';

import 'movie_api_provider.dart';
import '../models/movie_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();
  String queryString = "";

  Future<MovieModel> fetchPopularMovies() =>
      moviesApiProvider.fetchPopularMovieList();
  Future<MovieModel> fetchUpcomingMovies() =>
      moviesApiProvider.fetchUpcomingMovieList();
  Future<PersonModel> fetchPopularPeople() =>
      moviesApiProvider.fetchPopularPeopleList();
  Future<MovieModel> fetchSearchResults(queryString) =>
      moviesApiProvider.fetchSearchResultsList(queryString);
  Future<MovieImagesModel> fetchMovieImagesResults(movieId) =>
      moviesApiProvider.fetchMovieImagesList(movieId);
}
