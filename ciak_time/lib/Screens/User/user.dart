import 'package:ciak_time/Screens/Homescreen/homescreen.dart';
import 'package:ciak_time/Screens/Search/search.dart';
import 'package:ciak_time/Screens/User/user_settings.dart';
import 'package:ciak_time/components/card_list.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          TextButton(
            onPressed: () {
              /*Navigator.push(
                
                context,
                MaterialPageRoute(
                  builder: (context) {
                    
                    return UserSettings();
                  },
                ),
              );*/

              Navigator.pushNamed(context, '/list');
            },
            child: Row(
              children: [
                //Icon(Icons.settings, color: Colors.amber,),
                Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.amber,
                    //fontSize: h,
                  ),
                ),
              ],
            ),
          ),
          /*IconButton(
            
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return UserSettings();
                  },
                ),
              );
            },
          )*/
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/vittoria.png'),
                  radius: size.height * 0.1,
                ),
              ],
            ),
            Text(
              "Vittoria",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.05,
                fontFamily: 'Quicksand-Medium',
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CardList(
                      size: size,
                      title: "Watchlist",
                      assetName: "assets/icons/list.svg",
                      number: 3,
                      height: size.height * 0.15,
                      width: size.width * 0.035,
                    ),
                    CardList(
                      size: size,
                      title: "Already watched",
                      assetName: "assets/icons/check.svg",
                      number: 3,
                      height: size.height * 0.15,
                      width: size.width * 0.035,
                    ),
                    CardList(
                      size: size,
                      title: "Favourite",
                      assetName: "assets/icons/heart-red.svg",
                      number: 3,
                      height: size.height * 0.15,
                      width: size.width * 0.035,
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
}



class DestinationView extends StatefulWidget {
  const DestinationView({
    Key key,
    
  }) : super(key: key);
  

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return Home();
              case '/search':
                return Search();
              case '/user':
                return User();
              case '/settings':
                return UserSettings();
            }
          },
        );
      },
    );
  }
}
