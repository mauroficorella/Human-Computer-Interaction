import 'package:ciak_time/Screens/Homescreen/homescreen.dart';
import 'package:ciak_time/Screens/Movie/movie_details.dart';
import 'package:ciak_time/Screens/Movie/movie_home.dart';
import 'package:ciak_time/Screens/Movie/movie_search.dart';
import 'package:ciak_time/Screens/Movie/movie_user.dart';
import 'package:ciak_time/Screens/Person/filmography_grid_view.dart';
import 'package:ciak_time/Screens/Person/person_home.dart';
import 'package:ciak_time/Screens/Person/person_user.dart';
import 'package:ciak_time/Screens/Review/review.dart';
import 'package:ciak_time/Screens/Review/reviews_page.dart';
import 'package:ciak_time/Screens/Search/search.dart';
import 'package:ciak_time/Screens/User/all_movies_aw_list.dart';
import 'package:ciak_time/Screens/User/all_movies_f_list.dart';
import 'package:ciak_time/Screens/User/all_movies_w_list.dart';
import 'package:ciak_time/Screens/User/user.dart';
import 'package:ciak_time/Screens/User/user_settings.dart';
import 'package:ciak_time/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Person/person_search.dart';

class Destination {
  const Destination(
    this.index,
    this.title,
    this.icon,
    this.color,
  );
  final int index;
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination(0, 'Home', Icons.home, Colors.teal),
  Destination(1, 'Search', Icons.search, Colors.cyan),
  Destination(2, 'User', Icons.person, Colors.blue),
];

class ViewNavigatorObserver extends NavigatorObserver {
  ViewNavigatorObserver(this.onNavigation);

  final VoidCallback onNavigation;

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }

  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }
}

class DestinationView extends StatefulWidget {
  const DestinationView(
      {Key key, this.destination, this.onNavigation, this.navigatorKey})
      : super(key: key);

  final Destination destination;
  final VoidCallback onNavigation;
  final Key navigatorKey;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      observers: <NavigatorObserver>[
        ViewNavigatorObserver(widget.onNavigation),
      ],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          

          settings: settings,
          builder: (BuildContext context) {
            if (widget.destination.title == "User") {
              switch (settings.name) {
                case '/':
                  return User();
                case '/settings':
                  return UserSettings();
                case '/watchlist':
                  return AllMoviesInWList();
                case '/alreadywatchedlist':
                  return AllMoviesInAWList();
                case '/favouritelist':
                  return AllMoviesInFList();
                case '/movie':
                  return MovieUser();
                case '/filmography':
                  return FilmographyGridView(
                    personName: personSelectedFromUser.name,
                    fromWhere: "User",
                  );
                case '/moviedetails':
                  return MovieDetails(
                    movieSelected: movieSelectedFromUser,
                    fromWhere: "User",
                  );
                case '/person':
                  return PersonUser();
                case '/reviewslist':
                  return ReviewsPage(
                    title: movieSelectedFromUser.title,
                  );
                case '/insertreviewfrommovie':
                  return InsertReview(
                    title: movieSelectedFromUser.title,
                  );
                case '/insertreviewfromreviews':
                  return InsertReview(
                    title: "Reviews",
                  );
              }
            } else if (widget.destination.title == "Home") {
              switch (settings.name) {
                case '/':
                  return Home();
                case '/movie':
                  return MovieHome();
                case '/person':
                  return PersonHome();
                case '/filmography':
                  return FilmographyGridView(
                    personName: personSelectedFromHome.name,
                    fromWhere: "Home",
                  );
                case '/moviedetails':
                  return MovieDetails(
                    movieSelected: movieSelectedFromHome,
                    fromWhere: "Home",
                  );
                case '/reviewslist':
                  return ReviewsPage(
                    title: movieSelectedFromHome.title,
                  );
                case '/insertreviewfrommovie':
                  return InsertReview(
                    title: movieSelectedFromHome.title,
                  );
                case '/insertreviewfromreviews':
                  return InsertReview(
                    title: "Reviews",
                  );
              }
            } else if (widget.destination.title == "Search") {
              switch (settings.name) {
                case '/':
                  return Search();
                case '/movie':
                  return MovieSearch();
                case '/person':
                  return PersonSearch();
                case '/filmography':
                  return FilmographyGridView(
                    personName: personSelectedFromSearch.name,
                    fromWhere: "Search",
                  );
                case '/moviedetails':
                  return MovieDetails(
                    movieSelected: movieSelectedFromSearch,
                    fromWhere: "Search",
                  );
                case '/reviewslist':
                  return ReviewsPage(
                    title: movieSelectedFromSearch.title,
                  );
                case '/insertreviewfrommovie':
                  return InsertReview(
                    title: movieSelectedFromSearch.title,
                  );
                case '/insertreviewfromreviews':
                  return InsertReview(
                    title: "Reviews",
                  );
              }
            }
          },
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  List<GlobalKey> _destinationKeys;
  List<GlobalKey<NavigatorState>> _navigatorKeys;
  List<AnimationController> _faders;
  AnimationController _hide;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _faders =
        allDestinations.map<AnimationController>((Destination destination) {
      return AnimationController(
          vsync: this, duration: Duration(milliseconds: 200));
    }).toList();
    _faders[_currentIndex].value = 1.0;
    _destinationKeys = List<GlobalKey>.generate(
        allDestinations.length, (int index) => GlobalKey()).toList();
    _navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
        allDestinations.length, (int index) => GlobalKey()).toList();
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    _hide.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final NavigatorState navigator =
            _navigatorKeys[_currentIndex].currentState;
        if (!navigator.canPop()) return true;
        navigator.pop();
        return false;
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: Scaffold(
          body: SafeArea(
            top: false,
            child: Stack(
              fit: StackFit.expand,
              children: allDestinations.map((Destination destination) {
                final Widget view = FadeTransition(
                  opacity: _faders[destination.index]
                      .drive(CurveTween(curve: Curves.fastOutSlowIn)),
                  child: KeyedSubtree(
                    key: _destinationKeys[destination.index],
                    child: DestinationView(
                      destination: destination,
                      navigatorKey: _navigatorKeys[destination.index],
                      onNavigation: () {
                        _hide.forward();
                      },
                    ),
                  ),
                );
                if (destination.index == _currentIndex) {
                  _faders[destination.index].forward();
                  return view;
                } else {
                  _faders[destination.index].reverse();
                  if (_faders[destination.index].isAnimating) {
                    return IgnorePointer(child: view);
                  }
                  return Offstage(child: view);
                }
              }).toList(),
            ),
          ),
          bottomNavigationBar: ClipRect(
            child: SizeTransition(
              sizeFactor: _hide,
              axisAlignment: -1.0,
              child: BottomNavigationBar(
                backgroundColor: kPrimaryColor,
                selectedItemColor: Colors.white,
                unselectedItemColor: navBarColor,
                currentIndex: _currentIndex,
                onTap: (int index) {
                  setState(() {
                    if (_currentIndex != index) {
                      _currentIndex = index;
                    } else {
                      _navigatorKeys[index]
                          .currentState
                          .popUntil((route) => route.isFirst);
                    }
                  });
                },
                items: allDestinations.map((Destination destination) {
                  return BottomNavigationBarItem(
                      icon: Icon(destination.icon),
                      backgroundColor: destination.color,
                      title: Text(destination.title));
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
