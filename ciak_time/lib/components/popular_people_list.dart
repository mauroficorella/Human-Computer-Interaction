import 'package:ciak_time/blocs/popular_person_bloc.dart';
import 'package:ciak_time/components/movie_card.dart';
import 'package:ciak_time/components/person_card.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class PopularPeopleList extends StatelessWidget {
  final String fromWhere;

  const PopularPeopleList({Key key, @required this.fromWhere}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bloc.fetchPopularPeople();
    return StreamBuilder(
      stream: bloc.popularPeople,
      builder: (context, AsyncSnapshot<PersonModel> snapshot) {
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

  Widget returnImage(snapshot, index, size, context) {
    /*if (snapshot.data.results[index].profilePath != null) {
      return PersonCard(
        imageUrl:
            'https://image.tmdb.org/t/p/original${snapshot.data.results[index].profilePath}',
        personName: snapshot.data.results[index].name,
      );
    } else {
      //print(snapshot.data.results[index].title);
      return PersonCard(
        imageUrl:
            'https://bitslog.files.wordpress.com/2013/01/unknown-person1.gif',
        personName: snapshot.data.results[index].name,
      );
    }*/
    String imagePath;
    if (snapshot.data.results[index].profilePath != null) {
      imagePath =
          'https://image.tmdb.org/t/p/original${snapshot.data.results[index].profilePath}';
    } else {
      //print(snapshot.data.results[index].title);
      imagePath =
          'https://bitslog.files.wordpress.com/2013/01/unknown-person1.gif';
    }
    return GestureDetector(
      onTap: () {
        if (fromWhere == "Home") {
          personSelectedFromHome = snapshot.data.results[index];
        }
        if (fromWhere == "Search") {
          personSelectedFromSearch = snapshot.data.results[index];
        }

        Navigator.pushNamed(context, '/person');
        FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
      },
      child: PersonCard(
        imageUrl: imagePath,
        personName: snapshot.data.results[index].name,
      ),
    );
  }

  Widget buildList(AsyncSnapshot<PersonModel> snapshot, size) {
    return Container(
      height: size.height * 0.26,
      //color: Colors.amber,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.results.length,
          itemBuilder: (BuildContext context, int index) {
            return returnImage(snapshot, index, size, context);
          }),
    );
  }
}
