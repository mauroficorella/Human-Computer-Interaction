import 'package:ciak_time/Screens/Review/comments_page.dart';
import 'package:ciak_time/Screens/Review/review.dart';
import 'package:ciak_time/components/rating.dart';

import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      /*floatingActionButton: AddReviewButton(
        size: size,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.amber,
          ),
          label: Text(
            "Back", //TODO mettere nome del film
            style:
                TextStyle(color: Colors.amber, fontFamily: 'Quicksand-Regular'),
          ),
        ),
        leadingWidth: size.width * 0.26,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return InsertReview();
              }));
            },
            child: Row(
              children: [
                Text(
                  "Add a review",
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ),
        ],
        title: Text(
          'Reviews',
          style: TextStyle(
            fontFamily: 'Quicksand',
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ReviewWidget(
                    size: size,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  int like = 10;
  setLike() {
    setState(() {
      like = like + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.size.width * 0.98,
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
                CircleAvatarText(size: widget.size),
                SizedBox(
                  height: widget.size.height * 0.01,
                ),
                RatingUnclickable(
                    unratedColor: Colors.grey,
                    rate:
                        4), //TODO fare un'altra funzione perché il rate qui è diviso per 2
                Text(
                  "Questa è una recensione su quanto Marrel sia Cattivissimo Me",
                  style: TextStyle(
                    fontSize: widget.size.height * 0.02,
                    fontFamily: 'Quicksand-Regular',
                  ),
                ),
                SizedBox(
                  height: widget.size.height * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.favorite,
                      size: widget.size.width * 0.05,
                      color: kPrimaryColor,
                    ),
                    SizedBox(width: widget.size.width * 0.01),
                    Text(
                      like.toString(),
                      style: TextStyle(
                        fontSize: widget.size.height * 0.015,
                        fontFamily: 'Quicksand-Regular',
                      ),
                    ),
                    SizedBox(width: widget.size.width * 0.02),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return CommentsPage();
                        }));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => kPrimaryLightColor),
                      ),
                      icon: Icon(
                        Icons.comment,
                        color: kPrimaryColor,
                        size: widget.size.width * 0.05,
                      ),
                      label: Text(
                        "10",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: widget.size.height * 0.015,
                            fontFamily: 'Quicksand-Medium'),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: widget.size.width * 0.43,
                      child: TextButton.icon(
                        onPressed: () {
                          setLike();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => kPrimaryLightColor),
                        ),
                        icon: Icon(Icons.favorite, color: kPrimaryColor),
                        label: Text(
                          "Like",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: widget.size.height * 0.018,
                              fontFamily: 'Quicksand-Medium'),
                        ),
                      ),
                    ),
                    Container(
                        height: widget.size.height * 0.04,
                        width: widget.size.width * 0.02,
                        child: VerticalDivider(
                          color: Colors.grey,
                        )),
                    Container(
                      width: widget.size.width * 0.43,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                            return CommentsPage();
                          }));
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => kPrimaryLightColor),
                        ),
                        icon: Icon(Icons.comment, color: kPrimaryColor),
                        label: Text(
                          "Comment",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: widget.size.height * 0.018,
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
        SizedBox(height: widget.size.height * 0.01),
      ],
    );
  }
}

class CircleAvatarText extends StatelessWidget {
  const CircleAvatarText({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
              'https://www.casaprogettata.it/wp-content/uploads/2016/01/Users-User-Male-4-icon.png'),
          radius: size.width * 0.03,
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        Text(
          "User",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.02,
            fontFamily: 'Quicksand-Medium',
          ),
        ),
      ],
    );
  }
}

class AddReviewButton extends StatelessWidget {
  const AddReviewButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        label: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 80.0, 0.0),
          child: Text(
            "Add a review",
            style: TextStyle(
              color: Colors.black,
              fontSize: size.height * 0.02,
              fontFamily: 'Quicksand-Medium',
            ),
          ),
        ),
        icon: Padding(
          padding: const EdgeInsets.fromLTRB(80.0, 0.0, 0.0, 0.0),
          child: const Icon(Icons.add, color: Colors.black, size: 30),
        ),
        backgroundColor: Colors.amber,
        elevation: 10,
        onPressed: () {
          Navigator.of(context, rootNavigator: true)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return InsertReview();
          }));
        });
  }
}
