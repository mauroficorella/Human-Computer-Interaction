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
    "Harry Potter and the philosofer's stone",
    "Harry Potter and the prisoner of Azkaban",
    "The Lord of the Rings: The Fellowship of the Ring",
    "The fast and the furious",
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

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: StatefulBuilder(builder: (context, setState) {
          return FloatingSearchAppBar(
            /*bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.cloud_outlined),
                ),
                Tab(
                  icon: Icon(Icons.beach_access_sharp),
                ),
                
              ],
            ),*/
            alwaysOpened: true,
            color: kPrimaryColor,
            colorOnScroll: kPrimaryColor,
            onFocusChanged: (isFocused) {
              setState(() {
                content = new SearchResultsListView(
                  searchTerm: selectedTerm,
                  callback: callback,
                );
              });
            },
            accentColor: Colors.amber,
            iconColor: Colors.white,
            hintStyle: TextStyle(color: navBarColor),
            titleStyle: TextStyle(color: Colors.white),
            controller: controller,
            automaticallyImplyBackButton: false,
            //transition: CircularFloatingSearchBarTransition(),
            //physics: BouncingScrollPhysics(),
            /*leadingActions: [
              FloatingSearchBarAction(
                showIfClosed: false,
                showIfOpened: true,
                child: CircularButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
              ),
            ],*/
            //title: Center(child: Text("Search",)),

            /*Text(
              selectedTerm ?? '',
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
            hint: 'Search...',*/
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
            /*queryStyle: TextStyle(
                color: Colors.black87,
                fontSize: size.height * 0.02,
                fontFamily: 'Quicksand-Medium'),*/
            /*hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: size.height * 0.02,
                fontFamily: 'Quicksand-Medium'),*/
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

            body: Column(
              children: <Widget>[
                Material(
                  color: kPrimaryColor,
                  child: TabBar(
                    onTap: (index) {
                      if (index == 0) {
                        tabSelected = "Movie";
                      } else {
                        tabSelected = "Person";
                      }
                    },
                    indicatorColor: Colors.amber,
                    unselectedLabelColor: navBarColor,
                    labelColor: Colors.amber,
                    tabs: [
                      Tab(
                          icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.movie,
                          ),
                          SizedBox(
                            width: size.width * 0.015,
                          ),
                          Text("Movies")
                        ],
                      )),
                      Tab(
                          icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person),
                          SizedBox(
                            width: size.width * 0.015,
                          ),
                          Text("Persons")
                        ],
                      )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TabBarView(
                    children: [
                      new Container(
                        child: content,
                      ),
                      new Container(
                        child: content,
                      ),
                    ],
                  ),
                )
              ],
            ), /*TabBarView(children: <Widget>[
              Text("prova"),
              Text("prova2")
              /*new Container(
                child: content,
              ),
              new Container(
                child: content,
              ),*/
            ]),*/

            /*builder: (BuildContext context, Animation<double> transition) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Material(
                  color: Colors.white,
                  elevation: 4,
                  child: StatefulBuilder(
                    builder: (context, setState) {
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
                                          callback: callback, searchTerm: term);
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
            },*/
          );
        }),
      ),
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
