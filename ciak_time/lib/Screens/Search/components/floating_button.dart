import 'package:ciak_time/components/out_apply_button_filter.dart';
import 'package:ciak_time/components/out_back_button_filter.dart';
import 'package:ciak_time/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FloatingActionButton.extended(
        label: Text(
          'Filters',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.02,
            fontFamily: 'Quicksand-Medium',
          ),
        ),
        icon: SvgPicture.asset(
          "assets/icons/setting-lines.svg",
          width: size.width * 0.06,
        ),
        backgroundColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return new AlertDialog(
                  content: StatefulBuilder(
                    builder: (context, setState) {
                      return Container(
                        height: size.height * 0.63,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: size.width * 0.75,
                              child: Text(
                                "Order By:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.03,
                                    fontFamily: 'Quicksand-Medium',
                                    color: kPrimaryColor),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Row(
                              children: [
                                FilterChip(
                                  label: Text(
                                    "Rate",
                                  ),
                                  labelStyle: TextStyle(color: colorRate),
                                  checkmarkColor: colorRate,
                                  backgroundColor: Colors.transparent,
                                  selectedColor: kPrimaryColor,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: kPrimaryColor,
                                          width: size.width * 0.0055)),
                                  selected: selected_rate,
                                  onSelected: (bool value) {
                                    setState(() {
                                      selected_rate = !selected_rate;
                                      selected_most_added = false;
                                      selected_most_recent = false;

                                      if (!selected_rate) {
                                        colorRate = Colors.black;
                                      } else {
                                        colorRate = Colors.white;
                                        colorMostAdded = Colors.black;
                                        colorMostRecent = Colors.black;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                FilterChip(
                                  label: Text(
                                    "Most added",
                                  ),
                                  labelStyle: TextStyle(color: colorMostAdded),
                                  checkmarkColor: colorMostAdded,
                                  backgroundColor: Colors.transparent,
                                  selectedColor: kPrimaryColor,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: kPrimaryColor,
                                          width: size.width * 0.0055)),
                                  selected: selected_most_added,
                                  onSelected: (bool value) {
                                    setState(() {
                                      selected_most_added = !selected_most_added;
                                      selected_rate = false;
                                      selected_most_recent = false;

                                      if (!selected_most_added) {
                                        colorMostAdded = Colors.black;
                                      } else {
                                        colorMostAdded = Colors.white;
                                        colorRate = Colors.black;
                                        colorMostRecent = Colors.black;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FilterChip(
                                  label: Text(
                                    "Most recent",
                                  ),
                                  labelStyle: TextStyle(color: colorMostRecent),
                                  checkmarkColor: colorMostRecent,
                                  backgroundColor: Colors.transparent,
                                  selectedColor: kPrimaryColor,
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: kPrimaryColor,
                                          width: size.width * 0.0055)),
                                  selected: selected_most_recent,
                                  onSelected: (bool value) {
                                    setState(() {
                                      selected_most_recent =
                                          !selected_most_recent;
                                      selected_rate = false;
                                      selected_most_added = false;

                                      if (!selected_most_recent) {
                                        colorMostRecent = Colors.black;
                                      } else {
                                        colorMostRecent = Colors.white;
                                        colorMostAdded = Colors.black;
                                        colorRate = Colors.black;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Container(
                              //color: Colors.black,
                              width: size.width * 0.75,
                              child: Text(
                                "Genres:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.03,
                                    fontFamily: 'Quicksand-Medium',
                                    color: kPrimaryColor),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      FilterChip(
                                        label: Text(
                                          "Drama",
                                        ),
                                        labelStyle: TextStyle(color: colorDrama),
                                        checkmarkColor: colorDrama,
                                        backgroundColor: Colors.transparent,
                                        selectedColor: kPrimaryColor,
                                        shape: StadiumBorder(
                                            side: BorderSide(
                                                color: kPrimaryColor,
                                                width: size.width * 0.0055)),
                                        selected: drama,
                                        onSelected: (bool value) {
                                          setState(() {
                                            drama = !drama;

                                            if (!drama) {
                                              colorDrama = Colors.black;
                                            } else {
                                              colorDrama = Colors.white;
                                            }
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.05,
                                      ),
                                      FilterChip(
                                        label: Text(
                                          "Comedy",
                                        ),
                                        labelStyle: TextStyle(color: colorComedy),
                                        checkmarkColor: colorComedy,
                                        backgroundColor: Colors.transparent,
                                        selectedColor: kPrimaryColor,
                                        shape: StadiumBorder(
                                            side: BorderSide(
                                                color: kPrimaryColor,
                                                width: size.width * 0.0055)),
                                        selected: comedy,
                                        onSelected: (bool value) {
                                          setState(() {
                                            comedy = !comedy;

                                            if (!comedy) {
                                              colorComedy = Colors.black;
                                            } else {
                                              colorComedy = Colors.white;
                                            }
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.05,
                                      ),
                                      FilterChip(
                                        label: Text(
                                          "Action",
                                        ),
                                        labelStyle: TextStyle(color: colorAction),
                                        checkmarkColor: colorAction,
                                        backgroundColor: Colors.transparent,
                                        selectedColor: kPrimaryColor,
                                        shape: StadiumBorder(
                                            side: BorderSide(
                                                color: kPrimaryColor,
                                                width: size.width * 0.0055)),
                                        selected: action,
                                        onSelected: (bool value) {
                                          setState(() {
                                            action = !action;

                                            if (!action) {
                                              colorAction = Colors.black;
                                            } else {
                                              colorAction = Colors.white;
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      FilterChip(
                                        label: Text(
                                          "Crime",
                                        ),
                                        labelStyle: TextStyle(color: colorCrime),
                                        checkmarkColor: colorCrime,
                                        backgroundColor: Colors.transparent,
                                        selectedColor: kPrimaryColor,
                                        shape: StadiumBorder(
                                            side: BorderSide(
                                                color: kPrimaryColor,
                                                width: size.width * 0.0055)),
                                        selected: crime,
                                        onSelected: (bool value) {
                                          setState(() {
                                            crime = !crime;

                                            if (!crime) {
                                              colorCrime = Colors.black;
                                            } else {
                                              colorCrime = Colors.white;
                                            }
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.05,
                                      ),
                                      FilterChip(
                                        label: Text(
                                          "Fantasy",
                                        ),
                                        labelStyle:
                                            TextStyle(color: colorFantasy),
                                        checkmarkColor: colorFantasy,
                                        backgroundColor: Colors.transparent,
                                        selectedColor: kPrimaryColor,
                                        shape: StadiumBorder(
                                            side: BorderSide(
                                                color: kPrimaryColor,
                                                width: size.width * 0.0055)),
                                        selected: fantasy,
                                        onSelected: (bool value) {
                                          setState(() {
                                            fantasy = !fantasy;

                                            if (!fantasy) {
                                              colorFantasy = Colors.black;
                                            } else {
                                              colorFantasy = Colors.white;
                                            }
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.05,
                                      ),
                                      FilterChip(
                                        label: Text(
                                          "Thriller",
                                        ),
                                        labelStyle:
                                            TextStyle(color: colorThriller),
                                        checkmarkColor: colorThriller,
                                        backgroundColor: Colors.transparent,
                                        selectedColor: kPrimaryColor,
                                        shape: StadiumBorder(
                                            side: BorderSide(
                                                color: kPrimaryColor,
                                                width: size.width * 0.0055)),
                                        selected: thriller,
                                        onSelected: (bool value) {
                                          setState(() {
                                            thriller = !thriller;

                                            if (!thriller) {
                                              colorThriller = Colors.black;
                                            } else {
                                              colorThriller = Colors.white;
                                            }
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.05,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      FilterChip(
                                        label: Text(
                                          "Family",
                                        ),
                                        labelStyle: TextStyle(color: colorFamily),
                                        checkmarkColor: colorFamily,
                                        backgroundColor: Colors.transparent,
                                        selectedColor: kPrimaryColor,
                                        shape: StadiumBorder(
                                            side: BorderSide(
                                                color: kPrimaryColor,
                                                width: size.width * 0.0055)),
                                        selected: family,
                                        onSelected: (bool value) {
                                          setState(() {
                                            family = !family;

                                            if (!family) {
                                              colorFamily = Colors.black;
                                            } else {
                                              colorFamily = Colors.white;
                                            }
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.05,
                                      ),
                                      FilterChip(
                                        label: Text(
                                          "Anime",
                                        ),
                                        labelStyle: TextStyle(color: colorAnime),
                                        checkmarkColor: colorAnime,
                                        backgroundColor: Colors.transparent,
                                        selectedColor: kPrimaryColor,
                                        shape: StadiumBorder(
                                            side: BorderSide(
                                                color: kPrimaryColor,
                                                width: size.width * 0.0055)),
                                        selected: anime,
                                        onSelected: (bool value) {
                                          setState(() {
                                            anime = !anime;

                                            if (!anime) {
                                              colorAnime = Colors.black;
                                            } else {
                                              colorAnime = Colors.white;
                                            }
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: size.width * 0.05,
                                      ),
                                      FilterChip(
                                        label: Text(
                                          "Horror",
                                        ),
                                        labelStyle: TextStyle(color: colorHorror),
                                        checkmarkColor: colorHorror,
                                        backgroundColor: Colors.transparent,
                                        selectedColor: kPrimaryColor,
                                        shape: StadiumBorder(
                                            side: BorderSide(
                                                color: kPrimaryColor,
                                                width: size.width * 0.0055)),
                                        selected: horror,
                                        onSelected: (bool value) {
                                          setState(() {
                                            horror = !horror;

                                            if (!horror) {
                                              colorHorror = Colors.black;
                                            } else {
                                              colorHorror = Colors.white;
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Include added movies",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.02,
                                    fontFamily: 'Quicksand-Medium',
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                CupertinoSwitch(
                                  value: add_movie,
                                  onChanged: (bool value) {
                                    setState(() {
                                      add_movie = !add_movie;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutBackButtonFilter(
                                  size: size,
                                ),
                                SizedBox(width: size.width * 0.05),
                                OutApplyButtonFilter(
                                  size: size,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              });
        },
      ),
    );
  }
}
