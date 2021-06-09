import 'package:ciak_time/blocs/person_details_bloc.dart';
import 'package:ciak_time/components/rating.dart';
import 'package:ciak_time/constants.dart';
import 'package:ciak_time/models/person_details_model.dart';
import 'package:flutter/material.dart';

class PersonHome extends StatefulWidget {
  @override
  _PersonHomeState createState() => _PersonHomeState();
}

class _PersonHomeState extends State<PersonHome> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        /*leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, ),
              onPressed: () => Navigator.of(context).pop(),
              
            ),
            Text("User"),
          ],
        ),*/
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.amber,
          ),
          label: Text(
            "Home",
            style:
                TextStyle(color: Colors.amber, fontFamily: 'Quicksand-Regular'),
          ),
        ),
        leadingWidth: size.width * 0.22,
        title: Text(
          personSelectedFromHome.name,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            PersonOverview(),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 2)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Filmography",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: size.height * 0.03,
                        fontFamily: 'Quicksand-Medium',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) => Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: MovieCard(
                            size: size,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class PersonOverview extends StatelessWidget {
  const PersonOverview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bloc = PersonDetailsBloc(personSelectedFromHome.id.toString());
    bloc.fetchPersonDetailsResults();

    return StreamBuilder(
      stream: bloc.personDetails,
      builder: (context, AsyncSnapshot<PersonDetailsModel> snapshot) {
        if (snapshot.hasData) {
          return buildOverview(snapshot, size);
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

  Widget buildOverview(AsyncSnapshot<PersonDetailsModel> snapshot, size) {
    String imagePath;
    if (snapshot.data.profilePath.length != 0) {
      imagePath =
          'https://image.tmdb.org/t/p/original${snapshot.data.profilePath}';
    
    } else {
      imagePath = 'https://bitslog.files.wordpress.com/2013/01/unknown-person1.gif';
    }
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  imagePath),
              radius: size.height * 0.1,
            ),
          ],
        ),
        Text(
          snapshot.data.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.035,
            fontFamily: 'Quicksand-Medium',
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Biography",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.023,
                    fontFamily: 'Quicksand-Medium',
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  snapshot.data.biography,
                  style: TextStyle(
                    fontSize: size.height * 0.02,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size.width * 0.3,
          height: size.width * 0.3,
          child: Card(
            color: Colors.amber,
            child: Center(
              child: Text('Dummy Card Text'),
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Titolo film",
              style: TextStyle(
                fontSize: size.width * 0.05,
                fontFamily: 'Quicksand-Regular',
              ),
            ),
            RatingUnclickable(
                unratedColor: Colors.grey,
                rate: 2.0) //TODO passare parametri stelle
          ],
        ),
      ],
    );
  }
}
