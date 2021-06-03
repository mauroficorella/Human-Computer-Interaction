import 'package:ciak_time/components/movie_card.dart';
import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bloc.fetchAllMovies();
    return StreamBuilder(
      stream: bloc.allMovies,
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        if (snapshot.hasData) {
          return buildList(snapshot, size);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot, size) {
    return Container(
      height: size.height * 0.24,
      color: Colors.white,
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
