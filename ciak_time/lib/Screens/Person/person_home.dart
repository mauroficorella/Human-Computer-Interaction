import 'package:ciak_time/blocs/person_movies_bloc.dart';
import 'package:ciak_time/components/list_card.dart';
import 'package:ciak_time/components/person_overview.dart';
import 'package:ciak_time/components/rating.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/person_movies_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class PersonHome extends StatefulWidget {
  @override
  _PersonHomeState createState() => _PersonHomeState();
}

class _PersonHomeState extends State<PersonHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.amber,
          ),
          label: Text(
            "Home",
            style:
                TextStyle(color: Colors.amber, fontFamily: 'Quicksand-Regular'),
          ),
        ),
        leadingWidth: size.width * 0.22,
        title: Text(
          personSelectedFromHome.name,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            PersonOverview(
              fromWhere: "Home",
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              //width: size.width,
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
                padding: const EdgeInsets.fromLTRB(12.0, 8.0, 0.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Filmography",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.03,
                        fontFamily: 'Quicksand-Medium',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),

                    //FilmographyList()
                    Row(
                      children: [
                        FilmographyList(
                          fromWhere: "Home",
                        ),
                        TextButton.icon(
                          onPressed: () {
                            selectedPersonMoviesFromHome = 
                            Navigator.pushNamed(context, '/filmography'); //TODO
                          },
                          label:
                              Icon(Icons.arrow_forward, color: kPrimaryColor),
                          icon: Container(
                            width: size.width * 0.15,
                            //width: size.width * 0.11,
                            child: Text(
                              "View all",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: size.height * 0.02,
                                  fontFamily: 'Quicksand-Medium'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class FilmographyList extends StatelessWidget {
  const FilmographyList({
    Key key,
    @required this.fromWhere,
  }) : super(key: key);

  //final Size size;
  final String fromWhere;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PersonMoviesBloc bloc;

    if (fromWhere == "Home") {
      bloc = PersonMoviesBloc(personSelectedFromHome.id.toString());
    } else {
      bloc = PersonMoviesBloc(personSelectedFromSearch.id.toString());
    }

    bloc.fetchPersonMoviesResults();

    return StreamBuilder(
      stream: bloc.personMovies,
      builder: (context, AsyncSnapshot<PersonMoviesModel> snapshot) {
        if (snapshot.hasData) {
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
    /*return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: snapshot.data.cast.length,
      itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(3.0),
          child: MovieFilmographyCard(
            imageUrl:
                'https://image.tmdb.org/t/p/original${snapshot.data.cast[index].posterPath}',
            title: snapshot.data.cast[index].title,
          )),
    );*/
    return Container(
      height: size.height * 0.17,
      //color: Colors.amber,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: setLenght(snapshot.data.movies),
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(3.0),
          child: GestureDetector(
            child: ListCard(
              movieTitle: snapshot.data.movies[index].title,
              imageUrl:
                  'https://image.tmdb.org/t/p/original${snapshot.data.movies[index].posterPath}',
            ),
            onTap: () {
              personMovieSelectedFromHome = snapshot.data.movies[index];
              Navigator.pushNamed(context, '/movie');
              FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
            },
          ),
        ),
      ),
    );
  }
}

class MovieFilmographyCard extends StatelessWidget {
  const MovieFilmographyCard({
    Key key,
    @required this.imageUrl,
    @required this.title,
  }) : super(key: key);

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: size.width * 0.4,
          width: size.width * 0.25,
          //width: 50.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        /*Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontFamily: 'Quicksand-Regular',
              ),
            ),
            RatingUnclickable(
                unratedColor: Colors.grey,
                rate: 2.0) //TODO passare parametri stelle
          ],
        ),*/

        Container(
          width: size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: size.height * 0.025,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              RatingUnclickable(unratedColor: Colors.grey, rate: 2.0),
              //snapshot.data.results[index].voteAverage),
            ],
          ),
        ),
      ],
    );
  }
}
