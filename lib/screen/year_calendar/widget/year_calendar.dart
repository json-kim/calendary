import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todaily/provider/calendar_list_provider.dart';
import 'package:flutter_todaily/screen/year_calendar/widget/dates_grid.dart';

class YearCalendar extends ConsumerWidget {
  const YearCalendar({super.key});

  Future<void> refresh(WidgetRef ref) async {
    ref.refresh(calendarListProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 16),
      child: RefreshIndicator(
        onRefresh: () => refresh(ref),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              /// 날짜 그리드
              DatesGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
