import 'package:flutter/material.dart';
import 'package:flutter_todaily/model/enum/calendar_mood_enum.dart';

class MoodColorTheme {
  MoodColorTheme({
    required this.firstColor,
    required this.secondColor,
    required this.thirdColor,
    required this.fourthColor,
    required this.fifthColor,
  });

  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;
  final Color fourthColor;
  final Color fifthColor;

  Color colorWithMood(CalendarMood mood) {
    switch (mood) {
      case CalendarMood.veryGood:
        return firstColor;
      case CalendarMood.good:
        return secondColor;
      case CalendarMood.normal:
        return thirdColor;
      case CalendarMood.bad:
        return fourthColor;
      default:
        return fifthColor;
    }
  }
}

final defaultColorTheme = MoodColorTheme(
  firstColor: const Color(0xFFff595e),
  secondColor: const Color(0xFFffca3a),
  thirdColor: const Color(0xFF8ac926),
  fourthColor: const Color(0xFF1982c4),
  fifthColor: const Color(0xFF6a4c93),
);
