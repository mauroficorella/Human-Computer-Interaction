import 'package:ciak_time/api_utils.dart';
import 'package:ciak_time/components/movie_card.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class FilmographyGridView extends StatefulWidget {
  final String personName;
  final String fromWhere;
  const FilmographyGridView(
      {Key key, @required this.personName, @required this.fromWhere})
      : super(key: key);

  @override
  _FilmographyGridViewState createState() => _FilmographyGridViewState();
}

class _FilmographyGridViewState extends State<FilmographyGridView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmography"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.amber,
          ),
          label: Container(
            width: size.width * 0.2,
            child: Text(
              widget.personName,
              style: TextStyle(
                  color: Colors.amber, fontFamily: 'Quicksand-Regular'),
            ),
          ),
        ),
        leadingWidth: size.width * 0.32,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: (9 / 13)),
          itemCount: getCount(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (widget.fromWhere == "Home") {
                  movieSelectedFromHome = new Movie(
                    title: selectedPersonMoviesFromHome[index].title,
                    overview: selectedPersonMoviesFromHome[index].overview,
                    voteAverage:
                        selectedPersonMoviesFromHome[index].voteAverage,
                    id: selectedPersonMoviesFromHome[index].id,
                    releaseDate:
                        selectedPersonMoviesFromHome[index].releaseDate,
                    posterPath: selectedPersonMoviesFromHome[index].posterPath,
                    voteCount: selectedPersonMoviesFromHome[index].voteCount,
                  );
                }
                if (widget.fromWhere == "Search") {
                  movieSelectedFromSearch = new Movie(
                    title: selectedPersonMoviesFromSearch[index].title,
                    overview: selectedPersonMoviesFromSearch[index].overview,
                    voteAverage:
                        selectedPersonMoviesFromSearch[index].voteAverage,
                    id: selectedPersonMoviesFromSearch[index].id,
                    releaseDate:
                        selectedPersonMoviesFromSearch[index].releaseDate,
                    posterPath:
                        selectedPersonMoviesFromSearch[index].posterPath,
                    voteCount: selectedPersonMoviesFromSearch[index].voteCount,
                  );
                }
                if (widget.fromWhere == "User") {
                  movieSelectedFromUser = new Movie(
                    title: selectedPersonMoviesFromUser[index].title,
                    overview: selectedPersonMoviesFromUser[index].overview,
                    voteAverage:
                        selectedPersonMoviesFromUser[index].voteAverage,
                    id: selectedPersonMoviesFromUser[index].id,
                    releaseDate:
                        selectedPersonMoviesFromUser[index].releaseDate,
                    posterPath: selectedPersonMoviesFromUser[index].posterPath,
                    voteCount: selectedPersonMoviesFromUser[index].voteCount,
                  );
                }
                Navigator.pushNamed(context, '/movie',
                    arguments: ScreenArguments("Filmography"));
                FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
              },
              child: getMovieCard(index),
            );
          }),
    );
  }

  int getCount() {
    if (widget.fromWhere == "Home") {
      return selectedPersonMoviesFromHome.length;
    }
    if (widget.fromWhere == "Search") {
      return selectedPersonMoviesFromSearch.length;
    }
    if (widget.fromWhere == "User") {
      return selectedPersonMoviesFromUser.length;
    }
  }

  Widget getMovieCard(index) {
    if (widget.fromWhere == "Home") {
      String imagePath =
          getImagePath(selectedPersonMoviesFromHome[index].posterPath);
      return MovieCard(
        imageUrl: imagePath,
        movieTitle: selectedPersonMoviesFromHome[index].title,
      );
    }
    if (widget.fromWhere == "Search") {
      String imagePath =
          getImagePath(selectedPersonMoviesFromSearch[index].posterPath);
      return MovieCard(
        imageUrl: imagePath,
        movieTitle: selectedPersonMoviesFromSearch[index].title,
      );
    }
    if (widget.fromWhere == "User") {
      String imagePath =
          getImagePath(selectedPersonMoviesFromUser[index].posterPath);
      return MovieCard(
        imageUrl: imagePath,
        movieTitle: selectedPersonMoviesFromUser[index].title,
      );
    }
  }
}
