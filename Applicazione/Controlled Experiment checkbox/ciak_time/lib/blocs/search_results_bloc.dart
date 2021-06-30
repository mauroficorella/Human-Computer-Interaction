import 'package:ciak_time/models/search_results_model.dart';
import 'package:ciak_time/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class SearchResultsBloc {
  final _repository = Repository();
  String queryString = "";

  SearchResultsBloc(String queryString) {
    this.queryString = queryString;
  }

  final _searchResultsFetcher = PublishSubject<SearchResultsModel>();

  Stream<SearchResultsModel> get searchResults => _searchResultsFetcher.stream;

  fetchSearchResults() async {
    SearchResultsModel searchResultsModel =
        await _repository.fetchSearchResults(queryString);
    _searchResultsFetcher.sink.add(searchResultsModel);
  }

  dispose() {
    _searchResultsFetcher.close();
  }
}
