import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key key,
    @required this.imageUrl,
    @required this.movieTitle,
  }) : super(key: key);

  final String imageUrl;
  final String movieTitle;

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Card(
          child: Stack(
            children: [
              Container(
                height: size.width * 0.45,
                width: size.width * 0.3,
                //width: 50.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 2.0,
                child: Container(
                  width: size.width * 0.28,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.9),
                        spreadRadius: 5,
                        blurRadius: 18,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 4.0),
                        child: Text(
                          movieTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.035,
                            fontFamily: 'Quicksand-Regular',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Text(voteAverage),
            ],
          ),
        ),
      ],
    );
  }
}

/* 
Stack(
            children: [
              Center(
                // MOVIE COVER
                child: Container(
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "http://vulcanostatale.it/wp-content/uploads/2016/03/lord-of-the-rings-1-the-fellowship-of-the-ring-movie-poster-2001-1020195991.jpg"),
                        fit: BoxFit.cover),
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
              ),
              // BACK ARROW //TODO METTERE L'onPressed
              Positioned(
                left: size.width * 0.03,
                top: size.width * 0.1,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
              // BLACK SHADOW BOX UNDER TITLE AND INFO
              Positioned(
                top: size.width * 0.35,
                child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 18,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
              // TITLE, DURATION, DATE, GENRE AND RATE
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
                        "Il Signore degli Anelli: La compagnia del montone",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.03,
                          fontFamily: 'Quicksand-Medium',
                        ),
                      ),
                      RatingUnclickable(),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text(
                        "Date" + " • " + "Duration" + " • " + "Genre",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.height * 0.02,
                          fontFamily: 'Quicksand-Medium',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // LIKE BUTTON
              Positioned(
                right: size.width * 0.04,
                top: size.width * 0.12,
                child: LikeBtn(size: size),
              ),
            ],
          ),
*/
