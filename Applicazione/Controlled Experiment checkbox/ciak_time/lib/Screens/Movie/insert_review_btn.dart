import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class InsertReviewBtn extends StatelessWidget {
  const InsertReviewBtn({
    Key key,
    @required this.size,
    @required this.fromWhere,
  }) : super(key: key);

  final Size size;
  final String fromWhere;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.98,
      child: TextButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, fromWhere,
              arguments: ScreenArguments(fromWhere));
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
        icon: Icon(Icons.edit, color: Colors.white),
        label: Text(
          "Insert a review",
          style: TextStyle(
              color: Colors.white,
              fontSize: size.height * 0.02,
              fontFamily: 'Quicksand-Medium'),
        ),
      ),
    );
  }
}
