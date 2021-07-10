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
Color tabBarColor = Color(0xffa16ad4);

getProfileImage(username, path) {
  if (userlogged == username) {
    return AssetImage(path);
  } else {
    return NetworkImage(path);
  }
}

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
bool error = false;

CircleAvatar profilePicture;

String picturePath =
    "https://shop.krystmedia.at/wp-content/uploads/2020/04/avatar-1.jpg";

Widget home;

Pattern passwordPattern = r'(?=.*?[#?!@$%^&*-_])';
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

List<Movie> watchList = [
  Movie(
    id: 313369,
    title: "La La Land",
    overview:
        "Mia, an aspiring actress, serves lattes to movie stars in between auditions and Sebastian, a jazz musician, scrapes by playing cocktail party gigs in dingy bars, but as success mounts they are faced with decisions that begin to fray the fragile fabric of their love affair, and the dreams they worked so hard to maintain in each other threaten to rip them apart.",
    releaseDate: "2016-11-29",
    voteAverage: 7.9,
    voteCount: 13380,
    posterPath: "/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg",
  ),
  Movie(
    id: 385128,
    title: "F9",
    overview:
        "Dominic Toretto and his crew battle the most skilled assassin and high-performance driver they've ever encountered: his forsaken brother.",
    releaseDate: "2021-05-19",
    voteAverage: 7.6,
    voteCount: 475,
    posterPath: "/qIicLxr7B7gIt5hxZxo423BJLlK.jpg",
  ),
  Movie(
    id: 337404,
    title: "Cruella",
    overview:
        "In 1970s London amidst the punk rock revolution, a young grifter named Estella is determined to make a name for herself with her designs. She befriends a pair of young thieves who appreciate her appetite for mischief, and together they are able to build a life for themselves on the London streets. One day, Estella’s flair for fashion catches the eye of the Baroness von Hellman, a fashion legend who is devastatingly chic and terrifyingly haute. But their relationship sets in motion a course of events and revelations that will cause Estella to embrace her wicked side and become the raucous, fashionable and revenge-bent Cruella.",
    releaseDate: "2021-05-26",
    voteAverage: 8.5,
    voteCount: 3854,
    posterPath: "/rTh4K5uw9HypmpGslcKd4QfHl93.jpg",
  )
];

List<Movie> alreadyWatchedList = [
  Movie(
    id: 671,
    title: "Harry Potter and the Philosopher's Stone",
    overview:
        "Harry Potter has lived under the stairs at his aunt and uncle's house his whole life. But on his 11th birthday, he learns he's a powerful wizard -- with a place waiting for him at the Hogwarts School of Witchcraft and Wizardry. As he learns to harness his newfound powers with the help of the school's kindly headmaster, Harry uncovers the truth about his parents' deaths -- and about the villain who's to blame.",
    releaseDate: "2001-11-16",
    voteAverage: 7.9,
    voteCount: 20546,
    posterPath: "/wuMc08IPKEatf9rnMNXvIDxqP4W.jpg",
  ),
  Movie(
    id: 673,
    title: "Harry Potter and the Prisoner of Azkaban",
    overview:
        "Year three at Hogwarts means new fun and challenges as Harry learns the delicate art of approaching a Hippogriff, transforming shape-shifting Boggarts into hilarity and even turning back time. But the term also brings danger: soul-sucking Dementors hover over the school, an ally of the accursed He-Who-Cannot-Be-Named lurks within the castle walls, and fearsome wizard Sirius Black escapes Azkaban. And Harry will confront them all.",
    releaseDate: "2004-05-31",
    voteAverage: 8.0,
    voteCount: 16355,
    posterPath: "/aWxwnYoe8p2d2fcxOqtvAtJ72Rw.jpg",
  ),
  Movie(
    id: 157336,
    title: "Interstellar",
    overview:
        "The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.",
    releaseDate: "2014-11-05",
    voteAverage: 8.3,
    voteCount: 26163,
    posterPath: "/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
  ),
  Movie(
    id: 299534,
    title: "Avengers: Endgame",
    overview:
        "After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos' actions and restore order to the universe once and for all, no matter what consequences may be in store.",
    releaseDate: "2019-04-24",
    voteAverage: 8.3,
    voteCount: 18501,
    posterPath: "/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
  ),
];

List<Movie> favouriteList = [
  Movie(
    id: 121,
    title: "The Lord of the Rings: The Two Towers",
    overview:
        "Frodo and Sam are trekking to Mordor to destroy the One Ring of Power while Gimli, Legolas and Aragorn search for the orc-captured Merry and Pippin. All along, nefarious wizard Saruman awaits the Fellowship members at the Orthanc Tower in Isengard.",
    releaseDate: "2002-12-18",
    voteAverage: 8.3,
    voteCount: 16681,
    posterPath: "/5VTN0pR8gcqV3EPUHHfMGnJYN9L.jpg",
  ),
  Movie(
    id: 122,
    title: "The Lord of the Rings: The Return of the King",
    overview:
        "Aragorn is revealed as the heir to the ancient kings as he, Gandalf and the other members of the broken fellowship struggle to save Gondor from Sauron's forces. Meanwhile, Frodo and Sam take the ring closer to the heart of Mordor, the dark lord's realm.",
    releaseDate: "2003-12-01",
    voteAverage: 8.5,
    voteCount: 17851,
    posterPath: "/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg",
  ),
  Movie(
    id: 9799,
    title: "The Fast and the Furious",
    overview:
        "Dominic Toretto is a Los Angeles street racer suspected of masterminding a series of big-rig hijackings. When undercover cop Brian O'Conner infiltrates Toretto's iconoclastic crew, he falls for Toretto's sister and must choose a side: the gang or the LAPD.",
    releaseDate: "2001-06-22",
    voteAverage: 6.9,
    voteCount: 7477,
    posterPath: "/gqY0ITBgT7A82poL9jv851qdnIb.jpg",
  ),
  Movie(
    id: 109445,
    title: "Frozen",
    overview:
        "Young princess Anna of Arendelle dreams about finding true love at her sister Elsa’s coronation. Fate takes her on a dangerous journey in an attempt to end the eternal winter that has fallen over the kingdom. She's accompanied by ice delivery man Kristoff, his reindeer Sven, and snowman Olaf. On an adventure where she will find out what friendship, courage, family, and true love really means.",
    releaseDate: "2013-11-20",
    voteAverage: 7.3,
    voteCount: 13304,
    posterPath: "/yald8Lsb4uCRvjIH3spzR84Kdwf.jpg",
  ),
];

String watchListTitle = "Add to watchlist";
String alreadyWatchedListTitle = "Add to already watched list";
String favouriteListTitle = "Add to favourite list";

List<int> filteredMoviesList = [];

double newRating = 0;

ImageProvider<Object> getBackgroundImage() {
  if (isFromGallery) {
    return FileImage(image);
  } else {
    return AssetImage(changeProfilePicPath());
  }
}

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
String previousUsername = '';
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

//TODO: Status bar -> diventa viola sulla pagina del film
//TODO: Comments page -> quando si pubblica il commento da errore e non cambia l'immagine
