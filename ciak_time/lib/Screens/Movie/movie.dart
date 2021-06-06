import 'package:ciak_time/Screens/Movie/movie_details.dart';
import 'package:ciak_time/Screens/Review/review.dart';
import 'package:ciak_time/Screens/Review/reviews_page.dart';
import 'package:ciak_time/blocs/movie_details_bloc.dart';
import 'package:ciak_time/blocs/movie_images_bloc.dart';
import 'package:ciak_time/components/rating.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/movie_details_model.dart';
import 'package:ciak_time/models/movie_images_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Movie extends StatefulWidget {
  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
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
              // BACK ARROW //TODO METTERE L'onPressed
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
                        movieSelected.title,
                        //"Lo Svarione degli Anelli e la compagnia del verginello",
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
                                        return MovieDetails();
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
                            height: size.height * 0.02,
                          ),
                          MovieBasicInfo(size: size),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            child: Text(
                              movieSelected.overview,
                              //"Un giovane hobbit e un variegato gruppo, composto da umani, un nano, un elfo e altri hobbit, partono per un delicata missione, guidati dal potente mago Gandalf. ",
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
                                  unratedColor: Colors.grey.withOpacity(0.5)),
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

class MovieCover extends StatelessWidget {
  const MovieCover({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final bloc = MovieImagesBloc(movieSelected.id.toString());
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
          //backgroundColor: Colors.amber,
          color: Colors.amber,
        ));
      },
    );

    /*return Container(
      height: size.height * 0.35,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://image.tmdb.org/t/p/w185${movieSelected.posterPath}'),
          //"http://vulcanostatale.it/wp-content/uploads/2016/03/lord-of-the-rings-1-the-fellowship-of-the-ring-movie-poster-2001-1020195991.jpg"),
          fit: BoxFit.contain,
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
    );*/
  }

  Widget buildCover(AsyncSnapshot<MovieImagesModel> snapshot, size) {
    return Column(
      children: [
        Container(
          height: size.height * 0.35,
          width: size.width,
          //child: Image.network('https://image.tmdb.org/t/p/w185${snapshot.data.backdrops[0].filePath}',),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://image.tmdb.org/t/p/original${snapshot.data.backdrops[0].filePath}',
              ),
              //"http://vulcanostatale.it/wp-content/uploads/2016/03/lord-of-the-rings-1-the-fellowship-of-the-ring-movie-poster-2001-1020195991.jpg"),
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
    /*return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data.backdrops.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: size.height * 0.2,
            width: size.width * 0.05,
            child: Card(
              child: Row(

                  //contentPadding: EdgeInsets.all(25),
                  children: <Widget>[
                    Image.network(
                      'https://image.tmdb.org/t/p/w185${snapshot.data.backdrops[index].posterPath}',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: size.width * 0.04),
                    Container(
                      width: size.width * 0.6,
                      child: Text(
                        snapshot.data.results[index].title,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: size.height * 0.025,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
            ),
          );
          /*return MovieCard(
            imageUrl:
                'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
            movieTitle: snapshot.data.results[index].title,
          );*/
        });*/
  }
}

String durationToString(int minutes) {
  var d = Duration(minutes: minutes);
  List<String> parts = d.toString().split(':');
  return '${parts[0]} h ${parts[1].padLeft(2, '0')} min';
}

String getGenresNames(List<Genres> genres) {
  String allGenres = '';
  for (var i = 0; i < genres.length; i++) {
    allGenres = allGenres + genres[i].name;
    if (i != genres.length - 1) {
      allGenres = allGenres + ", ";
    }
  }
  return allGenres;
}

class MovieBasicInfo extends StatelessWidget {
  const MovieBasicInfo({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final bloc = MovieDetailsBloc(movieSelected.id.toString());
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
    return Container(
      height: size.height * 0.035,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            movieSelected.releaseDate,
            //DateFormat.dMMMy(movieSelected.releaseDate).toString(), //TODO
            //"Date",
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
            //movieSelected.
            durationToString(snapshot.data.runtime),
            //"Duration",
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
            getGenresNames(snapshot.data.genres),
            //snapshot.data.genres.length.toString(),
            //"Genre",
            style: TextStyle(
              color: Colors.black,
              fontSize: size.height * 0.02,
              fontFamily: 'Quicksand-Regular',
            ),
          ),
        ],
      ),
    );
    /*return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: snapshot.data.backdrops.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: size.height * 0.2,
            width: size.width * 0.05,
            child: Card(
              child: Row(

                  //contentPadding: EdgeInsets.all(25),
                  children: <Widget>[
                    Image.network(
                      'https://image.tmdb.org/t/p/w185${snapshot.data.backdrops[index].posterPath}',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: size.width * 0.04),
                    Container(
                      width: size.width * 0.6,
                      child: Text(
                        snapshot.data.results[index].title,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: size.height * 0.025,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
            ),
          );
          /*return MovieCard(
            imageUrl:
                'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
            movieTitle: snapshot.data.results[index].title,
          );*/
        });*/
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
                      height: size.height * 0.255,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add to a list",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * 0.03,
                              fontFamily: 'Quicksand-Medium',
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/icons/list.svg",
                                height: size.height * 0.03),
                            label: Text(
                              "Watchlist",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * 0.02,
                                  fontFamily: 'Quicksand-Medium'),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/icons/check.svg",
                                height: size.height * 0.03),
                            label: Text(
                              "Already watched",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * 0.02,
                                  fontFamily: 'Quicksand-Medium'),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            label: Text(
                              "Favourite",
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
