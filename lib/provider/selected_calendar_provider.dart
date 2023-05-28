import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/model/calendar_model.dart';
import 'package:flutter_todaily/provider/date_provider.dart';
import 'package:flutter_todaily/provider/repository/calendar_repository_provider.dart';

final selectedCalendarProvider = FutureProvider<CalendarModel?>((ref) async {
  final selectedDate = ref.watch(selectedDateProvider);
  final repository = ref.watch(calenarRepositoryProvider);

  // 로컬 DB에 저장된 캘린더 불러오기
  final selectedCalendar = await repository.selectCalendarWithDay(selectedDate);

  return selectedCalendar;
}, name: 'SelectedCalendarProvider');
