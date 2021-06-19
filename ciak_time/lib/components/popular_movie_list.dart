import 'package:ciak_time/blocs/popular_movies_bloc.dart';
import 'package:ciak_time/components/movie_card.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie.dart';
import 'package:ciak_time/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class PopularMovieList extends StatelessWidget {
  final String fromWhere;

  const PopularMovieList({Key key, @required this.fromWhere}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bloc.fetchPopularMovies();
    return StreamBuilder(
      stream: bloc.popularMovies,
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
    return Container(
      height: size.height * 0.26,
      //color: Colors.amber,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.results.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: MovieCard(
                imageUrl:
                    'https://image.tmdb.org/t/p/original${snapshot.data.results[index].posterPath}',
                movieTitle: snapshot.data.results[index].title,
              ),
              onTap: () {
                String fromWhereArg;
                if (fromWhere == "Home") {
                  //movieSelectedFromHome = snapshot.data.results[index];
                  movieSelectedFromHome = new Movie(
                    title: snapshot.data.results[index].title,
                    overview: snapshot.data.results[index].overview,
                    voteAverage: snapshot.data.results[index].voteAverage,
                    id: snapshot.data.results[index].id,
                    releaseDate: snapshot.data.results[index].releaseDate,
                    posterPath: snapshot.data.results[index].posterPath,
                    voteCount: snapshot.data.results[index].voteCount,
                  );
                  fromWhereArg = "Home";
                }
                if (fromWhere == "Search") {
                  movieSelectedFromSearch = new Movie(
                    title: snapshot.data.results[index].title,
                    overview: snapshot.data.results[index].overview,
                    voteAverage: snapshot.data.results[index].voteAverage,
                    id: snapshot.data.results[index].id,
                    releaseDate: snapshot.data.results[index].releaseDate,
                    posterPath: snapshot.data.results[index].posterPath,
                    voteCount: snapshot.data.results[index].voteCount,
                  );
                  fromWhereArg = "Search";
                }

                Navigator.pushNamed(context, '/movie',
                    arguments: ScreenArguments(fromWhereArg));

                FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
              },
            );
          }),
    );
  }
}
