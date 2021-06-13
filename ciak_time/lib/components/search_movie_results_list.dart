import 'package:ciak_time/blocs/search_movies_bloc.dart';
import 'package:ciak_time/components/movie_card.dart';
import 'package:ciak_time/components/rating.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import '../models/movie_model.dart';

class SearchMovieResultsList extends StatelessWidget {
  final String queryString;

  const SearchMovieResultsList({Key key, @required this.queryString})
      : super(key: key);

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

  Widget returnImage(snapshot, index, size) {
    if (snapshot.data.results[index].posterPath != null) {
      return Container(
        height: size.width * 0.45,
        width: size.width * 0.25,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      //print(snapshot.data.results[index].title);
      return Container(
          height: size.width * 0.45,
          width: size.width * 0.25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey),
          child: Icon(Icons.image));
    }
  }

  Widget buildList(AsyncSnapshot<MovieModel> snapshot, size) {
    //snapshot.data.results[]
    if (snapshot.data.results.isEmpty) {
      return Center(child: Text("No results found"));
    }
    else {
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
                  child: Row(children: <Widget>[
                    returnImage(snapshot, index, size),
                    SizedBox(width: size.width * 0.04),
                    Container(
                      width: size.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data.results[index].title,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: size.height * 0.025,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          RatingUnclickable(
                              unratedColor: Colors.grey,
                              rate: snapshot.data.results[index].voteAverage),
                        ],
                      ),
                    ),
                  ]),
                ),
                onTap: () {
                  movieSelectedFromSearch = new Movie(
                    title: snapshot.data.results[index].title,
                    overview: snapshot.data.results[index].overview,
                    voteAverage: snapshot.data.results[index].voteAverage,
                    id: snapshot.data.results[index].id,
                    releaseDate: snapshot.data.results[index].releaseDate,
                    posterPath: snapshot.data.results[index].posterPath,
                  );

                  Navigator.pushNamed(context, '/movie');
                  FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
                },
              ),
            );
          }),
    );
    }
    
  }
}
