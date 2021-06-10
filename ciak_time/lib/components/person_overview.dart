import 'package:ciak_time/blocs/person_details_bloc.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/person_details_model.dart';
import 'package:flutter/material.dart';

class PersonOverview extends StatelessWidget {
  const PersonOverview({Key key, @required this.fromWhere}) : super(key: key);

  final String fromWhere;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //final PersonDetailsBloc bloc = null;
    PersonDetailsBloc bloc;
    if (fromWhere == "Home") {
      bloc = PersonDetailsBloc(personSelectedFromHome.id.toString());
      //bloc = PersonDetailsBloc(personIdSelectedFromHome);
    }
    if (fromWhere == "Search") {
      bloc = PersonDetailsBloc(personSelectedFromSearch.id.toString());
      //bloc = PersonDetailsBloc(personIdSelectedFromHome);
    }
    if (fromWhere == "User") {
      bloc = PersonDetailsBloc(personSelectedFromUser.id.toString());
      //bloc = PersonDetailsBloc(personIdSelectedFromHome);
    }

    bloc.fetchPersonDetailsResults();

    return StreamBuilder(
      stream: bloc.personDetails,
      builder: (context, AsyncSnapshot<PersonDetailsModel> snapshot) {
        if (snapshot.hasData) {
          return buildOverview(snapshot, size);
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

  Widget buildOverview(AsyncSnapshot<PersonDetailsModel> snapshot, size) {
    String imagePath;
    if (snapshot.data.profilePath.length != 0) {
      imagePath =
          'https://image.tmdb.org/t/p/original${snapshot.data.profilePath}';
    } else {
      imagePath =
          'https://bitslog.files.wordpress.com/2013/01/unknown-person1.gif';
    }
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imagePath),
              radius: size.height * 0.1,
            ),
          ],
        ),
        Text(
          snapshot.data.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.035,
            fontFamily: 'Quicksand-Medium',
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Biography",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.023,
                    fontFamily: 'Quicksand-Medium',
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                getBiography(snapshot.data.biography, size),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getBiography(biography, size) {
    if (biography != "") {
      return Text(
        biography,
        style: TextStyle(
          fontSize: size.height * 0.02,
          fontFamily: 'Quicksand',
        ),
      );
    } else {
      return Text(
        "Biography not available",
        style: TextStyle(
          color: Colors.grey,
          fontSize: size.height * 0.02,
          fontFamily: 'Quicksand',
        ),
      );
    }
  }
}
