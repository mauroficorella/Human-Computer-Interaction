import 'dart:async';

import 'package:ciak_time/Screens/Review/comments_page.dart';
import 'package:ciak_time/components/rating.dart';

import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class ReviewsPage extends StatefulWidget {
  final String title;

  const ReviewsPage({Key key, @required this.title}) : super(key: key);

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }


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
              widget.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.amber, fontFamily: 'Quicksand-Regular'),
            ),
          ),
        ),
        leadingWidth: size.width * 0.5,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/insertreviewfromreviews', arguments: ScreenArguments('/insertreviewfromreviews'))
                  .then((_) => setState(() {}));
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
                itemCount: reviewsData.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ReviewWidget(
                    index: index,
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
    @required this.index,
  }) : super(key: key);

  final Size size;
  final int index;

  @override
  _ReviewWidgetState createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  IconData likeIcon = Icons.favorite_border_outlined;
  IconData setLike() {
    setState(() {
      if (likeIcon == Icons.favorite) {
        reviewsData[widget.index]['likes'] -= 1;
        likeIcon = Icons.favorite_border_outlined;
      } else {
        reviewsData[widget.index]['likes'] += 1;
        likeIcon = Icons.favorite;
      }
    });
    return likeIcon;
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
                CircleAvatarText(
                  size: widget.size,
                  index: widget.index,
                ),
                SizedBox(
                  height: widget.size.height * 0.01,
                ),
                RatingUnclickable(
                    unratedColor: Colors.grey,
                    rate: reviewsData[widget.index]['rate'] * 2),
                Text(
                  reviewsData[widget.index]['message'],
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
                      reviewsData[widget.index]['likes'].toString(),
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
                          return CommentsPage(
                            reviewIndex: widget.index,
                          );
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
                        reviewsData[widget.index]['comments'].toString(),
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
                        icon: Icon(likeIcon, color: kPrimaryColor),
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
                            return CommentsPage(
                              reviewIndex: widget.index,
                            );
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
    @required this.index,
  }) : super(key: key);

  final int index;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(reviewsData[index]['pic']),
          radius: size.width * 0.06,
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        Text(
          reviewsData[index]['name'],
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
