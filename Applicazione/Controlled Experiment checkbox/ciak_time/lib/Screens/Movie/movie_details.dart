import 'package:ciak_time/components/movie_cast_list.dart';
import 'package:ciak_time/components/movie_directors_list.dart';
import 'package:ciak_time/components/watch_providers_list.dart';
import 'package:ciak_time/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MovieDetails extends StatefulWidget {
  final Movie movieSelected;
  final String fromWhere;

  const MovieDetails(
      {Key key, @required this.movieSelected, @required this.fromWhere})
      : super(key: key);
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.amber,
          ),
          label: Container(
            width: size.width * 0.2,
            child: Text(
              widget.movieSelected.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.amber, fontFamily: 'Quicksand-Regular'),
            ),
          ),
        ),
        leadingWidth: size.width * 0.5,
        centerTitle: true,
        title: Text(
          "Movie info",
          
          style: TextStyle(
            
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
                          widget.movieSelected.overview,
                          
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
                        WatchProvidersList(
                          movieSelected: widget.movieSelected,
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
                        IconTextBold(
                            size: size,
                            label: "Cast",
                            assertIcon: "assets/icons/actor.svg"),
                        SizedBox(height: size.height * 0.005),
                        Container(
                            height: size.height * 0.2,
                            child: MovieCastList(
                              movieSelected: widget.movieSelected,
                              fromWhere: widget.fromWhere,
                            )),
                        IconTextBold(
                            size: size,
                            label: "Movie director",
                            assertIcon: "assets/icons/director.svg"),
                        SizedBox(height: size.height * 0.005),
                        Container(
                            height: size.height * 0.2,
                            child: MovieDirectorsList(
                              movieSelected: widget.movieSelected,
                              fromWhere: widget.fromWhere,
                            )),
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
