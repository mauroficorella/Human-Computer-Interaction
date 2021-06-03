import 'package:ciak_time/Screens/Search/components/cards_widget.dart';
import 'package:ciak_time/Screens/Search/components/search_results_list.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key key, @required bodyIndex}) : super(key: key);
  final int bodyIndex = 1;

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StatefulBuilder(
      builder: (context, setState) {
        if (widget.bodyIndex == 1) {
          return CardsWidget(size: size);
        } else {
          return SearchResultsListView(searchTerm: "");
        }
      },
    );
  }
}
