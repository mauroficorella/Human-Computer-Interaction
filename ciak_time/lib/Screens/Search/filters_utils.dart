import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/search_results_model.dart';

bool isFiltersApplied() {
  bool filterSelected = false;

  if (selected_rate ||
      selected_most_added ||
      selected_most_recent ||
      drama ||
      comedy ||
      action ||
      crime ||
      fantasy ||
      thriller ||
      family ||
      anime ||
      horror) {
    filterSelected = true;
  }

  return filterSelected;
}

void checkFilterResults(
    List<SearchResults> results, SearchResults searchResults, dynamic v) {
  if (drama == true) {
    if (v.values.toList()[2].contains(genresIds[0]["Drama"]) &&
        !filteredMoviesList.contains(searchResults.id)) {
      //filteredMoviesList.add
      filteredMoviesList.add(searchResults.id);
      results.add(searchResults);
    }
  }
  if (comedy == true) {
    if (v.values.toList()[2].contains(genresIds[0]["Comedy"]) &&
        !filteredMoviesList.contains(searchResults.id)) {
      filteredMoviesList.add(searchResults.id);
      results.add(searchResults);
    }
  }
  if (action == true) {
    if (v.values.toList()[2].contains(genresIds[0]["Action"]) &&
        !filteredMoviesList.contains(searchResults.id)) {
      filteredMoviesList.add(searchResults.id);
      results.add(searchResults);
    }
  }
  if (crime == true) {
    if (v.values.toList()[2].contains(genresIds[0]["Crime"]) &&
        !filteredMoviesList.contains(searchResults.id)) {
      filteredMoviesList.add(searchResults.id);
      results.add(searchResults);
    }
  }
  if (fantasy == true) {
    if (v.values.toList()[2].contains(genresIds[0]["Fantasy"]) &&
        !filteredMoviesList.contains(searchResults.id)) {
      filteredMoviesList.add(searchResults.id);
      results.add(searchResults);
    }
  }
  if (thriller == true) {
    if (v.values.toList()[2].contains(genresIds[0]["Thriller"]) &&
        !filteredMoviesList.contains(searchResults.id)) {
      filteredMoviesList.add(searchResults.id);
      results.add(searchResults);
    }
  }
  if (family == true) {
    if (v.values.toList()[2].contains(genresIds[0]["Family"]) &&
        !filteredMoviesList.contains(searchResults.id)) {
      filteredMoviesList.add(searchResults.id);
      results.add(searchResults);
    }
  }
  if (anime == true) {
    if (v.values.toList()[2].contains(genresIds[0]["Animation"]) &&
        !filteredMoviesList.contains(searchResults.id)) {
      filteredMoviesList.add(searchResults.id);
      results.add(searchResults);
    }
  }
  if (horror == true) {
    if (v.values.toList()[2].contains(genresIds[0]["Horror"]) &&
        !filteredMoviesList.contains(searchResults.id)) {
      filteredMoviesList.add(searchResults.id);
      results.add(searchResults);
    }
  }
}
