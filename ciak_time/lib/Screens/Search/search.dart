import 'package:ciak_time/components/card_list.dart';

import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Stack(
          fit: StackFit.expand,
          children: [
            buildFloatingSearchBar(),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CardList(
                      size: size,
                      title: "Upcoming movies",
                      assetName: "assets/icons/history.svg",
                      number: 16,
                      height: size.height * 0.23,
                      width: size.width * 0.01,
                    ),
                    CardList(
                      size: size,
                      title: "Popular movies",
                      assetName: "assets/icons/movie2.svg",
                      number: 16,
                      height: size.height * 0.23,
                      width: size.width * 0.01,
                    ),
                    CardList(
                      size: size,
                      title: "Popular people",
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
    );
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

/*class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Container(
            height: size.height * 0.05,
            width: size.width * 1,
            //margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: navBarColor,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        //color: Colors.black,
                        fontSize: 20,
                      ),
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Row(
                    children: <Widget>[
                      VerticalDivider(color: kPrimaryColor),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/setting-lines.svg",
                          height: size.height * 0.15,
                        ),
                        //icon: Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CardList(
                      size: size,
                      title: "Upcoming movies",
                      assetName: "assets/icons/history.svg",
                      number: 16,
                      height: size.height * 0.23,
                      width: size.width * 0.01,
                    ),
                    CardList(
                      size: size,
                      title: "Popular movies",
                      assetName: "assets/icons/movie2.svg",
                      number: 16,
                      height: size.height * 0.23,
                      width: size.width * 0.01,
                    ),
                    CardList(
                      size: size,
                      title: "Popular people",
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
    );
  }
}*/
