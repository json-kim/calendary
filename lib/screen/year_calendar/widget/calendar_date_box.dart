import 'package:collection/collection.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todaily/model/enum/calendar_mood_enum.dart';
import 'package:flutter_todaily/provider/calendar_list_provider.dart';
import 'package:flutter_todaily/provider/date_provider.dart';
import 'package:flutter_todaily/provider/mood_color_provider.dart';
import 'package:flutter_todaily/screen/edit_calendar/edit_calendar_screen.dart';
import 'package:flutter_todaily/util/color_utils.dart';

class CalendarDateBox extends ConsumerWidget {
  const CalendarDateBox({required this.date, super.key});

  final DateTime date;

  Color getBoxColor(WidgetRef ref, CalendarMood? mood) {
    if (mood == null) {
      return ColorUtils.pureWhite;
    }

    return ref.watch(moodColorThemeProvider).colorWithMood(mood);
  }

  /// 캘린더 작성 화면 이동
  void goToEditScreen(BuildContext context, WidgetRef ref) {
    ref.watch(selectedDateProvider.notifier).state = date;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const EditCalendarScreen(),
    ));
  }

  Border get border {
    final isToday = date.isSameDay(DateTime.now());

    return isToday
        ? Border.all(color: ColorUtils.pureRed, width: 2)
        : Border.all(color: ColorUtils.pureBlack);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calendar = ref.watch(calendarListProvider.select((data) => data.value
        ?.firstWhereOrNull(
            (e) => e.date.month == date.month && e.date.day == date.day)));

    return GestureDetector(
      onTap: () => goToEditScreen(context, ref),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            border: border,
            color: getBoxColor(ref, calendar?.mood),
          ),
        ),
      ),
    );
  }
}
