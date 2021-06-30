import 'dart:async';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InsertReview extends StatefulWidget {
  const InsertReview({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _InsertReviewState createState() => _InsertReviewState();
}

class _InsertReviewState extends State<InsertReview> {
  FutureOr onGoBack(dynamic value) {
    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    if (args.fromWhere == "/insertreviewfromreviews") {
      Navigator.pop(context);
    }
    if (args.fromWhere == "/insertreviewfrommovie") {
      Navigator.popAndPushNamed(context, "/reviewslist");
    }
  }

  final TextEditingController reviewController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  Color color;
  @override
  Widget build(BuildContext context) {
    _focusNode.addListener(() {
      setState(() {
        color = _focusNode.hasFocus ? Colors.blue : Colors.red;
      });
    });
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
            width: size.width * 0.15,
            child: Text(
              widget.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.amber, fontFamily: 'Quicksand-Regular'),
            ),
          ),
        ),
        leadingWidth: size.width * 0.3,
        title: Text(
          'Review the movie',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                "RATE THE MOVIE",
                style: TextStyle(
                  fontFamily: 'Quicksand-Regular',
                  fontSize: size.width * 0.04,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Center(
                child: RatingBar.builder(
                  initialRating: 0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: size.width * 0.1,
                  unratedColor: Colors.grey[400],
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      newRating = rating;
                    });
                  },
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      review = value;
                    });
                  },
                  controller: reviewController,
                  focusNode: _focusNode,
                  maxLines: 10,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    focusedBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: kPrimaryColor)),
                    border: OutlineInputBorder(),
                    focusColor: kPrimaryColor,
                    labelText: 'Write a review',
                    labelStyle: TextStyle(
                      color: _focusNode.hasFocus ? kPrimaryColor : Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: size.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    color: changeSaveColor(),
                    onPressed: () {
                      if (reviewController.text.isNotEmpty && newRating != 0) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return ConfirmReview(
                              size: size,
                              reviewController: reviewController,
                            );
                          },
                        ).then(onGoBack);
                      } else {
                        Fluttertoast.showToast(
                            msg: 'You cannot publish an empty review');
                      }
                    },
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                        color: changeSaveTextColor(),
                        fontSize: size.width * 0.05,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color changeSaveColor() {
    setState(() {
      if (reviewController.text.isNotEmpty && newRating != 0) {
        saveColor = kPrimaryColor;
      } else {
        saveColor = kPrimaryLightColor;
      }
    });
    return saveColor;
  }

  Color changeSaveTextColor() {
    setState(() {
      if (reviewController.text.isNotEmpty && newRating != 0) {
        saveTextColor = Colors.white;
      } else {
        saveTextColor = Colors.grey;
      }
    });
    return saveTextColor;
  }
}

class ConfirmReview extends StatelessWidget {
  const ConfirmReview({
    Key key,
    @required this.size,
    @required this.reviewController,
  }) : super(key: key);

  final Size size;
  final TextEditingController reviewController;

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      content: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Do you really want to publish this review?",
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
                        setState(
                          () {
                            var value = {
                              'name': 'Vittoria',
                              'pic':
                                  'https://shop.krystmedia.at/wp-content/uploads/2020/04/avatar-1.jpg',
                              'message': reviewController.text,
                              'rate': newRating,
                              'likes': 0,
                              'comments': 0,
                            };
                            reviewsData.insert(0, value);
                          },
                        );
                        Navigator.pop(context); //closes the alert dialog
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
              )
            ],
          );
        },
      ),
    );
  }
}
