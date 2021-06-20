import 'package:ciak_time/Screens/Person/person_home.dart';
import 'package:ciak_time/blocs/movie_cast_bloc.dart';
import 'package:ciak_time/components/cast_card.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie.dart';
import 'package:ciak_time/models/movie_cast_model.dart';
import 'package:ciak_time/models/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class MovieDirectorsList extends StatelessWidget {
  final Movie movieSelected;
  final String fromWhere;

  const MovieDirectorsList({
    Key key,
    @required this.movieSelected,
    @required this.fromWhere,
  }) : super(key: key);
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
          
          color: Colors.amber,
        ));
      },
    );
  }

  Widget returnImage(snapshot, index, size, context) {
    String imagePath;
    if (snapshot.data.directors[index].profilePath != null) {
      imagePath =
          'https://image.tmdb.org/t/p/original${snapshot.data.directors[index].profilePath}';
    } else {
      imagePath =
          'https://bitslog.files.wordpress.com/2013/01/unknown-person1.gif';
    }
    return GestureDetector(
      onTap: () {
        Person person = new Person(
          id: snapshot.data.directors[index].id,
          name: snapshot.data.directors[index].name,
        );
        String fromWhereArg;
        if (fromWhere == "Home") {
          
          personSelectedFromHome = person;
          fromWhereArg = movieSelectedFromHome.title;
          
        }
        if (fromWhere == "Search") {
          
          personSelectedFromSearch = person;
          fromWhereArg = movieSelectedFromSearch.title;
          
        }
        if (fromWhere == "User") {
          
          personSelectedFromUser = person;
          fromWhereArg = movieSelectedFromUser.title;
          
        }

        Navigator.pushNamed(context, '/person',
            arguments: ScreenArguments("Movie Info"));
        
        FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
      },
      child: CastCard(
          imageUrl: imagePath, personName: snapshot.data.directors[index].name),
    );
  }

  Widget buildList(AsyncSnapshot<MovieCastModel> snapshot, size) {
    if (snapshot.data.directors.length != 0) {
      return Container(
        height: size.height * 0.26,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.directors.length,
            itemBuilder: (BuildContext context, int index) {
              return returnImage(snapshot, index, size, context);
            }),
      );
    } else {
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
