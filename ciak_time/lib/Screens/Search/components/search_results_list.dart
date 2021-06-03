import 'package:ciak_time/Screens/Search/components/floating_button.dart';
import 'package:flutter/material.dart';

class SearchResultsListView extends StatelessWidget {
  final String searchTerm;

  const SearchResultsListView({
    Key key,
    @required this.searchTerm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (searchTerm == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search,
              size: 64,
            ),
            Text(
              'Start searching',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      );
    }

    return Stack(
      children: <Widget>[
        ListView(
          children: List.generate(
            50,
            (index) => ListTile(
              title: Text('$searchTerm search result'),
              subtitle: Text(index.toString()),
            ),
          ),
        ),
        Positioned(
          bottom: size.width * 0.02,
          right: size.width * 0.28,
          left: size.width * 0.28,
          child: FloatingButton(size: size),
        ),
      ],
    );
  }
}
