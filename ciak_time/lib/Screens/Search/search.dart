import 'package:ciak_time/components/card_list.dart';
import 'package:ciak_time/components/rounded_button.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  static const historyLength = 5;

  // The "raw" history that we don't access from the UI, prefilled with values
  List<String> _searchHistory = [
    'fuchsia',
    'flutter',
    'widgets',
    'resocoder',
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

  bool selected_rate = false;
  bool selected_most_added = false;
  bool selected_most_recent = false;
  bool drama = false;
  bool comedy = false;
  bool action = false;
  bool crime = false;
  bool fantasy = false;
  bool thriller = false;
  bool family = false;
  bool anime = false;
  bool horror = false;
  bool add_movie = false;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(kPrimaryColor);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FloatingSearchBar(
        controller: controller,
        transition: CircularFloatingSearchBarTransition(),
        // Bouncing physics for the search history
        physics: BouncingScrollPhysics(),
        // Title is displayed on an unopened (inactive) search bar
        title: Text(
          selectedTerm ?? 'Search',
          style: Theme.of(context).textTheme.headline6,
        ),
        // Hint gets displayed once the search bar is tapped and opened
        hint: 'Search and find out...',
        actions: [
          FloatingSearchBarAction.searchToClear(),
        ],
        onQueryChanged: (query) {
          setState(() {
            filteredSearchHistory = filterSearchTerms(filter: query);
          });
        },
        onSubmitted: (query) {
          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
          });
          controller.close();
        },
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
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.0785,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CardList(
                        size: size,
                        title: "Popular movies searches",
                        assetName: "assets/icons/movie2.svg",
                        number: 16,
                        height: size.height * 0.23,
                        width: size.width * 0.01,
                      ),
                      CardList(
                        size: size,
                        title: "Popular people searches",
                        assetName: "assets/icons/actor.svg",
                        number: 16,
                        height: size.height * 0.23,
                        width: size.width * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return new AlertDialog(
                  //title: new Text("Filters"),
                  content: StatefulBuilder(
                    builder: (context, setState) {
                      return Column(
                        children: <Widget>[
                          Container(
                            //color: Colors.black,
                            width: size.width * 0.75,
                            child: Text(
                              "Order By:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.03,
                                  fontFamily: 'Quicksand-Medium',
                                  color: kPrimaryColor),
                            ),
                          ),
                          Row(
                            children: [
                              FilterChip(
                                label: Text("Rate"),
                                backgroundColor: Colors.transparent,
                                shape: StadiumBorder(
                                    side: BorderSide(
                                        color: kPrimaryColor,
                                        width: size.width * 0.01)),
                                selected: selected_rate,
                                onSelected: (bool value) {
                                  setState(() {
                                    selected_rate = !selected_rate;
                                    selected_most_recent = false;
                                    selected_most_added = false;
                                  });
                                },
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              FilterChip(
                                label: Text("Most added"),
                                backgroundColor: Colors.transparent,
                                shape: StadiumBorder(
                                    side: BorderSide(
                                        color: kPrimaryColor,
                                        width: size.width * 0.01)),
                                selected: selected_most_added,
                                onSelected: (bool value) {
                                  setState(() {
                                    selected_most_added = !selected_most_added;
                                    selected_rate = false;
                                    selected_most_recent = false;
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FilterChip(
                                label: Text("Most recent"),
                                backgroundColor: Colors.transparent,
                                shape: StadiumBorder(
                                    side: BorderSide(
                                        color: kPrimaryColor,
                                        width: size.width * 0.01)),
                                selected: selected_most_recent,
                                onSelected: (bool value) {
                                  setState(() {
                                    selected_most_recent =
                                        !selected_most_recent;
                                    selected_rate = false;
                                    selected_most_added = false;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Container(
                            //color: Colors.black,
                            width: size.width * 0.75,
                            child: Text(
                              "Genres:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.03,
                                  fontFamily: 'Quicksand-Medium',
                                  color: kPrimaryColor),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                FilterChip(
                                  label: Text("Drama"),
                                  backgroundColor: Colors.transparent,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: kPrimaryColor,
                                          width: size.width * 0.01)),
                                  selected: drama,
                                  onSelected: (bool value) {
                                    setState(() {
                                      drama = !drama;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                FilterChip(
                                  label: Text("Comedy"),
                                  backgroundColor: Colors.transparent,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: kPrimaryColor,
                                          width: size.width * 0.01)),
                                  selected: comedy,
                                  onSelected: (bool value) {
                                    setState(() {
                                      comedy = !comedy;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                FilterChip(
                                  label: Text("Action"),
                                  backgroundColor: Colors.transparent,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: kPrimaryColor,
                                          width: size.width * 0.01)),
                                  selected: action,
                                  onSelected: (bool value) {
                                    setState(() {
                                      action = !action;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FilterChip(
                                  label: Text("Crime"),
                                  backgroundColor: Colors.transparent,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: kPrimaryColor,
                                          width: size.width * 0.01)),
                                  selected: crime,
                                  onSelected: (bool value) {
                                    setState(() {
                                      crime = !crime;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                FilterChip(
                                  label: Text("Fantasy"),
                                  backgroundColor: Colors.transparent,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: kPrimaryColor,
                                          width: size.width * 0.01)),
                                  selected: fantasy,
                                  onSelected: (bool value) {
                                    setState(() {
                                      fantasy = !fantasy;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                FilterChip(
                                  label: Text("Thriller"),
                                  backgroundColor: Colors.transparent,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: kPrimaryColor,
                                          width: size.width * 0.01)),
                                  selected: thriller,
                                  onSelected: (bool value) {
                                    setState(() {
                                      thriller = !thriller;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FilterChip(
                                  label: Text("Family"),
                                  backgroundColor: Colors.transparent,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: kPrimaryColor,
                                          width: size.width * 0.01)),
                                  selected: family,
                                  onSelected: (bool value) {
                                    setState(() {
                                      family = !family;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                FilterChip(
                                  label: Text("Anime"),
                                  backgroundColor: Colors.transparent,
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                        color: kPrimaryColor,
                                        width: size.width * 0.01),
                                  ),
                                  selected: anime,
                                  onSelected: (bool value) {
                                    setState(() {
                                      anime = !anime;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                FilterChip(
                                  label: Text("Horror"),
                                  backgroundColor: Colors.transparent,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: kPrimaryColor,
                                          width: size.width * 0.01)),
                                  selected: horror,
                                  onSelected: (bool value) {
                                    setState(() {
                                      horror = !horror;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "Include added movies",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.02,
                                  fontFamily: 'Quicksand-Medium',
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.05,
                              ),
                              CupertinoSwitch(
                                value: add_movie,
                                onChanged: (bool value) {
                                  setState(() {
                                    add_movie = !add_movie;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  actions: <Widget>[
                    RoundedButton(
                      text: "Apply",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {},
                          ),
                        );
                      },
                    ),
                  ],
                );
              });
        },
        child: SvgPicture.asset(
          "assets/icons/filter.svg",
          height: size.height * 0.15,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            side: BorderSide(color: kPrimaryColor, width: 4.0)),
      ),
    );
  }
}
