import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todaily/model/enum/calendar_mood_enum.dart';
import 'package:flutter_todaily/util/mood_color_theme.dart';

void main() {
  group('[Util] MoodColorTheme 테스트 :', () {
    test('colorWithMood() 등록된 컬러테마에 따라 무드별 컬러값을 가져옵니다.', () {
      final colors = List.generate(
          5,
          (index) =>
              Colors.primaries[Random().nextInt(Colors.primaries.length)]);
      final randomColorTheme = MoodColorTheme(
          firstColor: colors[0],
          secondColor: colors[1],
          thirdColor: colors[2],
          fourthColor: colors[3],
          fifthColor: colors[4]);

      expect(randomColorTheme.colorWithMood(CalendarMood.veryGood), colors[0]);
      expect(randomColorTheme.colorWithMood(CalendarMood.good), colors[1]);
      expect(randomColorTheme.colorWithMood(CalendarMood.normal), colors[2]);
      expect(randomColorTheme.colorWithMood(CalendarMood.bad), colors[3]);
      expect(randomColorTheme.colorWithMood(CalendarMood.veryBad), colors[4]);
    });
  });
}
