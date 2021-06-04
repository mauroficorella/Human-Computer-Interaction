import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/movie_model.dart';

class SearchMoviesBloc {
  final _repository = Repository();
  String queryString = "";

   SearchMoviesBloc(String queryString) {
    this.queryString = queryString;  
  }

  final _moviesFetcher = PublishSubject<MovieModel>();

  Stream<MovieModel> get searchMovies => _moviesFetcher.stream;

  fetchSearchMovieResults() async {
    MovieModel movieModel = await _repository.fetchSearchResults(queryString);
    _moviesFetcher.sink.add(movieModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

//final bloc = SearchMoviesBloc();
