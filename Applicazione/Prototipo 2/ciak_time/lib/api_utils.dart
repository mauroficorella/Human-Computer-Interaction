import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

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

Widget getOverviewHome(size) {
  if (movieSelectedFromHome.overview != null) {
    return ReadMoreText(
      movieSelectedFromHome.overview,
      trimLines: 3,
      colorClickableText: kPrimaryColor,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read more',
      trimExpandedText: 'Less',
      moreStyle: TextStyle(
          fontSize: size.width * 0.04,
          fontWeight: FontWeight.bold,
          color: kPrimaryColor),
      style: TextStyle(
        color: Colors.black,
        fontSize: size.height * 0.02,
        fontFamily: 'Quicksand-Regular',
      ),
    );
    //return movieSelectedFromHome.overview;
  } else {
    return Text(
      "Unknown",
      style: TextStyle(
        color: Colors.black,
        fontSize: size.height * 0.02,
        fontFamily: 'Quicksand-Regular',
      ),
    );
  }
}

Widget getOverviewSearch(size) {
  if (movieSelectedFromSearch.overview != null) {
    return ReadMoreText(
      movieSelectedFromSearch.overview,
      trimLines: 3,
      colorClickableText: kPrimaryColor,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read more',
      trimExpandedText: 'Less',
      moreStyle: TextStyle(
          fontSize: size.width * 0.04,
          fontWeight: FontWeight.bold,
          color: kPrimaryColor),
      style: TextStyle(
        color: Colors.black,
        fontSize: size.height * 0.02,
        fontFamily: 'Quicksand-Regular',
      ),
    );
    //return movieSelectedFromHome.overview;
  } else {
    return Text(
      "Unknown",
      style: TextStyle(
        color: Colors.black,
        fontSize: size.height * 0.02,
        fontFamily: 'Quicksand-Regular',
      ),
    );
  }
}

Widget getOverviewUser(size) {
  if (movieSelectedFromUser.overview != null) {
    return ReadMoreText(
      movieSelectedFromUser.overview,
      trimLines: 3,
      colorClickableText: kPrimaryColor,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Read more',
      trimExpandedText: 'Less',
      moreStyle: TextStyle(
          fontSize: size.width * 0.04, fontWeight: FontWeight.bold, color: kPrimaryColor),
      style: TextStyle(
        color: Colors.black,
        fontSize: size.height * 0.02,
        fontFamily: 'Quicksand-Regular',
      ),
    );
    //return movieSelectedFromHome.overview;
  } else {
    return Text(
      "Unknown",
      style: TextStyle(
        color: Colors.black,
        fontSize: size.height * 0.02,
        fontFamily: 'Quicksand-Regular',
      ),
    );
  }
}

String getImagePath(String posterPath) {
  if (posterPath == null) {
    return "http://www.persefone.it/blog/wp-content/themes/photobook/images/blank.png";
  } else {
    return 'https://image.tmdb.org/t/p/original$posterPath';
  }
}
