import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/provider/calendar_list_provider.dart';
import 'package:flutter_todaily/provider/date_of_month_provider.dart';
import 'package:flutter_todaily/provider/year_provider.dart';
import 'package:flutter_todaily/screen/year_calendar/widget/calendar_date_box.dart';

class MonthDateColumn extends ConsumerWidget {
  const MonthDateColumn({required this.month, super.key});

  final int month;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dates = ref.watch(dateOfMonthProvider(month));

    return Column(
        children: List.generate(
      dates,
      (index) => CalendarDateBox(
          date: DateTime(ref.watch(yearProvider), month, index + 1),
          calendar: ref.watch(calendarListProvider.select((data) => data.value
              ?.firstWhereOrNull(
                  (e) => e.date.month == month && e.date.day == index + 1)))),
    ));
  }
}
