import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const.dart';

final _baseLight = ThemeData.light();
final _baseDark = ThemeData.dark();

final lightTheme = _baseLight.copyWith(
  primaryColor: Styles.primaryColor,
  textTheme: _baseLight.textTheme.copyWith(
    headline1: _baseLight.textTheme.headline1!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    headline2: _baseLight.textTheme.headline2!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    headline3: _baseLight.textTheme.headline3!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    headline4: _baseLight.textTheme.headline4!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    headline5: _baseLight.textTheme.headline5!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    headline6: _baseLight.textTheme.headline6!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    bodyText1: _baseLight.textTheme.bodyText1!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    bodyText2: _baseLight.textTheme.bodyText2!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    subtitle1: _baseLight.textTheme.bodyText1!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    subtitle2: _baseLight.textTheme.bodyText2!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    button: _baseLight.textTheme.button!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    caption: _baseLight.textTheme.caption!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    overline: _baseLight.textTheme.overline!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
  ),
);

final darkTheme = _baseDark.copyWith(
  primaryColor: Styles.primaryColor,
  textTheme: _baseLight.textTheme.copyWith(
    headline1: _baseLight.textTheme.headline1!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    headline2: _baseLight.textTheme.headline2!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    headline3: _baseLight.textTheme.headline3!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    headline4: _baseLight.textTheme.headline4!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    headline5: _baseLight.textTheme.headline5!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    headline6: _baseLight.textTheme.headline6!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    bodyText1: _baseLight.textTheme.bodyText1!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    bodyText2: _baseLight.textTheme.bodyText2!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    subtitle1: _baseLight.textTheme.bodyText1!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    subtitle2: _baseLight.textTheme.bodyText2!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    button: _baseLight.textTheme.button!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    caption: _baseLight.textTheme.caption!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
    overline: _baseLight.textTheme.overline!.copyWith(
      fontFamily: GoogleFonts.mulish().fontFamily,
    ),
  ),
);


