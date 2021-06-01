import 'package:ciak_time/components/card_list.dart';
import 'package:ciak_time/components/rating.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';

class Movie extends StatefulWidget {
  @override
  _MovieState createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Stack(children: [
        Positioned(
          right: size.width * 0,
          bottom: size.height * 0.58,
          child: FloatingActionButton(
            child: const Icon(Icons.add, color: Colors.white, size: 40),
            backgroundColor: kPrimaryColor,
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
                            height: size.height * 0.2,
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
                                  icon: SvgPicture.asset(
                                      "assets/icons/list.svg",
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
                                  icon: SvgPicture.asset(
                                      "assets/icons/check.svg",
                                      height: size.height * 0.03),
                                  label: Text(
                                    "Already watched",
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
          ),
        ),
      ]),
      body: Column(
        children: [
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
                      child: Text(
                        "Un giovane hobbit e un variegato gruppo, composto da umani, un nano, un elfo e altri hobbit, partono per un delicata missione, guidati dal potente mago Gandalf. Devono distruggere un anello magico e sconfiggere il malvagio Sauron.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size.height * 0.02,
                          fontFamily: 'Quicksand-Regular',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  // HOW TO VIEW //TODO AGGIUNGERE ICONA PIATTAFORMA
                  Container(
                    width: size.width * 0.98,
                    height: size.height * 0.05,
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
                      child: Row(
                        children: [
                          Text(
                            "How to view:",
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
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  // CAST E MOVIE DIRECTOR
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
                          CardList(
                            size: size,
                            title: "Cast",
                            assetName: "assets/icons/actor.svg",
                            number: 16,
                            height: size.height * 0.15,
                            width: size.width * 0.01,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/director.svg",
                                height: size.height * 0.03,
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Text(
                                "Movie director",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: size.height * 0.03,
                                    fontFamily: 'Quicksand-Medium'),
                              ),
                            ],
                          ),
                          Container(
                            width: size.width * 0.3,
                            height: size.width * 0.3,
                            child: Card(
                              color: Colors.amber,
                              child: Center(
                                child: Text('Dummy Card Text'),
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
                  // REVIEW CONTAINER
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
                            "Review",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.height * 0.03,
                              fontFamily: 'Quicksand-Medium',
                            ),
                          ),
                          // REVIEW NUMBER
                          Row(
                            children: [
                              Text(
                                "Review number: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * 0.02,
                                  fontFamily: 'Quicksand-Medium',
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              // VIEW ALL REVIEWS BTN //TODO mettere onPressed
                              Container(
                                width: size.width * 0.57,
                                child: TextButton.icon(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              kPrimaryColor)),
                                  label: Icon(Icons.arrow_right_alt,
                                      color: Colors.white),
                                  icon: Text(
                                    "View all reviews",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height * 0.02,
                                        fontFamily: 'Quicksand-Medium'),
                                  ),
                                ),
                              )
                            ],
                          ),
                          // INSERT A REVIEW BTN //TODO mettere onPressed
                          Container(
                            width: size.width * 0.98,
                            child: TextButton.icon(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(kPrimaryColor)),
                              icon: Icon(Icons.edit, color: Colors.white),
                              label: Text(
                                "Insert a review",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height * 0.02,
                                    fontFamily: 'Quicksand-Medium'),
                              ),
                            ),
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


class LikeBtn extends StatelessWidget {
  const LikeBtn({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      size: 30,
      circleColor: CircleColor(start: Colors.red[50], end: Colors.red[100]),
      bubblesColor: BubblesColor(
        dotPrimaryColor: Colors.red[200],
        dotSecondaryColor: Colors.redAccent[400],
      ),
      likeBuilder: (bool isLiked) {
        return Icon(
          Icons.favorite,
          color: isLiked ? Colors.redAccent[700] : Colors.white,
          size: size.width * 0.08,
        );
      },
    );
  }
}

