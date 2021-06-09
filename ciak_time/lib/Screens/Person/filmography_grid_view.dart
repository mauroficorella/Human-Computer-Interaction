import 'package:ciak_time/components/movie_card.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class FilmographyGridView extends StatefulWidget {
  const FilmographyGridView({Key key}) : super(key: key);

  @override
  _FilmographyGridViewState createState() => _FilmographyGridViewState();
}

class _FilmographyGridViewState extends State<FilmographyGridView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Already Watched List"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.amber,
          ),
          label: Text(
            "User",
            style:
                TextStyle(color: Colors.amber, fontFamily: 'Quicksand-Regular'),
          ),
        ),
        leadingWidth: size.width * 0.2,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            child: Row(
              children: [
                Text(
                  "Edit",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: (9 / 13)),
          itemCount: selectedPersonMoviesFromHome.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                movieSelectedFromHome = new Movie(
                  title: selectedPersonMoviesFromHome[index].title,
                  overview: selectedPersonMoviesFromHome[index].overview,
                  voteAverage: selectedPersonMoviesFromHome[index].voteAverage,
                  id: selectedPersonMoviesFromHome[index].id,
                  releaseDate: selectedPersonMoviesFromHome[index].releaseDate,
                  posterPath: selectedPersonMoviesFromHome[index].posterPath,
                );
                Navigator.pushNamed(context, '/movie');
                FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
              },
                          child: MovieCard(
                imageUrl:
                    'https://image.tmdb.org/t/p/original${selectedPersonMoviesFromHome[index].posterPath}',
                movieTitle: selectedPersonMoviesFromHome[index].title,
              ),
            );
          }),
    );
  }
}
