import 'package:ciak_time/blocs/upcoming_movies_bloc.dart';
import 'package:ciak_time/components/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

import '../models/movie_model.dart';

Results movieSelected;

class UpcomingMovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bloc.fetchUpcomingMovies();
    return StreamBuilder(
      stream: bloc.upcomingMovies,
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
      color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.results.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: MovieCard(
                imageUrl:
                    'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
                movieTitle: snapshot.data.results[index].title,
              ),
              onTap: () {
                movieSelected = snapshot.data.results[index];
                Navigator.pushNamed(context, '/movie');
                FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
              },
            );
          }),
    );
  }
}
