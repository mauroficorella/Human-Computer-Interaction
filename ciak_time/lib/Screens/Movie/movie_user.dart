import 'package:ciak_time/Screens/Movie/insert_review_btn.dart';
import 'package:ciak_time/Screens/Movie/movie_details.dart';
import 'package:ciak_time/Screens/Review/review.dart';
import 'package:ciak_time/Screens/Review/reviews_page.dart';
import 'package:ciak_time/api_utils.dart';
import 'package:ciak_time/blocs/movie_details_bloc.dart';
import 'package:ciak_time/blocs/movie_images_bloc.dart';
import 'package:ciak_time/components/rating.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie.dart';
import 'package:ciak_time/models/movie_details_model.dart';
import 'package:ciak_time/models/movie_images_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MovieUser extends StatefulWidget {
  const MovieUser({
    Key key,
  }) : super(key: key);
  @override
  _MovieUserState createState() => _MovieUserState();
}

class _MovieUserState extends State<MovieUser> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    return Scaffold(
      floatingActionButton: AddButton(size: size),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Stack(
            children: [
              Center(
                child: MovieCover(size: size),
              ),
              
              Positioned(
                left: size.width * 0.03,
                top: size.width * 0.1,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    label: Text(
                      args.fromWhere,
                      style: TextStyle(color: Colors.white),
                    ),
                    
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              // BLACK SHADOW BOX UNDER TITLE AND INFO
              Positioned(
                top: size.width * 0.4,
                child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 18,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: size.width * 0.03,
                bottom: size.width * 0.05,
                child: Container(
                  width: size.width * 0.94,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieSelectedFromUser.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.03,
                          fontFamily: 'Quicksand-Medium',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // SCROLLABLE PART OF THE PAGE
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  // MOVIE DESCRIPTION 
                  Container(
                    width: size.width * 0.98,
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
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Movie informations",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * 0.02,
                                  fontFamily: 'Quicksand-Medium',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/moviedetails');
                                },
                                label: Icon(Icons.arrow_forward,
                                    color: kPrimaryColor),
                                icon: Text(
                                  "View more",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: size.height * 0.02,
                                      fontFamily: 'Quicksand-Medium'),
                                ),
                                style: ButtonStyle(
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => kPrimaryLightColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          MovieBasicInfo(size: size),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            child: Text(
                              getOverviewUser(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height * 0.02,
                                fontFamily: 'Quicksand-Regular',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: size.width * 0.98,
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
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Reviews",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * 0.02,
                                  fontFamily: 'Quicksand-Medium',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/reviewslist');
                                },
                                label: Icon(Icons.arrow_forward,
                                    color: kPrimaryColor),
                                icon: Text(
                                  "View all reviews",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: size.height * 0.02,
                                      fontFamily: 'Quicksand-Medium'),
                                ),
                                style: ButtonStyle(
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => kPrimaryLightColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.015),
                          Row(
                            children: [
                              RatingUnclickable(
                                  unratedColor: Colors.grey.withOpacity(0.5),
                                  rate: movieSelectedFromUser.voteAverage),
                              SizedBox(width: size.width * 0.03),
                              Text(
                                'out of ' +
                                    movieSelectedFromUser.voteCount.toString() +
                                    ' ratings',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * 0.02,
                                  fontFamily: 'Quicksand-Regular',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01),
                          InsertReviewBtn(
                            size: size,
                            fromWhere: '/insertreviewfrommovie',
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieCover extends StatelessWidget {
  const MovieCover({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final bloc = MovieImagesBloc(movieSelectedFromUser.id.toString());
    bloc.fetchMovieImagesResults();

    return StreamBuilder(
      stream: bloc.moviesImages,
      builder: (context, AsyncSnapshot<MovieImagesModel> snapshot) {
        if (snapshot.hasData) {
          return buildCover(snapshot, size);
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

  Widget buildCover(AsyncSnapshot<MovieImagesModel> snapshot, size) {
    String imagePath;
    if (snapshot.data.backdrops.length != 0) {
      imagePath =
          'https://image.tmdb.org/t/p/original${snapshot.data.backdrops[0].filePath}';
    } else if (snapshot.data.posters.length != 0) {
      imagePath =
          'https://image.tmdb.org/t/p/original${snapshot.data.posters[0].filePath}';
    } else {
      imagePath = "https://cdn.hipwallpaper.com/i/59/45/2QvigJ.jpg";
    }
    return Column(
      children: [
        Container(
          height: size.height * 0.35,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                imagePath,
              ),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MovieBasicInfo extends StatelessWidget {
  const MovieBasicInfo({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final bloc = MovieDetailsBloc(movieSelectedFromUser.id.toString());
    bloc.fetchMovieDetailsResults();

    return StreamBuilder(
      stream: bloc.movieDetails,
      builder: (context, AsyncSnapshot<MovieDetailsModel> snapshot) {
        if (snapshot.hasData) {
          return buildDetails(snapshot, size);
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

  Widget buildDetails(AsyncSnapshot<MovieDetailsModel> snapshot, size) {
    return Column(
      children: [
        Container(
          height: size.height * 0.035,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                getReleaseDate(snapshot.data.releaseDate),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.02,
                  fontFamily: 'Quicksand-Regular',
                ),
              ),
              VerticalDivider(
                color: Colors.grey,
                thickness: 1,
              ),
              Text(
                durationToString(snapshot.data.runtime),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.02,
                  fontFamily: 'Quicksand-Regular',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.015,
        ),
        Text(
          getGenresNames(snapshot.data.genres),
          style: TextStyle(
            color: Colors.black,
            fontSize: size.height * 0.02,
            fontFamily: 'Quicksand-Regular',
          ),
        ),
      ],
    );
  }
}

String getWatchListTitle() {
  bool isContained = false;
  for (var i = 0; i < watchList.length; i++) {
    if (watchList[i].id == movieSelectedFromUser.id) {
      isContained = true;
    }
  }
  if (isContained) {
    watchListTitle = "Remove from watchlist";
  } else {
    watchListTitle = "Add to watchlist";
  }

  return watchListTitle;
}

String getAlreadyWatchedListTitle() {
  bool isContained = false;
  for (var i = 0; i < alreadyWatchedList.length; i++) {
    if (alreadyWatchedList[i].id == movieSelectedFromUser.id) {
      isContained = true;
    }
  }
  if (isContained) {
    alreadyWatchedListTitle = "Remove from already watched list";
  } else {
    alreadyWatchedListTitle = "Add to already watched list";
  }
  return alreadyWatchedListTitle;
}

String getFavouriteListTitle() {
  bool isContained = false;
  for (var i = 0; i < favouriteList.length; i++) {
    if (favouriteList[i].id == movieSelectedFromUser.id) {
      isContained = true;
    }
  }
  if (isContained) {
    favouriteListTitle = "Remove from favourite list";
  } else {
    favouriteListTitle = "Add to favourite list";
  }
  return favouriteListTitle;
}

buildFlutterToast(list) {
  Fluttertoast.showToast(
    msg: movieSelectedFromUser.title + list,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: kPrimaryLightColor,
    textColor: Colors.black,
    fontSize: 16.0,
  );
}

checkDisabledButton(context) {
  bool isContained = false;
  for (var i = 0; i < alreadyWatchedList.length; i++) {
    if (alreadyWatchedList[i].id == movieSelectedFromUser.id) {
      isContained = true;
    }
  }
  if (isContained) {
    Fluttertoast.showToast(
      msg:
          "You have already added this movie to already watched list! Remove it from there before adding it to watchlist.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: kPrimaryLightColor,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  } else {
    if (watchListTitle == "Remove from watchlist") {
      watchList.remove(movieSelectedFromUser);

      buildFlutterToast(" removed from watchlist");
      Navigator.pop(context);
    } else {
      watchList.add(movieSelectedFromUser);

      buildFlutterToast(" added to watchlist");
      Navigator.pop(context);
    }
  }
}

class AddButton extends StatelessWidget {
  const AddButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 0.0),
        child: Text(
          "Add to list",
          style: TextStyle(
            color: Colors.black,
            fontSize: size.height * 0.02,
            fontFamily: 'Quicksand-Medium',
          ),
        ),
      ),
      icon: Padding(
        padding: const EdgeInsets.fromLTRB(100.0, 0.0, 0.0, 0.0),
        child: const Icon(Icons.add, color: Colors.black, size: 30),
      ),
      backgroundColor: Colors.amber,
      elevation: 10,
      onPressed: () {
        showDialog(
            context: context,
            builder: (_) {
              return new AlertDialog(
                content: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            checkDisabledButton(context);
                          },
                          icon: SvgPicture.asset("assets/icons/list.svg",
                              height: size.height * 0.03),
                          label: Text(
                            getWatchListTitle(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height * 0.02,
                                fontFamily: 'Quicksand-Medium'),
                          ),
                        ),
                        Divider(color: Colors.grey,),
                        TextButton.icon(
                          onPressed: () {
                            if (alreadyWatchedListTitle ==
                                "Remove from already watched list") {
                              alreadyWatchedList
                                  .remove(movieSelectedFromUser);
                              buildFlutterToast(
                                  " removed from already watched list");
                              Navigator.pop(context);
                            } else {
                              bool isContainedInWatchList = false;
                              Movie movie;
                              for (var i = 0; i < watchList.length; i++) {
                                if (watchList[i].id ==
                                    movieSelectedFromUser.id) {
                                  isContainedInWatchList = true;
                                  movie = watchList[i];
                                }
                              }
                              if (isContainedInWatchList) {
                                watchList.remove(movie);
                              }
                              alreadyWatchedList.add(movieSelectedFromUser);
                              buildFlutterToast(
                                  " added to already watched list");
                              Navigator.pop(context);
                            }
                          },
                          icon: SvgPicture.asset("assets/icons/check.svg",
                              height: size.height * 0.03),
                          label: Container(
                            width: size.width * 0.5,
                            child: Text(
                              getAlreadyWatchedListTitle(),
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * 0.02,
                                  fontFamily: 'Quicksand-Medium'),
                            ),
                          ),
                        ),
                        Divider(color: Colors.grey,),
                        TextButton.icon(
                          onPressed: () {
                            if (favouriteListTitle ==
                                "Remove from favourite list") {
                              favouriteList.remove(movieSelectedFromUser);
                              buildFlutterToast(
                                  " removed from favourite list");
                              Navigator.pop(context);
                            } else {
                              favouriteList.add(movieSelectedFromUser);
                              buildFlutterToast(" added to favourite list");
                              Navigator.pop(context);
                            }
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          label: Text(
                            getFavouriteListTitle(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height * 0.02,
                                fontFamily: 'Quicksand-Medium'),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            });
      },
    );
  }
}
