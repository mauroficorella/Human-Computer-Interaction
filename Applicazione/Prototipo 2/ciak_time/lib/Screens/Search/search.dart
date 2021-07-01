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

  List<String> filteredSearchHistory;

  String selectedTerm;

  FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
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
            
            alwaysOpened: true,
            color: kPrimaryColor,
            elevation: 10.0,
            liftOnScrollElevation: 10.0,
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
                  selectedTerm = query;
                  content = new SearchResultsListView(
                    searchTerm: query,
                    callback: callback,
                  );
                },
              );
            },

            clearQueryOnClose: false,
            onSubmitted: (query) {
              setState(() {
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
                    physics: NeverScrollableScrollPhysics(),
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
            ),
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
