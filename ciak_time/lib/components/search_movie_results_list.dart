import 'package:ciak_time/blocs/search_movies_bloc.dart';
import 'package:ciak_time/components/movie_card.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import '../models/movie_model.dart';

class SearchMovieResultsList extends StatelessWidget {
  final String queryString;

  const SearchMovieResultsList({Key key, @required this.queryString})
      : super(key: key);

  /*SearchMovieResultsList(String queryString) {
    this.queryString = queryString;
  }*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bloc = SearchMoviesBloc(queryString);
    bloc.fetchSearchMovieResults();
    return StreamBuilder(
      stream: bloc.searchMovies,
      builder: (context, AsyncSnapshot<MovieModel> snapshot) {
        if (snapshot.hasData) {
          return buildList(snapshot, size);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        return Center(
            child: CircularProgressIndicator(
          //backgroundColor: Colors.amber,
          color: Colors.amber,
        ));
      },
    );
  }

  Widget buildList(AsyncSnapshot<MovieModel> snapshot, size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.08),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: snapshot.data.results.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: size.height * 0.2,
              width: size.width * 0.05,
              child: GestureDetector(
                child: Card(
                  child: Row(

                      //contentPadding: EdgeInsets.all(25),
                      children: <Widget>[
                        Image.network(
                          'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: size.width * 0.04),
                        Container(
                          width: size.width * 0.6,
                          child: Text(
                            snapshot.data.results[index].title,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: size.height * 0.025,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),
                ),
                onTap: () {
                  movieSelected = snapshot.data.results[index];
                  debugPrint(movieSelected.title);
                  Navigator.pushNamed(context, '/movie');
                  FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
                },
              ),
            );
            /*return MovieCard(
              imageUrl:
                  'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
              movieTitle: snapshot.data.results[index].title,
            );*/
          }),
    );
  }
}
