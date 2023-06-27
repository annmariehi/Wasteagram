import 'package:flutter/material.dart';

class Styles {
  static const _textSize30 = 30.0;
  static const _textSize20 = 20.0;
  static const _textSize25 = 25.0;
  static const _textSize45 = 45.0;

  static const String _fontNameDefault = 'Dosis';

  static const listDate = TextStyle(
      fontFamily: _fontNameDefault,
      fontWeight: FontWeight.w500,
      fontSize: 20.0);

  static const listQuantity = TextStyle(
      fontFamily: _fontNameDefault,
      fontWeight: FontWeight.w600,
      fontSize: 20.0);

  static const entryDetailDate = TextStyle(
      fontFamily: _fontNameDefault,
      fontWeight: FontWeight.w600,
      fontSize: _textSize30);

  static const entryDetailQuantity = TextStyle(
      fontFamily: _fontNameDefault,
      fontWeight: FontWeight.w700,
      fontSize: _textSize45);

  static const entryDetailLocation = TextStyle(
      fontFamily: _fontNameDefault,
      fontWeight: FontWeight.w400,
      fontSize: _textSize20);

  static const appTitle = TextStyle(
      fontFamily: _fontNameDefault,
      fontWeight: FontWeight.w600,
      fontSize: _textSize25);

  static const formEntry = TextStyle(
      fontFamily: _fontNameDefault,
      fontWeight: FontWeight.w500,
      fontSize: _textSize30);

  static const formDate = TextStyle(
      fontFamily: _fontNameDefault,
      fontWeight: FontWeight.w500,
      fontSize: _textSize30);
}
