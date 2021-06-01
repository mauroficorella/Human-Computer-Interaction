import 'package:ciak_time/Screens/Person/person.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class OutApplyButtonFilter extends StatefulWidget {
  const OutApplyButtonFilter({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _OutButtonFilterState createState() => _OutButtonFilterState();
}

class _OutButtonFilterState extends State<OutApplyButtonFilter> {
  Color backgroundColor = kPrimaryLightColor;
  Color textColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          if (isFilterSelected() == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Person();
                },
              ),
            );
          } else {
            null;
          }
        });
      },
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        minimumSize: Size(widget.size.width * 0.25, widget.size.height * 0.05),
        backgroundColor: setBackgroundButtonColor(),
        side: BorderSide(color: kPrimaryColor, width: 2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      child: Text(
        "Apply",
        style: TextStyle(
          color: setTextButtonColor(),
          fontSize: widget.size.width * 0.04,
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color setBackgroundButtonColor() {
    Color backgroundColor = kPrimaryLightColor;

    setState(() {
      if (isFilterSelected()) {
        backgroundColor = kPrimaryColor;
      } else {
        backgroundColor = kPrimaryLightColor;
      }
    });
    return backgroundColor;
  }

  Color setTextButtonColor() {
    Color textColor = Colors.grey;
    setState(() {
      if (isFilterSelected()) {
        textColor = Colors.white;
      } else {
        textColor = Colors.grey;
      }
    });
    return textColor;
  }

  bool isFilterSelected() {
    bool filterSelected = false;
    setState(() {
      if (selected_rate ||
          selected_most_added ||
          selected_most_recent ||
          drama ||
          comedy ||
          action ||
          crime ||
          fantasy ||
          thriller ||
          family ||
          anime ||
          horror) {
        filterSelected = true;
      }
    });
    return filterSelected;
  }
}