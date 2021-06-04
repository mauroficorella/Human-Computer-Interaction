import 'package:ciak_time/blocs/search_movies_bloc.dart';
import 'package:ciak_time/components/movie_card.dart';
import 'package:flutter/material.dart';

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
    return ListView.builder(
      
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data.results.length,
        itemBuilder: (BuildContext context, int index) {
          
          return Card(
            child: ListTile(
              leading: Image.network(
                  'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
                  fit: BoxFit.cover,
                ),
              title: Text(snapshot.data.results[index].title),
            ),
          );
          /*return MovieCard(
            imageUrl:
                'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
            movieTitle: snapshot.data.results[index].title,
          );*/
        });
  }
}
