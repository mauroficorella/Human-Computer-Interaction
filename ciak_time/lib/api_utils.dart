import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie_details_model.dart';

String durationToString(int minutes) {
  if (minutes != null) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0]} h ${parts[1].padLeft(2, '0')} min';
  } else {
    return "Duration: Unknown";
  }
}

String getGenresNames(List<Genres> genres) {
  //print("genres: " + genres.toString());
  if (genres.length != 0) {
    String allGenres = '';
    for (var i = 0; i < genres.length; i++) {
      allGenres = allGenres + genres[i].name;
      if (i != genres.length - 1) {
        allGenres = allGenres + ", ";
      }
    }
    return allGenres;
  } else {
    return "Genre: Unknown";
  }
}

String getReleaseDate(releaseDate) {
  if (releaseDate != "") {
    return releaseDate;
  } else if (releaseDate == "") {
    return "Date: Unknown";
  } else {
    return "Date: Unknown";
  }
}

String getOverview() {
  if (movieSelectedFromHome.overview != null) {
    return movieSelectedFromHome.overview;
  } else {
    return "Unknown";
  }
}