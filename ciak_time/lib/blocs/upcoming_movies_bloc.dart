import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/movie_model.dart';

class UpcomingMoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<MovieModel>();

  Stream<MovieModel> get upcomingMovies => _moviesFetcher.stream;

  fetchUpcomingMovies() async {
    MovieModel movieModel = await _repository.fetchUpcomingMovies();
    _moviesFetcher.sink.add(movieModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = UpcomingMoviesBloc();