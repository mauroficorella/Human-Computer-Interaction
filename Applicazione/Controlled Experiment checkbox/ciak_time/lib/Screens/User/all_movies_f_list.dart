import 'package:ciak_time/components/movie_card.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/material.dart';

class AllMoviesInFList extends StatefulWidget {
  const AllMoviesInFList({Key key}) : super(key: key);

  @override
  _AllMoviesInFListState createState() => _AllMoviesInFListState();
}

class _AllMoviesInFListState extends State<AllMoviesInFList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite List"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.amber,
          ),
          label: Text(
            "User",
            style:
                TextStyle(color: Colors.amber, fontFamily: 'Quicksand-Regular'),
          ),
        ),
        leadingWidth: size.width * 0.2,
        
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: (9 / 13)),
          itemCount: favouriteList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: MovieCard(
                  imageUrl:
                      'https://image.tmdb.org/t/p/original${favouriteList[index].posterPath}',
                  movieTitle: favouriteList[index].title),
              onTap: () {
                movieSelectedFromUser = favouriteList[index];
                Navigator.pushNamed(context, '/movie',
                    arguments: ScreenArguments("Favourite"));
              },
            );
          }),
    );
  }
}
