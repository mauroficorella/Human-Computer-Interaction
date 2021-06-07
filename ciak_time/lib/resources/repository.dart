import 'dart:async';
import 'package:ciak_time/Screens/Movie/movie_details.dart';
import 'package:ciak_time/models/movie_cast_model.dart';
import 'package:ciak_time/models/movie_details_model.dart';
import 'package:ciak_time/models/movie_images_model.dart';
import 'package:ciak_time/models/movie_model.dart';
import 'package:ciak_time/models/person_model.dart';
import 'package:ciak_time/models/watch_providers_model.dart';

import 'movie_api_provider.dart';

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
  Future<MovieDetailsModel> fetchMovieDetailsResults(movieId) =>
      moviesApiProvider.fetchMovieDetailsList(movieId);
  Future<WatchProvidersModel> fetchWatchProvidersResults(movieId) =>
      moviesApiProvider.fetchWatchProvidersList(movieId);
  Future<MovieCastModel> fetchMovieCastResults(movieId) =>
      moviesApiProvider.fetchMovieCastList(movieId);
}
