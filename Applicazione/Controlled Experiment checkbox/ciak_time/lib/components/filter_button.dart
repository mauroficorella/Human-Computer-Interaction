import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({
    Key key,
    @required this.filterName,
  }) : super(key: key);

  final String filterName;

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool selected = false;
  Color textColor = Colors.black;
  Color checkmarkColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FilterChip(
      label: Text(
        widget.filterName,
      ),
      labelStyle: TextStyle(color: textColor),
      checkmarkColor: checkmarkColor,
      backgroundColor: Colors.transparent,
      selectedColor: kPrimaryColor,
      shape: StadiumBorder(
        side: BorderSide(
          color: kPrimaryColor,
          width: size.width * 0.0055,
        ),
      ),
      selected: _selectButton(),
      onSelected: (bool value) {
        setState(() {
          _toggleSelectedButton();
          if (!_selectButton()) {
            checkmarkColor = Colors.black;
            textColor = Colors.black;
          } else {
            checkmarkColor = Colors.white;
            textColor = Colors.white;
          }
        });
      },
    );
  }

  bool _selectButton() {
    if (widget.filterName == "Drama") {
      selected = drama;
    }
    if (widget.filterName == "Comedy") {
      selected = comedy;
    }
    if (widget.filterName == "Action") {
      selected = action;
    }
    if (widget.filterName == "Crime") {
      selected = crime;
    }
    if (widget.filterName == "Fantasy") {
      selected = fantasy;
    }
    if (widget.filterName == "Thriller") {
      selected = thriller;
    }
    if (widget.filterName == "Family") {
      selected = fantasy;
    }
    if (widget.filterName == "Anime") {
      selected = anime;
    }
    if (widget.filterName == "Horror") {
      selected = horror;
    }

    return selected;
  }

  _toggleSelectedButton() {
    if (widget.filterName == "Drama") {
      drama = !drama;
    }
    if (widget.filterName == "Comedy") {
      comedy = !comedy;
    }
    if (widget.filterName == "Action") {
      action = !action;
    }
    if (widget.filterName == "Crime") {
      crime = !crime;
    }
    if (widget.filterName == "Fantasy") {
      fantasy = !fantasy;
    }
    if (widget.filterName == "Thriller") {
      thriller = !thriller;
    }
    if (widget.filterName == "Family") {
      family = !family;
    }
    if (widget.filterName == "Anime") {
      anime = !anime;
    }
    if (widget.filterName == "Horror") {
      horror = !horror;
    }
  }
}
