import 'package:ciak_time/Screens/Search/components/floating_button.dart';
import 'package:ciak_time/components/search_movie_results_list.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class SearchResultsListView extends StatefulWidget {
  final String searchTerm;
  final Function callback;

  const SearchResultsListView({
    Key key,
    @required this.searchTerm,
    @required this.callback,
  }) : super(key: key);

  @override
  _SearchResultsListViewState createState() => _SearchResultsListViewState();
}

class _SearchResultsListViewState extends State<SearchResultsListView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (widget.searchTerm == null) {
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
    } else if (tabSelected == "Person") {
      return SearchMovieResultsList(
        queryString: widget.searchTerm,
      );
    } else {
      return Stack(
        children: <Widget>[
          SearchMovieResultsList(
            queryString: widget.searchTerm,
          ),
          Positioned(
            bottom: size.width * 0.02,
            right: size.width * 0.28,
            left: size.width * 0.28,
            child: FloatingButton(
              callback: widget.callback,
              size: size,
              selectedTerm: widget.searchTerm,
            ),
          ),
        ],
      );
    }
  }
}
