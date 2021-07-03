import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:ciak_time/Screens/Review/comment_box.dart';
import 'package:ciak_time/Screens/Review/reviewsData_utils.dart';
import 'package:ciak_time/Screens/Review/reviews_page.dart';
import 'package:ciak_time/components/rating.dart';
import 'package:ciak_time/constants.dart';
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
  ScrollController _scrollController = new ScrollController();

  Widget commentChild(size, index) {
    updateCommentList(
        index,
        widget
            .reviewIndex); //serve per quando si cambia username e si ha già commentato qualcosa
    if (savedReviewsLists[index]["reviewsList"][widget.reviewIndex]
            ["comments"] ==
        0) {
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
              controller: _scrollController,
              children: [
                for (var i = 0;
                    i <
                        savedReviewsLists[index]["reviewsList"]
                            [widget.reviewIndex]["comments"];
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
                              /*backgroundImage: getProfileImage(
                                  commentsList[i]['name'],
                                  commentsList[i]['pic']),*/
                              backgroundImage: getBackgroundReviewImage(
                                  savedReviewsLists[index]["reviewsList"]
                                          [widget.reviewIndex]["commentsList"]
                                      [i]['name'],
                                  savedReviewsLists[index]["reviewsList"]
                                          [widget.reviewIndex]["commentsList"]
                                      [i]['pic']),
                            ),

                            //NetworkImage(commentsList[i]['pic'])),
                          ),
                          title: Text(
                            /*getCommentUsername(
                                savedReviewsLists[index]["reviewsList"]
                                        [widget.reviewIndex]["commentsList"][i]
                                    ['name'],
                                index,
                                i),*/
                            savedReviewsLists[index]["reviewsList"]
                                [widget.reviewIndex]["commentsList"][i]['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(savedReviewsLists[index]["reviewsList"]
                                  [widget.reviewIndex]["commentsList"][i]
                              ['message']),
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

  /*String getCommentUsername(username, reviewIndex, commentIndex) {
    print("previoususername  = " + previousUsername + " username: " + username);
    if (username == previousUsername) {
      savedReviewsLists[reviewIndex]["reviewsList"][widget.reviewIndex]
          ["commentsList"][commentIndex]['name'] = userlogged;
      return userlogged;
    } else {
      return savedReviewsLists[reviewIndex]["reviewsList"][widget.reviewIndex]
          ["commentsList"][commentIndex]['name'];
    }
  }*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int index = getGeneratedReviewsIndex(widget.movieId);
    //List reviewsList = savedReviewsLists[index]["reviewsList"]
    //List reviewsList = getGeneratedReviews(widget.movieId); //come era prima

    //List reviewCommentsList = savedReviewsLists[index]["reviewsList"][widget.reviewIndex]["commentsList"]

    //List reviewCommentsList = reviewsList[widget.reviewIndex]["commentsList"];
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
          backgroundImage: getBackgroundImage(),
          child: commentChild(size, index),
          labelText: 'Write a comment...',
          withBorder: false,
          sendButtonMethod: () async {
            comment = commentController.text;

            if (comment == '') {
              showOkAlertDialog(
                  context: context,
                  title: 'You cannot publish an empty comment');
            } else {
              FocusScope.of(context).unfocus();
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
                    if (savedReviewsLists[index]["reviewsList"]
                                [widget.reviewIndex]["commentsList"]
                            .length ==
                        0) {
                      savedReviewsLists[index]["reviewsList"]
                              [widget.reviewIndex]["commentsList"]
                          .insert(0, value);
                    } else {
                      savedReviewsLists[index]["reviewsList"]
                              [widget.reviewIndex]["commentsList"]
                          .insert(
                              savedReviewsLists[index]["reviewsList"]
                                          [widget.reviewIndex]["commentsList"]
                                      .length -
                                  1,
                              value);
                      _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOut);
                    }

                    savedReviewsLists[index]["reviewsList"][widget.reviewIndex]
                        ["comments"] += 1;
                    print(savedReviewsLists[index]["reviewsList"]
                        [widget.reviewIndex]["commentsList"]);
                  });
                  print("Scrolling");

                  /*if (savedReviewsLists[index]["reviewsList"].isNotEmpty) {
                    savedReviewsLists[widget.reviewIndex]['commentsList'] =
                        savedReviewsLists[index]["reviewsList"][widget.reviewIndex]["commentsList"];
                  }*/
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
}
