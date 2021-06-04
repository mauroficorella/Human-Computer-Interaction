import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class OutBackButtonFilter extends StatefulWidget {
  const OutBackButtonFilter({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _OutButtonFilterState createState() => _OutButtonFilterState();
}

class _OutButtonFilterState extends State<OutBackButtonFilter> {
  Color backgroundColor = Colors.white;
  Color textColor = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          backgroundColor = Colors.amber;
          textColor = Colors.white;
        });

        Navigator.pop(context);
      },
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        minimumSize: Size(widget.size.width * 0.25, widget.size.height * 0.05),
        backgroundColor: backgroundColor,
        side: BorderSide(color: Colors.amber, width: 2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      child: Text(
        "Back",
        style: TextStyle(
          color: textColor,
          fontSize: widget.size.width * 0.04,
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
