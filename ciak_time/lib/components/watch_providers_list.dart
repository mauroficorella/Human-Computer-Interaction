import 'package:ciak_time/blocs/watch_providers_bloc.dart';

import 'package:ciak_time/models/movie.dart';

import 'package:ciak_time/models/watch_providers_model.dart';
import 'package:flutter/material.dart';

class WatchProvidersList extends StatelessWidget {
  final Movie movieSelected;

  const WatchProvidersList({Key key, @required this.movieSelected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bloc = WatchProvidersBloc(movieSelected.id.toString());
    bloc.fetchWatchProvidersResults();
    return StreamBuilder(
      stream: bloc.watchProviders,
      builder: (context, AsyncSnapshot<WatchProvidersModel> snapshot) {
        if (snapshot.hasData) {
          return buildList(snapshot, size);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        return Center(
            child: CircularProgressIndicator(
          
          color: Colors.amber,
        ));
      },
    );
  }

  Widget buildList(AsyncSnapshot<WatchProvidersModel> snapshot, size) {
    if (snapshot.data.results.iT != null) {
      return Container(
        height: size.width * 0.1,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.results.iT.providers.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Container(
                    
                    width: size.width * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/original${snapshot.data.results.iT.providers[index].logoPath}'),
                      ),
                      
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: size.width * 0.02),
                ],
              );
            }),
      );
    } else {
      return Text(
        "No providers available",
        style: TextStyle(
          color: Colors.grey,
          fontSize: size.height * 0.02,
          fontFamily: 'Quicksand-Regular',
        ),
      );
    }
  }
}
