import 'package:ciak_time/Screens/Search/components/cards_widget.dart';
import 'package:ciak_time/models/movie.dart';
import 'package:flutter/material.dart';
import 'models/person.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
Color navBarColor = Colors.deepPurpleAccent[100];

Color dividerColor = Colors.amber;

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

Color colorRate = Colors.black;
Color colorMostAdded = Colors.black;
Color colorMostRecent = Colors.black;
Color colorDrama = Colors.black;
Color colorComedy = Colors.black;
Color colorAction = Colors.black;
Color colorCrime = Colors.black;
Color colorFantasy = Colors.black;
Color colorThriller = Colors.black;
Color colorFamily = Colors.black;
Color colorAnime = Colors.black;
Color colorHorror = Colors.black;

Color applyColor = kPrimaryLightColor;
Color applyTextColor = Colors.grey;

Movie movieSelectedFromHome;
Movie movieSelectedFromSearch;
Movie movieSelectedFromUser;

Person personSelectedFromHome;
Person personSelectedFromSearch;
Person personSelectedFromUser;

Movie personMovieSelectedFromHome;
Movie personMovieSelectedFromSearch;
Movie personMovieSelectedFromUser;

List<Movie> selectedPersonMoviesFromHome = [];
List<Movie> selectedPersonMoviesFromSearch = [];
List<Movie> selectedPersonMoviesFromUser = [];

List<Movie> watchList = [];
List<Movie> alreadyWatchedList = [];
List<Movie> favouriteList = [];

String watchListTitle = "Add to watchlist";
String alreadyWatchedListTitle = "Add to already watched list";
String favouriteListTitle = "Add to favourite list";

double newRating;

Widget content;

bool shouldUpdate;

List reviewsData = [
  {
    'name': 'Maria',
    'pic':
        'https://github.com/pixelastic/fakeusers/blob/master/pictures/women/60.jpg?raw=true',
    'message':
        'What a surprise! To be really honest, I had very low positive thoughts about this movie.',
    'rate': 4.5,
    'likes': 5,
    'comments': ''
  },
  {
    'name': 'Geremia',
    'pic':
        'https://github.com/pixelastic/fakeusers/blob/master/pictures/algolia/men/jeremy.png?raw=true',
    'message':
        'Good movie. Some reviews say the story is predictable but I disagree.',
    'rate': 4.0,
    'likes': 8,
  },
  {
    'name': 'Stella',
    'pic':
        'https://github.com/pixelastic/fakeusers/blob/master/pictures/women/26.jpg?raw=true',
    'message': 'Really good movie. I loved it. The music is awesome.',
    'rate': 5.0,
    'likes': 15,
  },
  {
    'name': 'Francesco',
    'pic':
        'https://github.com/pixelastic/fakeusers/blob/master/pictures/algolia/men/lucas.png?raw=true',
    'message': 'This movie is boring and pointless.',
    'rate': 2.0,
    'likes': 2,
  },
];

List googleAccountsData = [
  {
    'name': 'Vittoria',
    'mail': 'vittoria@gmail.com',
    'pic': 'assets/images/vittoria.png',
    'dividercolor': Colors.grey,
  },
  {
    'name': 'Vittoria',
    'mail': 'vittoria.students@gmail.com',
    'pic': 'assets/icons/b89299de9fb6571ca00a92eac32c9a1b.jpg',
    'dividercolor': Colors.grey,
  },
];

/*List genresIds = [
  {
    '28': 'Action',
    '16': 'Animation',
    '35': 'Comedy',
    '80': 'Crime',
    '18': 'Drama',
    '10751': 'Family',
    '14': 'Fantasy',
    '27': 'Horror',
    '53': 'Thriller',
  }
];*/
List genresIds = [
  {
    'Action': 28,
    'Animation': 16,
    'Comedy': 35,
    'Crime': 80,
    'Drama': 18,
    'Family': 10751,
    'Fantasy': 14,
    'Horror': 27,
    'Thriller': 53,
  }
];

int setLenght(List list) {
  int len;
  if (list.length <= 4) {
    len = list.length;
  } else {
    len = 4;
  }
  return len;
}

//TODO IMPLEMENTARE FILTRI RICERCA
//TODO CONFERMARE COMMENTO INSERITO?
//TODO FAR TORNARE INDIETRO TRAMITE GESTURE SOLO SU HOME, SEARCH E USER
//TODO TEMA NERO
//TODO PUNTINI SU LESS DELLA BIOGRAPHY DEGLI ATTORI
//TODO CARICARE NUOVI RISULTATI A FINE LIST VIEW DELLA SEARCH (USARE LAZY LIST VIEW CON LO SCROLL CONTROLLER)
