import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/model/calendar_model.dart';
import 'package:flutter_todaily/provider/repository/calendar_repository_provider.dart';
import 'package:flutter_todaily/provider/year_provider.dart';

final calendarListProvider = FutureProvider<List<CalendarModel>>(
  (ref) async {
    final selectedYear = ref.watch(yearProvider);
    final repository = ref.watch(calenarRepositoryProvider);

    final result = await repository.selectCalendarListInYear(selectedYear);

    return result ?? [];
  },
);
