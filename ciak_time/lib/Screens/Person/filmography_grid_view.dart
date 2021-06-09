import 'package:ciak_time/components/movie_card.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

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
            return MovieCard(
              imageUrl:
                  'https://image.tmdb.org/t/p/original${selectedPersonMoviesFromHome[index].posterPath}',
              movieTitle: selectedPersonMoviesFromHome[index].title,
            );
          }),
    );
  }
}
