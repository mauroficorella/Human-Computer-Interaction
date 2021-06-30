import 'package:ciak_time/api_utils.dart';
import 'package:ciak_time/blocs/person_movies_bloc.dart';
import 'package:ciak_time/components/list_card.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie.dart';
import 'package:ciak_time/models/person_movies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class FilmographyList extends StatelessWidget {
  const FilmographyList({
    Key key,
    @required this.fromWhere,
  }) : super(key: key);

  final String fromWhere;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PersonMoviesBloc bloc;

    if (fromWhere == "Home") {
      
      bloc = PersonMoviesBloc(personSelectedFromHome.id.toString());
    }
    if (fromWhere == "Search") {
      
      bloc = PersonMoviesBloc(personSelectedFromSearch.id.toString());
    }
    if (fromWhere == "User") {
      
      bloc = PersonMoviesBloc(personSelectedFromUser.id.toString());
    }

    selectedPersonMoviesFromHome = [];
    selectedPersonMoviesFromSearch = [];
    selectedPersonMoviesFromUser = [];
    bloc.fetchPersonMoviesResults();

    return StreamBuilder(
      stream: bloc.personMovies,
      builder: (context, AsyncSnapshot<PersonMoviesModel> snapshot) {
        if (snapshot.hasData) {
          for (var i = 0; i < snapshot.data.movies.length; i++) {
            Movie movie = new Movie(
              title: snapshot.data.movies[i].title,
              overview: snapshot.data.movies[i].overview,
              voteAverage: snapshot.data.movies[i].voteAverage,
              id: snapshot.data.movies[i].id,
              releaseDate: snapshot.data.movies[i].releaseDate,
              posterPath: snapshot.data.movies[i].posterPath,
              voteCount: snapshot.data.movies[i].voteCount,
            );
            if (fromWhere == "Home") {
              selectedPersonMoviesFromHome.add(movie);
            }
            if (fromWhere == "Search") {
              selectedPersonMoviesFromSearch.add(movie);
            }
            if (fromWhere == "User") {
              selectedPersonMoviesFromUser.add(movie);
            }
          }

          return buildFilmography(snapshot, size);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        return Center(
            child: CircularProgressIndicator(
          color: Colors.amber,
        ));
      },
    );
  }

  Widget buildFilmography(AsyncSnapshot<PersonMoviesModel> snapshot, size) {
    return Container(
      height: size.height * 0.17,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: setLenght(snapshot.data.movies),
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(3.0),
          child: GestureDetector(
            child: ListCard(
              movieTitle: snapshot.data.movies[index].title,
              imageUrl: getImagePath(snapshot.data.movies[index].posterPath),
              
            ),
            onTap: () {
              Movie movie = new Movie(
                title: snapshot.data.movies[index].title,
                overview: snapshot.data.movies[index].overview,
                voteAverage: snapshot.data.movies[index].voteAverage,
                id: snapshot.data.movies[index].id,
                releaseDate: snapshot.data.movies[index].releaseDate,
                posterPath: snapshot.data.movies[index].posterPath,
                voteCount: snapshot.data.movies[index].voteCount,
              );
              String fromWhereArg;
              if (fromWhere == "Home") {
                movieSelectedFromHome = movie;
                fromWhereArg = personSelectedFromHome.name;
              }
              if (fromWhere == "Search") {
                movieSelectedFromSearch = movie;
                fromWhereArg = personSelectedFromSearch.name;
              }
              if (fromWhere == "User") {
                movieSelectedFromUser = movie;
                fromWhereArg = personSelectedFromUser.name;
              }
              Navigator.pushNamed(context, '/movie', arguments: ScreenArguments(fromWhereArg));
              FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
            },
          ),
        ),
      ),
    );
  }
}
