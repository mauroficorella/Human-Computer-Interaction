import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/movie_model.dart';

class PopularMoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<MovieModel>();

  Stream<MovieModel> get popularMovies => _moviesFetcher.stream;

  fetchPopularMovies() async {
    MovieModel movieModel = await _repository.fetchPopularMovies();
    _moviesFetcher.sink.add(movieModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = PopularMoviesBloc();
