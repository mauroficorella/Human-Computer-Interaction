import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:ciak_time/Screens/Review/reviewsData_utils.dart';
import 'package:ciak_time/Screens/Review/reviews_page.dart';
import 'package:ciak_time/components/rating.dart';
import 'package:ciak_time/constants.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage(
      {Key key, @required this.reviewIndex, @required this.movieId})
      : super(key: key);

  final int reviewIndex;
  final int movieId;

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  String comment;

  Widget commentChild(reviewsList, commentsList, size) {
    if (reviewsList[widget.reviewIndex]['comments'] == 0) {
      return Column(
        children: [
          Container(
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
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatarText(
                    size: size,
                    index: widget.reviewIndex,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  RatingUnclickable(
                      unratedColor: Colors.grey,
                      rate: currentReviews[widget.reviewIndex]['rate'] * 2),
                  Text(
                    currentReviews[widget.reviewIndex]['message'],
                    style: TextStyle(
                      fontSize: size.height * 0.02,
                      fontFamily: 'Quicksand-Regular',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.favorite,
                        size: size.width * 0.05,
                        color: kPrimaryColor,
                      ),
                      SizedBox(width: size.width * 0.01),
                      Text(
                        currentReviews[widget.reviewIndex]['likes'].toString(),
                        style: TextStyle(
                          fontSize: size.height * 0.015,
                          fontFamily: 'Quicksand-Regular',
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Icon(
                        Icons.comment,
                        color: kPrimaryColor,
                        size: size.width * 0.05,
                      ),
                      SizedBox(width: size.width * 0.01),
                      Text(
                        currentReviews[widget.reviewIndex]['comments']
                            .toString(),
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: size.height * 0.015,
                            fontFamily: 'Quicksand-Medium'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Text(
            'No comments available',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.02,
              fontFamily: 'Quicksand',
              color: Colors.grey,
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Container(
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
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatarText(
                    size: size,
                    index: widget.reviewIndex,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  RatingUnclickable(
                      unratedColor: Colors.grey,
                      rate: currentReviews[widget.reviewIndex]['rate'] * 2),
                  Text(
                    currentReviews[widget.reviewIndex]['message'],
                    style: TextStyle(
                      fontSize: size.height * 0.02,
                      fontFamily: 'Quicksand-Regular',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.favorite,
                        size: size.width * 0.05,
                        color: kPrimaryColor,
                      ),
                      SizedBox(width: size.width * 0.01),
                      Text(
                        currentReviews[widget.reviewIndex]['likes'].toString(),
                        style: TextStyle(
                          fontSize: size.height * 0.015,
                          fontFamily: 'Quicksand-Regular',
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      Icon(
                        Icons.comment,
                        color: kPrimaryColor,
                        size: size.width * 0.05,
                      ),
                      SizedBox(width: size.width * 0.01),
                      Text(
                        currentReviews[widget.reviewIndex]['comments']
                            .toString(),
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: size.height * 0.015,
                            fontFamily: 'Quicksand-Medium'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Expanded(
            child: ListView(
              children: [
                for (var i = 0;
                    i < reviewsList[widget.reviewIndex]['comments'];
                    i++)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 0.0, 2.0, 0.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            height: 50.0,
                            width: 50.0,
                            decoration: new BoxDecoration(
                                borderRadius:
                                    new BorderRadius.all(Radius.circular(50))),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 50,
                              backgroundImage: getProfileImage(
                                  commentsList[i]['name'],
                                  commentsList[i]['pic']),
                            ),
                            //NetworkImage(commentsList[i]['pic'])),
                          ),
                          title: Text(
                            commentsList[i]['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(commentsList[i]['message']),
                        ),
                        Divider(
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List reviewsList = getGeneratedReviews(widget.movieId);
    List reviewCommentsList = reviewsList[widget.reviewIndex]["commentsList"];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.amber,
          ),
          label: Text(
            "Reviews",
            style:
                TextStyle(color: Colors.amber, fontFamily: 'Quicksand-Regular'),
          ),
        ),
        leadingWidth: size.width * 0.26,
        title: Text("Comments"),
        centerTitle: true,
      ),
      body: Container(
        child: CommentBox(
          userImage: picturePath,
          child: commentChild(reviewsList, reviewCommentsList, size),
          labelText: 'Write a comment...',
          withBorder: false,
          //errorText: "Comment cannot be empty",
          sendButtonMethod: () async {
            comment = commentController.text;
            if (comment == '') {
              showOkAlertDialog(
                  context: context,
                  title: 'You cannot publish an empty comment');
            } else {
              await commentConfirmed(size).then((_) {
                if (formKey.currentState.validate() && isCommentConfirmed) {
                  commentController.clear();
                  FocusScope.of(context).unfocus();

                  setState(() {
                    var value = {
                      'name': userlogged,
                      'pic': picturePath,
                      'message': comment,
                    };
                    if (reviewsList[widget.reviewIndex]["commentsList"]
                            .length ==
                        0) {
                      reviewsList[widget.reviewIndex]["commentsList"]
                          .insert(0, value);
                    } else {
                      reviewsList[widget.reviewIndex]["commentsList"].insert(
                          reviewsList[widget.reviewIndex]["commentsList"]
                                  .length -
                              1,
                          value);
                    }
                  });
                  reviewsList[widget.reviewIndex]["comments"] += 1;
                  if (reviewsList.isNotEmpty) {
                    savedReviewsLists[widget.reviewIndex]['commentsList'] =
                        reviewsList[widget.reviewIndex]["commentsList"];
                  }
                } else {}
              });
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: kPrimaryColor,
          textColor: Colors.white,
          sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }

  Future<bool> commentConfirmed(size) async {
    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Do you really want to publish this comment?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 0.02,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.028,
                  ),
                  Container(
                    width: size.width * 0.7,
                    height: size.height * 0.03,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton.icon(
                          icon: Icon(
                            Icons.dangerous_outlined,
                            color: Colors.red,
                          ),
                          style: TextButton.styleFrom(
                            minimumSize:
                                Size(size.width * 0.1, size.height * 0.005),
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {
                            isCommentConfirmed = false;
                            Navigator.pop(context);
                          },
                          label: Text(
                            "NO",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: size.height * 0.02,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton.icon(
                          icon: Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                          style: TextButton.styleFrom(
                            minimumSize:
                                Size(size.width * 0.1, size.height * 0.005),
                            padding: EdgeInsets.all(0.0),
                          ),
                          onPressed: () {
                            isCommentConfirmed = true;
                            Navigator.pop(context);
                          },
                          label: Text(
                            "YES",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: size.height * 0.02,
                              fontFamily: 'Quicksand',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );

    return isCommentConfirmed;
  }

  getProfileImage(username, path) {
    if (userlogged == username) {
      return AssetImage(path);
    } else {
      return NetworkImage(path);
    }
  }
}
