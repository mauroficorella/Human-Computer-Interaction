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
bool noPressed = false;

CircleAvatar profilePicture;

String picturePath = "https://shop.krystmedia.at/wp-content/uploads/2020/04/avatar-1.jpg";

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

bool isMovieChecked = true;
bool isPersonChecked = false;

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
String tabSelected = "Movie";

Widget content = CardsWidget();

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

String newPassword = '';
String newConfirmPassword = '';
String oldPassword = '';

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

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return Colors.red;
}
