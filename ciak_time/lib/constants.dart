import 'package:flutter/material.dart';

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

Color floatingBackground = kPrimaryColor;
Color floatingBorder = kPrimaryColor;

//TODO DISATTIVARE BOTTONE APPLICA SE NON SI SELEZIONANO I FILTRI
//TODO LINKARE GOOGLE E FB
//TODO LEVARE IL BACK TRAMITE GESTURE DOVE NON E' PREVISTO
//TODO LINKARE CARD A PAGINA ATTORI E FILM
//TODO FARE I BOTTONI DEI GENERI TUTTI DI LUNGHEZZA UGUALE
//TODO I FILTRI DEI GENERI QUANDO CLICCATI SE SI ESCE RIMANGONO SCRITTI IN NERO INVECE CHE BIANCHI
