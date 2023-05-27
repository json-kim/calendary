import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/model/edit_calendar_model.dart';
import 'package:flutter_todaily/model/enum/calendar_mood_enum.dart';
import 'package:flutter_todaily/provider/date_provider.dart';
import 'package:flutter_todaily/provider/selected_calendar_provider.dart';

class EditCalendarNotifier extends AutoDisposeNotifier<EditCalendarModel> {
  @override
  EditCalendarModel build() {
    final selectedCalendar = ref.watch(selectedCalendarProvider).value;

    return EditCalendarModel(
      title: selectedCalendar?.title ?? '',
      content: selectedCalendar?.content ?? '',
      date: selectedCalendar?.date ?? ref.watch(selectedDateProvider),
      mood: selectedCalendar?.mood ?? CalendarMood.veryGood,
    );
  }

  /// 캘린더 무드 변경
  void changeMood(CalendarMood mood) {
    state = state.copyWith(mood: mood);
  }

  /// 캘린더 타이틀 변경
  void chanegeTitle(String title) {
    state = state.copyWith(title: title);
  }

  /// 캘린더 내용 변경
  void changeContent(String content) {
    state = state.copyWith(content: content);
  }

  /// 캘린더 저장
  Future<bool> saveCalendar() async {
    return true;
  }

  /// 캘린더 유효성 체크
  bool checkValidate() {
    final title = state.title;
    return title.length > 1;
  }
}

final editCalendarProvider =
    NotifierProvider.autoDispose<EditCalendarNotifier, EditCalendarModel>(
        () => EditCalendarNotifier(),
        name: 'EditCalendarProvider');
