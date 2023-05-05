import 'package:flutter/material.dart';

class AppTheme {
  final bool darkThemeStatus;
  AppTheme({required this.darkThemeStatus});
  Color get backgroundColor =>
      darkThemeStatus ? Colors.black87 : Colors.white;
  Color get appBarColor =>
      darkThemeStatus ? Colors.black87 : Colors.white;
  Color get textColor =>
      darkThemeStatus ? Colors.white : Colors.black87;
  Color get iconColor =>
      darkThemeStatus ? Colors.white : Colors.black87;
}
