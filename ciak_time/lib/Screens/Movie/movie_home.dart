import 'package:ciak_time/Screens/Movie/movie_details.dart';
import 'package:ciak_time/Screens/Review/review.dart';
import 'package:ciak_time/Screens/Review/reviews_page.dart';
import 'package:ciak_time/blocs/movie_details_bloc.dart';
import 'package:ciak_time/blocs/movie_images_bloc.dart';
import 'package:ciak_time/components/rating.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie_details_model.dart';
import 'package:ciak_time/models/movie_images_model.dart';
import 'package:ciak_time/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MovieHome extends StatefulWidget {
  

  const MovieHome({Key key,}) : super(key: key);
  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              // BACK ARROW
              Positioned(
                left: size.width * 0.03,
                top: size.width * 0.1,
                child: TextButton.icon(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Back",
                    style: TextStyle(color: Colors.white),
                  ),
                  //color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                        movieSelectedFromHome.title,
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
                  // MOVIE DESCRIPTION //TODO METTERE L'URL TRAMITE API
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        //return MovieDetails(movieSelected: movieSelectedFromHome,);
                                      },
                                    ),
                                  );
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
                              getOverview(),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ReviewsPage();
                                      },
                                    ),
                                  );
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
                                  rate: movieSelectedFromHome.voteAverage),
                              SizedBox(width: size.width * 0.03),
                              Text(
                                "Numero",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * 0.02,
                                  fontFamily: 'Quicksand-Regular',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01),
                          InsertReviewBtn(size: size)
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

String getOverview() {
  if (movieSelectedFromHome.overview != null) {
    return movieSelectedFromHome.overview;
  } else {
    return "Unknown";
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
    final bloc = MovieImagesBloc(movieSelectedFromHome.id.toString());
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

String durationToString(int minutes) {
  print("minutes: " + minutes.toString());
  if (minutes != null) {
    print("if della durata");
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0]} h ${parts[1].padLeft(2, '0')} min';
  } else {
    print("else della durata");
    return "Unknown";
  }
}

String getGenresNames(List<Genres> genres) {
  //print("genres: " + genres.toString());
  if (genres.length != 0) {
    String allGenres = '';
    for (var i = 0; i < genres.length; i++) {
      allGenres = allGenres + genres[i].name;
      if (i != genres.length - 1) {
        allGenres = allGenres + ", ";
      }
    }
    return allGenres;
  } else {
    return "Genre: Unknown";
  }
}

String getReleaseDate() {
  if (movieSelectedFromHome.releaseDate.toString() != "" ||
      movieSelectedFromHome.releaseDate != null) {
    return movieSelectedFromHome.releaseDate;
  } else if (movieSelectedFromHome.releaseDate.toString() == "") {
    return "Date: Unknown";
  } else {
    return "Date: Unknown";
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
    final bloc = MovieDetailsBloc(movieSelectedFromHome.id.toString());
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
          //backgroundColor: Colors.amber,
          color: Colors.amber,
        ));
      },
    );
  }

  Widget buildDetails(AsyncSnapshot<MovieDetailsModel> snapshot, size) {
    //print("CIAO MAREEEEEEEELLLLLLLLLLLL" + movieSelected.releaseDate);
    return Column(
      children: [
        Container(
          height: size.height * 0.035,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                
                getReleaseDate(),
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

class InsertReviewBtn extends StatelessWidget {
  const InsertReviewBtn({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.98,
      child: TextButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return InsertReview();
              },
            ),
          );
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
        icon: Icon(Icons.edit, color: Colors.white),
        label: Text(
          "Insert a review",
          style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.02,
              fontFamily: 'Quicksand-Medium'),
        ),
      ),
    );
  }
}

String getWatchListTitle() {
  bool isContained = false;
  for (var i = 0; i < watchList.length; i++) {
    if (watchList[i].id == movieSelectedFromHome.id) {
      isContained = true;
    }
  }
  if (isContained) {
    print("ciao");
    watchListTitle = "Remove from watchlist";
  } else {
    print("sono nell'else");
    watchListTitle = "Add to watchlist";
  }

  return watchListTitle;
}

String getAlreadyWatchedListTitle() {
  bool isContained = false;
  for (var i = 0; i < alreadyWatchedList.length; i++) {
    if (alreadyWatchedList[i].id == movieSelectedFromHome.id) {
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
    if (favouriteList[i].id == movieSelectedFromHome.id) {
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
    msg: movieSelectedFromHome.title + list,
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
    if (alreadyWatchedList[i].id == movieSelectedFromHome.id) {
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
      watchList.remove(movieSelectedFromHome);

      buildFlutterToast(" removed from watchlist");
      Navigator.pop(context);
    } else {
      //watchList.add(movieSelectedFromHome);

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
                    return Container(
                      width: size.width * 0.8,
                      height: size.height * 0.23,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          PopupMenuDivider(),
                          TextButton.icon(
                            onPressed: () {
                              if (alreadyWatchedListTitle ==
                                  "Remove from already watched list") {
                                alreadyWatchedList.remove(movieSelectedFromHome);
                                buildFlutterToast(
                                    " removed from already watched list");
                                Navigator.pop(context);
                              } else {
                                bool isContainedInWatchList = false;
                                MovieResults movie;
                                for (var i = 0; i < watchList.length; i++) {
                                  if (watchList[i].id == movieSelectedFromHome.id) {
                                    isContainedInWatchList = true;
                                    movie = watchList[i];
                                  }
                                }
                                if (isContainedInWatchList) {
                                  watchList.remove(movie);
                                }
                                //alreadyWatchedList.add(movieSelectedFromHome);
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
                          PopupMenuDivider(),
                          TextButton.icon(
                            onPressed: () {
                              if (favouriteListTitle ==
                                  "Remove from favourite list") {
                                favouriteList.remove(movieSelectedFromHome);
                                buildFlutterToast(
                                    " removed from favourite list");
                                Navigator.pop(context);
                              } else {
                                //favouriteList.add(movieSelectedFromHome);
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
                      ),
                    );
                  },
                ),
              );
            });
      },
    );
  }
}