import 'package:ciak_time/components/movie_card.dart';
import 'package:flutter/material.dart';

import '../models/movie_model.dart';
import '../blocs/popular_movies_bloc.dart';

class PopularMovieList extends StatelessWidget {
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
            return MovieCard(
              imageUrl:
                  'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
              movieTitle: snapshot.data.results[index].title,
            );
          }),
    );
  }
}