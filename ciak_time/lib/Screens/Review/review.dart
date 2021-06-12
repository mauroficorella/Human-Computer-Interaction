import 'package:ciak_time/Screens/Review/reviews_page.dart';
import 'package:ciak_time/components/rating.dart';
import 'package:ciak_time/components/rounded_button.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class InsertReview extends StatefulWidget {
  const InsertReview({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _InsertReviewState createState() => _InsertReviewState();
}

class _InsertReviewState extends State<InsertReview> {
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
          label: Text(
            widget.title,
            style:
                TextStyle(color: Colors.amber, fontFamily: 'Quicksand-Regular'),
          ),
        ),
        leadingWidth: size.width * 0.26,
        title: Text(
          'Review the movie',
          style: TextStyle(
            fontFamily: 'Quicksand',
          ),
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
              Center(child: RatingWidget()),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                width: size.width * 0.8,
                child: TextField(
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
              RoundedButton(
                text: "SAVE",
                radius: 5,
                press: () {
                  if (reviewController.text.isNotEmpty) {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return ConfirmReview(
                          size: size,
                          reviewController: reviewController,
                        );
                      },
                    );
                  }
                  /*showDialog(
                      context: context,
                      builder: (_) {
                        return ConfirmReview(size: size, reviewController: reviewController,);
                      },
                    );*/
                },
              ),
            ],
          ),
        ),
      ),
    );
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
          return Container(
            height: size.height * 0.11,
            child: Column(
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
                        onPressed: () {},
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
                              };
                              reviewsData.insert(0, value);
                            },
                          );
                          Navigator.pop(
                              context); //TODO farlo tornare alla schermata della lista delle reviews
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
            ),
          );
        },
      ),
    );
  }
}
