import 'package:ciak_time/models/movie.dart';
import 'package:ciak_time/models/movie_cast_model.dart';
import 'package:ciak_time/models/movie_model.dart';
import 'package:ciak_time/models/person_details_model.dart';
import 'package:ciak_time/models/person_model.dart';
import 'package:ciak_time/models/person_movies_model.dart';
import 'package:flutter/material.dart';

import 'models/person.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
Color navBarColor = Colors.deepPurpleAccent[100];

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

//MovieResults movieSelectedFromHome;
Movie movieSelectedFromHome;
Movie movieSelectedFromSearch;
Movie movieSelectedFromUser;

/*PersonDetailsModel personSelectedFromHome;
PersonDetailsModel personSelectedFromSearch; //TODO
PersonDetailsModel personSelectedFromUser;*/ //TODO

/*String personIdSelectedFromHome;
String personIdSelectedFromSearch;
String personIdSelectedFromUser;*/

Person personSelectedFromHome; //id, name
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

int setLenght(List list) {
  int len;
  if (list.length <= 4) {
    len = list.length;
  } else {
    len = 4;
  }
  return len;
}

//TODO LINKARE GOOGLE E FB
//TODO CANCELLARE RISULTATI DI RICERCA QUANDO SI PREME LA X PER CANCELLARE LA QUERY!!!
//TODO RECENSIONI E COMMENTI
//TODO FAR TORNARE INDIETRO TRAMITE GESTURE SOLO SU HOME, SEARCH E USER
//TODO DIRE ALL'UTENTE CHE DEVE ACCENDERE INTERNET SE NON E' ACCESO
//TODO FARE I BOTTONI DEI GENERI NEI FILTRI TUTTI UGUALI
//TODO CARICARE NUOVI RISULTATI A FINE LIST VIEW DELLA SEARCH (USARE LAZY LIST VIEW CON LO SCROLL CONTROLLER)




