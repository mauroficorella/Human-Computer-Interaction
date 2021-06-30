import 'package:ciak_time/blocs/popular_person_bloc.dart';
import 'package:ciak_time/models/person_model.dart';
import 'package:flutter/material.dart';

import 'cast_card.dart';

class CastList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bloc.fetchPopularPeople();
    return StreamBuilder(
      stream: bloc.popularPeople,
      builder: (context, AsyncSnapshot<PersonModel> snapshot) {
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

  Widget buildList(AsyncSnapshot<PersonModel> snapshot, size) {
    return Container(
      height: size.height * 0.26,
     
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.results.length,
          itemBuilder: (BuildContext context, int index) {
            return CastCard(
              imageUrl:
                  'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].profilePath}',
              personName: snapshot.data.results[index].name,
            );
          }),
    );
  }
}
