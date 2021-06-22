import 'dart:io';

import 'package:ciak_time/Screens/Search/components/cards_widget.dart';
import 'package:ciak_time/components/password_field_confirm.dart';
import 'package:ciak_time/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'models/person.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
Color navBarColor = Colors.deepPurpleAccent[100];

Color buttonModifyUserColor = kPrimaryColor;
Color buttonModifyUserTextColor = Colors.white;

Color buttonPasswordColor = kPrimaryColor;
Color buttonPasswordTextColor = Colors.white;

Color buttonRegisterColor = kPrimaryColor;
Color buttonRegisterTextColor = Colors.white;

Color saveColor = kPrimaryColor;
Color saveTextColor = Colors.white;

Color loginColor = Colors.grey[300];
Color loginTextColor = Colors.grey;

bool isUserLogged = false;

Widget home;

Pattern passwordPattern = r'(?=.*?[#?!@$%^&*-])';
Pattern emailPattern =
    r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";

Color dividerColor = Colors.amber;

TextEditingController loginPasswordController = TextEditingController();
TextEditingController loginUsernameController = TextEditingController();

bool userEnabled = false;
bool passwordEnabled = false;

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

bool isReset = false;

bool googleConnected = false;
bool facebookConnected = false;

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

List<int> filteredMoviesList = [];

double newRating = 0;

String changeProfilePicPath() {
  if (username == users[0]['username']) {
    profilePicPath = 'assets/images/vittoria.png';
  } else {
    profilePicPath = 'assets/images/default-user-image.png';
  }
  return profilePicPath;
}

String profilePicPath;
File image;
bool isFromGallery = false;

Widget content = CardsWidget();

List reviewsData = [
  {
    'name': 'Maria',
    'pic':
        'https://github.com/pixelastic/fakeusers/blob/master/pictures/women/60.jpg?raw=true',
    'message':
        'What a surprise! To be really honest, I had very low positive thoughts about this movie.',
    'rate': 4.5,
    'likes': 5,
    'comments': 8
  },
  {
    'name': 'Geremia',
    'pic':
        'https://github.com/pixelastic/fakeusers/blob/master/pictures/algolia/men/jeremy.png?raw=true',
    'message':
        'Good movie. Some reviews say the story is predictable but I disagree.',
    'rate': 4.0,
    'likes': 8,
    'comments': 4
  },
  {
    'name': 'Stella',
    'pic':
        'https://github.com/pixelastic/fakeusers/blob/master/pictures/women/26.jpg?raw=true',
    'message': 'Really good movie. I loved it. The music is awesome.',
    'rate': 5.0,
    'likes': 15,
    'comments': 3
  },
  {
    'name': 'Francesco',
    'pic':
        'https://github.com/pixelastic/fakeusers/blob/master/pictures/algolia/men/lucas.png?raw=true',
    'message': 'This movie is boring and pointless.',
    'rate': 2.0,
    'likes': 2,
    'comments': 1
  },
];

List filedata = [
  {
    'name': 'Fabio',
    'pic':
        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'message': 'I love this movie too!'
  },
  {
    'name': 'Alessandra',
    'pic':
        'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg',
    'message': 'I completely agree with you.'
  },
  {
    'name': 'George',
    'pic':
        'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70',
    'message': 'Very cool acting.'
  },
  {
    'name': 'Grace',
    'pic':
        'https://images.unsplash.com/photo-1534751516642-a1af1ef26a56?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXNpYW4lMjBwb3J0cmFpdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80',
    'message': 'I disagree, they could have done better.'
  },
  {
    'name': 'Massimiliano',
    'pic':
        'https://www.elitesingles.co.uk/wp-content/uploads/sites/59/2019/11/2b_en_articleslide_sm2-350x264.jpg',
    'message': 'Great performance of the actors!'
  },
  {
    'name': 'Jenny',
    'pic':
        'http://nadiazheng.com/wp-content/uploads/2015/12/Montreal-portrait-photography-linked-professional-headshot-profile-nadia-zheng.jpg',
    'message': 'You\'re right, this movie is perfect.'
  },
  {
    'name': 'Anna',
    'pic':
        'https://expertphotography.com/wp-content/uploads/2018/10/cool-profile-pictures-retouching-1.jpg',
    'message': 'Great story! Great movie!'
  },
  {
    'name': 'Mary',
    'pic':
        'https://expertphotography.com/wp-content/uploads/2018/10/cool-profile-pictures-aperture.jpg',
    'message': "You're completely right!"
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

List users = [
  {'username': 'Vittoria', 'password': 'hci_2021'}
];

String username = '';
String password = '';

String review;

String userlogged = 'Vittoria';
String usermodified = 'Vittoria';
String userregistered = '';
String email = '';
String passwordRegistration = '';
String passwordRegistrationConfirm = '';
RegExp regexMail = new RegExp(emailPattern);
RegExp regexPassword = new RegExp(passwordPattern);

var passwordConfirmValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
  PatternValidator(passwordPattern,
      errorText: 'Password must have at least one special character'),
  IsMatchValidator(string: passwordRegistration)
]);

bool isCommentConfirmed = false;

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

class ScreenArguments {
  final String fromWhere;

  ScreenArguments(this.fromWhere);
}

int setLenght(List list) {
  int len;
  if (list.length <= 4) {
    len = list.length;
  } else {
    len = 4;
  }
  return len;
}

