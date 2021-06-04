import 'package:ciak_time/Screens/Search/components/cards_widget.dart';
import 'package:ciak_time/Screens/Search/components/search_results_list.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  static const historyLength = 5;

  // The "raw" history that we don't access from the UI, prefilled with values
  List<String> _searchHistory = [
    "Harry Potter and the philosofer's stone",
    "Harry Potter and the prisoner of Azkaban",
    "The Lord of the Rings: The Fellowship of the Ring",
    "The fast and the furious",
  ];
  // The filtered & ordered history that's accessed from the UI
  List<String> filteredSearchHistory;

  // The currently searched-for term
  String selectedTerm;

  List<String> filterSearchTerms({
    @required String filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      // Reversed because we want the last added items to appear first in the UI
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      // This method will be implemented soon
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }
    // Changes in _searchHistory mean that we have to update the filteredSearchHistory
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
    int bodyIndex = 1;

    Widget content = CardsWidget(size: size);
    FlutterStatusbarcolor.setStatusBarColor(kPrimaryColor);
    return Scaffold(
      body: StatefulBuilder(builder: (context, setState) {
        return FloatingSearchBar(
          onFocusChanged: (isFocused) {
            setState(() {
              if (isFocused && bodyIndex == 1) {
                bodyIndex = 0;
                //content = new SearchResultsListView(searchTerm: "");
              }
            });
          },

          controller: controller,
          automaticallyImplyBackButton: false,

          transition: CircularFloatingSearchBarTransition(),
          // Bouncing physics for the search history
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
          // Title is displayed on an unopened (inactive) search bar
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
            //style: Theme.of(context).textTheme.headline6,
          ),
          // Hint gets displayed once the search bar is tapped and opened
          hint: 'Search...',
          actions: [
            FloatingSearchBarAction.searchToClear(),
          ],
          onQueryChanged: (query) {
            setState(() {
              filteredSearchHistory = filterSearchTerms(filter: query);
              content = new SearchResultsListView(searchTerm: query);
              //start showing results
            });
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
            });

            controller.close();
            /*if (query == "The Lord of the Rings: The Fellowship of the Ring") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Movie();
                  },
                ),
              );
            }*/
          },
          body: new Container(
            child: content,
          ),
          //body: BodyWidget(bodyIndex: bodyIndex),
          /*bodyIndex == 1
              ? SearchResultsListView(searchTerm: "")
              : CardsWidget(size: size)*/

          builder: (BuildContext context, Animation<double> transition) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Colors.white,
                elevation: 4,
                child: Builder(
                  builder: (context) {
                    if (filteredSearchHistory.isEmpty &&
                        controller.query.isEmpty) {
                      return Container(
                        height: 56,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Start searching',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      );
                    } else if (filteredSearchHistory.isEmpty) {
                      return ListTile(
                        title: Text(controller.query),
                        leading: const Icon(Icons.search),
                        onTap: () {
                          setState(() {
                            addSearchTerm(controller.query);
                            selectedTerm = controller.query;
                          });
                          controller.close();
                        },
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: filteredSearchHistory
                            .map(
                              (term) => ListTile(
                                title: Text(
                                  term,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                leading: const Icon(Icons.history),
                                trailing: IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    setState(() {
                                      deleteSearchTerm(term);
                                    });
                                  },
                                ),
                                onTap: () {
                                  setState(() {
                                    putSearchTermFirst(term);
                                    selectedTerm = term;
                                    content = new SearchResultsListView(
                                        searchTerm: selectedTerm);
                                  });
                                  controller.close();
                                },
                              ),
                            )
                            .toList(),
                      );
                    }
                  },
                ),
              ),
            );
          },
        );
      }),
      /*floatingActionButton: FloatingButton(size: size),*/
    );
  }
}
