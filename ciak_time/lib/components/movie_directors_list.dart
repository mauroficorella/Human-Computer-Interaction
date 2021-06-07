import 'package:ciak_time/blocs/movie_cast_bloc.dart';
import 'package:ciak_time/blocs/popular_person_bloc.dart';
import 'package:ciak_time/components/cast_card.dart';
import 'package:ciak_time/components/person_card.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie_cast_model.dart';
import 'package:ciak_time/models/person_model.dart';
import 'package:flutter/material.dart';

class MovieDirectorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bloc = MovieCastBloc(movieSelected.id.toString());
    bloc.fetchMovieCastResults();
    return StreamBuilder(
      stream: bloc.castList,
      builder: (context, AsyncSnapshot<MovieCastModel> snapshot) {
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

  Widget buildList(AsyncSnapshot<MovieCastModel> snapshot, size) {
    print(snapshot.data.directors);

    if (snapshot.data.directors.length != 0) {
      print("Sono nell'if");
      return Container(
        height: size.height * 0.26,
        //color: Colors.amber,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.directors.length,
            itemBuilder: (BuildContext context, int index) {
              return CastCard(
                imageUrl:
                    'https://image.tmdb.org/t/p/original${snapshot.data.directors[index].profilePath}',
                personName: snapshot.data.directors[index].name,
              );
            }),
      );
    } else {
      print("Sono nell'else");
      return Text(
        "No movie director available",
        style: TextStyle(
          color: Colors.grey,
          fontSize: size.height * 0.02,
          fontFamily: 'Quicksand-Regular',
        ),
      );
    }
  }
}
