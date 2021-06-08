import 'package:ciak_time/components/movie_card.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class AllMoviesInWList extends StatefulWidget {
  const AllMoviesInWList({Key key}) : super(key: key);

  @override
  _AllMoviesInWListState createState() => _AllMoviesInWListState();
}

class _AllMoviesInWListState extends State<AllMoviesInWList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Watchlist"),
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
          itemCount: watchList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: MovieCard(
                  imageUrl:
                      'https://image.tmdb.org/t/p/original${watchList[index].posterPath}',
                  movieTitle: watchList[index].title),
              onTap: () {
                movieSelected = watchList[index];
                Navigator.pushNamed(context, '/movie');
                FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
              },
            );
          }),
    );
  }
}
