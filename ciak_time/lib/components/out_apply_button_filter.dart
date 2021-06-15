import 'package:ciak_time/Screens/Search/components/search_results_list.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class OutApplyButtonFilter extends StatefulWidget {
  const OutApplyButtonFilter({
    Key key,
    @required this.size,
    @required this.selectedTerm, @required this.callback,
  }) : super(key: key);

  final Size size;
  final String selectedTerm;
  final Function callback;

  @override
  _OutButtonFilterState createState() => _OutButtonFilterState();
}

class _OutButtonFilterState extends State<OutApplyButtonFilter> {
  Color backgroundColor = Colors.amber[50];
  Color textColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          if (isFilterSelected() == true) {
            //aggiornare il content della search in modo da far cambiare dinamicamente il body della ricerca
            print(widget.selectedTerm);
            widget.callback();
            //Navigator.of(context).pop();

            //updateBody();
          } else {}
        });
      },
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        minimumSize: Size(widget.size.width * 0.25, widget.size.height * 0.05),
        backgroundColor: setBackgroundButtonColor(),
        side: BorderSide(color: Colors.amber, width: 2),
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
    Color backgroundColor = Colors.amber[50];

    setState(() {
      if (isFilterSelected()) {
        backgroundColor = Colors.amber;
      } else {
        backgroundColor = Colors.amber[50];
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
