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
          //backgroundColor = Colors.amber;
          //textColor = Colors.white;
          isReset = true;
          deselectAllFilters();

          /*drama = false;
          comedy = false;
          action = false;
          crime = false;
          fantasy = false;
          thriller = false;
          family = false;
          anime = false;
          horror = false;

          colorRate = Colors.black;
          colorMostAdded = Colors.black;
          colorMostRecent = Colors.black;
          colorDrama = Colors.black;
          colorComedy = Colors.black;
          colorAction = Colors.black;
          colorCrime = Colors.black;
          colorFantasy = Colors.black;
          colorThriller = Colors.black;
          colorFamily = Colors.black;
          colorAnime = Colors.black;
          colorHorror = Colors.black;*/
        });
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
        "Reset",
        style: TextStyle(
          color: textColor,
          fontSize: widget.size.width * 0.04,
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void deselectAllFilters() {
    //bool isReset = false;
    setState(() {
      if (isReset == true) {
        drama = false;
        comedy = false;
        action = false;
        crime = false;
        fantasy = false;
        thriller = false;
        family = false;
        anime = false;
        horror = false;
        colorRate = Colors.black;
        colorMostAdded = Colors.black;
        colorMostRecent = Colors.black;
        colorDrama = Colors.black;
        colorComedy = Colors.black;
        colorAction = Colors.black;
        colorCrime = Colors.black;
        colorFantasy = Colors.black;
        colorThriller = Colors.black;
        colorFamily = Colors.black;
        colorAnime = Colors.black;
        colorHorror = Colors.black;
      }

      /**/
    });
  }
}
