import 'package:ciak_time/Screens/Search/components/search_results_list.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  static const historyLength = 5;

  List<String> _searchHistory = [
    
  ];

  List<String> filteredSearchHistory;

  String selectedTerm;

  List<String> filterSearchTerms({
    @required String filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: StatefulBuilder(builder: (context, setState) {
        return FloatingSearchBar(
          onFocusChanged: (isFocused) {
            setState(() {
              content = new SearchResultsListView(
                searchTerm: selectedTerm,
                callback: callback,
              );
            });
          },
          controller: controller,
          automaticallyImplyBackButton: false,
          transition: CircularFloatingSearchBarTransition(),
          physics: BouncingScrollPhysics(),
          leadingActions: [
            FloatingSearchBarAction(
              showIfClosed: false,
              showIfOpened: true,
              child: CircularButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {},
              ),
            ),
          ],
          title: Text(
            selectedTerm ?? 'Search',
            style: selectedTerm == null
                ? TextStyle(
                    color: Colors.grey,
                    fontSize: size.height * 0.02,
                    fontFamily: 'Quicksand-Medium',
                  )
                : TextStyle(
                    color: Colors.black87,
                    fontSize: size.height * 0.02,
                    fontFamily: 'Quicksand-Medium',
                  ),
          ),
          hint: 'Search...',
          actions: [
            FloatingSearchBarAction.searchToClear(
              showIfClosed: false,
            ),
            FloatingSearchBarAction(
              showIfClosed: true,
              showIfOpened: false,
              child: CircularButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(
                    () {
                      selectedTerm = null;
                      content = new SearchResultsListView(
                        searchTerm: selectedTerm,
                        callback: callback,
                      );
                    },
                  );
                },
              ),
            ),
          ],
          onQueryChanged: (query) {
            setState(
              () {
                filteredSearchHistory = filterSearchTerms(filter: query);
                selectedTerm = query;
                content = new SearchResultsListView(
                  searchTerm: query,
                  callback: callback,
                );
              },
            );
          },
          queryStyle: TextStyle(
              color: Colors.black87,
              fontSize: size.height * 0.02,
              fontFamily: 'Quicksand-Medium'),
          hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: size.height * 0.02,
              fontFamily: 'Quicksand-Medium'),
          clearQueryOnClose: false,
          onSubmitted: (query) {
            setState(() {
              addSearchTerm(query);
              selectedTerm = query;
              content = new SearchResultsListView(
                searchTerm: query,
                callback: callback,
              );
            });

            controller.close();
          },
          body: new Container(
            child: content,
          ),
          builder: (BuildContext context, Animation<double> transition) {
            
          },
        );
      }),
    );
  }

  void callback() {
    setState(() {
      content = new SearchResultsListView(
        searchTerm: selectedTerm,
        callback: callback,
      );
    });
  }
}
