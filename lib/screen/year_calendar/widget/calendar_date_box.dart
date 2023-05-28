import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todaily/model/calendar_model.dart';
import 'package:flutter_todaily/provider/date_provider.dart';
import 'package:flutter_todaily/provider/mood_color_provider.dart';
import 'package:flutter_todaily/screen/edit_calendar/edit_calendar_screen.dart';
import 'package:flutter_todaily/util/color_utils.dart';

class CalendarDateBox extends ConsumerWidget {
  const CalendarDateBox({required this.date, this.calendar, super.key});

  final CalendarModel? calendar;
  final DateTime date;

  Color getBoxColor(WidgetRef ref) {
    final mood = calendar?.mood;

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => goToEditScreen(context, ref),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            border: Border.all(),
            color: getBoxColor(ref),
          ),
        ),
      ),
    );
  }
}
