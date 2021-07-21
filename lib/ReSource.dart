import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final myFontWhite = GoogleFonts.cuteFont(
  textStyle: TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 35,
      decoration: TextDecoration.none),
);

var myX = GoogleFonts.damion(
  textStyle: TextStyle(color: colorPlayerX, letterSpacing: 3, fontSize: 40),
);

var myO = GoogleFonts.damion(
  textStyle: TextStyle(
    color: colorPlayerO,
    letterSpacing: 3,
    fontSize: 40,
  ),
);

var myBackground = Colors.grey[900];
var colorPlayerX = Colors.green;
var colorPlayerO = Colors.blue;
var neutral = Colors.grey;
