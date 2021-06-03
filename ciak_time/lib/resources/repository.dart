import 'dart:async';
import 'package:ciak_time/models/person_model.dart';

import 'movie_api_provider.dart';
import '../models/movie_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<MovieModel> fetchPopularMovies() => moviesApiProvider.fetchPopularMovieList();
  Future<MovieModel> fetchUpcomingMovies() => moviesApiProvider.fetchUpcomingMovieList();
  Future<PersonModel> fetchPopularPeople() => moviesApiProvider.fetchPopularPeopleList();
  
}