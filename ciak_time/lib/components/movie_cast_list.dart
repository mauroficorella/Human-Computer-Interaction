import 'package:ciak_time/blocs/movie_cast_bloc.dart';
import 'package:ciak_time/components/cast_card.dart';
import 'package:ciak_time/models/movie_cast_model.dart';
import 'package:ciak_time/models/movie_model.dart';
import 'package:flutter/material.dart';

class MovieCastList extends StatelessWidget {
  final MovieResults movieSelected;

  const MovieCastList({Key key, @required this.movieSelected}) : super(key: key);
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

  Widget returnImage(snapshot, index, size) {
    if (snapshot.data.cast[index].profilePath != null) {
      return CastCard(
        imageUrl:
            'https://image.tmdb.org/t/p/original${snapshot.data.cast[index].profilePath}',
        personName: snapshot.data.cast[index].name,
      );
    } else {
      //print(snapshot.data.results[index].title);
      return CastCard(
        imageUrl:
            'https://bitslog.files.wordpress.com/2013/01/unknown-person1.gif',
        personName: snapshot.data.cast[index].name,
      );
    }
  }

  Widget buildList(AsyncSnapshot<MovieCastModel> snapshot, size) {
    if (snapshot.data.cast.length != 0) {
      return Container(
        height: size.height * 0.26,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.cast.length,
            itemBuilder: (BuildContext context, int index) {
              return returnImage(snapshot, index, size);
            }),
      );
    } else {
      return Text(
        "No cast member available",
        style: TextStyle(
          color: Colors.grey,
          fontSize: size.height * 0.02,
          fontFamily: 'Quicksand-Regular',
        ),
      );
    }
  }
}
