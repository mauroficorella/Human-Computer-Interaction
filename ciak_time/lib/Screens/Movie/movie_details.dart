import 'package:ciak_time/components/cast_list.dart';
import 'package:ciak_time/components/movie_cast_list.dart';
import 'package:ciak_time/components/movie_directors_list.dart';
import 'package:ciak_time/components/watch_providers_list.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MovieDetails extends StatefulWidget {
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          movieSelected.title,
          //'Titolo film',
          style: TextStyle(
            //fontSize: size.height * 0.03,
            fontFamily: 'Quicksand-Medium',
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.005),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Plot",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height * 0.025,
                            fontFamily: 'Quicksand-Medium',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          movieSelected.overview,
                          //"Un giovane hobbit e un variegato gruppo, composto da umani, un nano, un elfo e altri hobbit, partono per un delicata missione, guidati dal potente mago Gandalf. ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height * 0.02,
                            fontFamily: 'Quicksand-Regular',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.008),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How to view",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height * 0.025,
                            fontFamily: 'Quicksand-Medium',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        WatchProvidersList(),
                        /*Container(
                          height: size.width * 0.1,
                          width: size.width * 0.1,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Netflix_icon.svg/1200px-Netflix_icon.svg.png"),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.008),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconTextBold(
                            size: size,
                            label: "Cast",
                            assertIcon: "assets/icons/actor.svg"),
                        SizedBox(height: size.height * 0.005),
                        Container(
                            height: size.height * 0.18, child: MovieCastList()),
                        IconTextBold(
                            size: size,
                            label: "Movie director",
                            assertIcon: "assets/icons/director.svg"),
                        SizedBox(height: size.height * 0.005),
                        Container(
                            height: size.height * 0.18,
                            child: MovieDirectorsList()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconTextBold extends StatelessWidget {
  const IconTextBold({
    Key key,
    @required this.size,
    @required this.label,
    @required this.assertIcon,
  }) : super(key: key);

  final Size size;
  final String label;
  final String assertIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          assertIcon,
          height: size.height * 0.03,
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: size.height * 0.025,
            fontFamily: 'Quicksand-Medium',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
