import 'package:ciak_time/Screens/Search/filters_utils.dart';
import 'package:ciak_time/blocs/search_results_bloc.dart';

import 'package:ciak_time/components/rating.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie.dart';
import 'package:ciak_time/models/person.dart';
import 'package:ciak_time/models/search_results_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchMovieResultsList extends StatefulWidget {
  final String queryString;

  const SearchMovieResultsList({Key key, @required this.queryString})
      : super(key: key);

  @override
  _SearchMovieResultsListState createState() => _SearchMovieResultsListState();
}

class _SearchMovieResultsListState extends State<SearchMovieResultsList> {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.amber;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (widget.queryString == "") {
      return Center(
          child: Text(
        "No results found.\n\nWrite something before starting the search.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 17.0,
        ),
      ));
    }

    final bloc = SearchResultsBloc(widget.queryString);
    bloc.fetchSearchResults();

    return StreamBuilder(
      stream: bloc.searchResults,
      builder: (context, AsyncSnapshot<SearchResultsModel> snapshot) {
        if (snapshot.hasData) {
          if (selected_most_recent || selected_most_added || selected_rate) {
            sortSearchResults(snapshot);
          }
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

  Widget returnImage(snapshot, index, size) {
    if (snapshot.data.results[index].posterPath != null) {
      return Container(
        height: size.width * 0.45,
        width: size.width * 0.25,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return Container(
          height: size.width * 0.45,
          width: size.width * 0.25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey),
          child: Icon(Icons.image));
    }
  }

  Widget buildList(AsyncSnapshot<SearchResultsModel> snapshot, size) {
    if (snapshot.data.results.isEmpty) {
      return Center(
          child: Text(
        'No results found for "${widget.queryString}".',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 17.0,
        ),
      ));
    } else {
      return Column(
        children: [
          SizedBox(
            height: size.height * 0.13,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isMovieChecked,
                    onChanged: (bool value) {
                      setState(() {
                        if (isPersonChecked == true) {
                          isMovieChecked = value;
                        } else {
                          Fluttertoast.showToast(
                              msg:
                                  'You have to select at least one between Movie and Person');
                        }
                      });
                    },
                  ),
                  Text("Movie"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isPersonChecked,
                    onChanged: (bool value) {
                      setState(() {
                        if (isMovieChecked == true) {
                          isPersonChecked = value;
                        } else {
                          Fluttertoast.showToast(
                              msg:
                                  'You have to select at least one between Movie and Person');
                        }
                      });
                    },
                  ),
                  Text("Person"),
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.results.length,
                itemBuilder: (BuildContext context, int index) {
                  if (snapshot.data.results[index].mediaType == 'movie') {
                    return getMovieResultSearch(size, snapshot, index, context);
                  } else if (snapshot.data.results[index].mediaType ==
                      'person') {
                    return getPersonResultsSearch(
                        size, snapshot, index, context);
                  } else {
                    return null;
                  }
                }),
          ),
        ],
      );
    }
  }

  Widget getMovieResultSearch(size, AsyncSnapshot<SearchResultsModel> snapshot,
      int index, BuildContext context) {
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.05,
      child: GestureDetector(
        child: Card(
          child: Row(children: <Widget>[
            returnImage(snapshot, index, size),
            SizedBox(width: size.width * 0.04),
            Container(
              width: size.width * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snapshot.data.results[index].title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: size.height * 0.025,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  RatingUnclickable(
                      unratedColor: Colors.grey,
                      rate: snapshot.data.results[index].voteAverage),
                ],
              ),
            ),
          ]),
        ),
        onTap: () {
          movieSelectedFromSearch = new Movie(
            title: snapshot.data.results[index].title,
            overview: snapshot.data.results[index].overview,
            voteAverage: snapshot.data.results[index].voteAverage,
            id: snapshot.data.results[index].id,
            releaseDate: snapshot.data.results[index].releaseDate,
            posterPath: snapshot.data.results[index].posterPath,
            voteCount: snapshot.data.results[index].voteCount,
          );

          Navigator.pushNamed(context, '/movie',
              arguments: ScreenArguments("Search"));
          FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
        },
      ),
    );
  }

  Widget getPersonResultsSearch(
      size,
      AsyncSnapshot<SearchResultsModel> snapshot,
      int index,
      BuildContext context) {
    return Container(
      height: size.height * 0.15,
      child: GestureDetector(
        child: Card(
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.03,
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: size.width * 0.1,
                backgroundImage: NetworkImage(
                    getProfileImage(snapshot.data.results[index].profilePath)),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              Text(
                snapshot.data.results[index].name,
                style: TextStyle(
                    fontFamily: 'Quicksand-Regular',
                    fontSize: size.width * 0.05),
              ),
            ],
          ),
        ),
        onTap: () {
          personSelectedFromSearch = new Person(
              id: snapshot.data.results[index].id,
              name: snapshot.data.results[index].name);
          Navigator.pushNamed(context, '/person',
              arguments: ScreenArguments("Search"));
          FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
        },
      ),
    );
  }

  String getProfileImage(String profilePath) {
    if (profilePath != null) {
      return 'https://image.tmdb.org/t/p/w185$profilePath';
    } else {
      return 'https://bitslog.files.wordpress.com/2013/01/unknown-person1.gif';
    }
  }
}
