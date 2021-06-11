import 'package:ciak_time/components/rating.dart';
import 'package:ciak_time/components/rounded_button.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class InsertReview extends StatefulWidget {
  const InsertReview({Key key}) : super(key: key);

  @override
  _InsertReviewState createState() => _InsertReviewState();
}

class _InsertReviewState extends State<InsertReview> {
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
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.amber,
          ),
          label: Text(
            "Reviews", //TODO mettere nome del film
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
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Center(child: RatingWidget()),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * 0.8,
              child: TextField(
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
                showDialog(
                  context: context,
                  builder: (_) {
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextButton.icon(
                                        icon: Icon(
                                          Icons.dangerous_outlined,
                                          color: Colors.red,
                                        ),
                                        style: TextButton.styleFrom(
                                          minimumSize: Size(size.width * 0.1,
                                              size.height * 0.005),
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
                                          minimumSize: Size(size.width * 0.1,
                                              size.height * 0.005),
                                          padding: EdgeInsets.all(0.0),
                                        ),
                                        onPressed: () {},
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
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
