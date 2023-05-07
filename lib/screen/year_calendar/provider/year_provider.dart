import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter_todaily/util/const_value.dart';

/// 메인 캘린더 화면 (연도 선택)
/// 선택된 연도 상태 관리
class YearNotifier extends Notifier<DateTime> {
  @override
  DateTime build() {
    return DateTime.now();
  }

  /// 이전 연도 선택
  void beforeYear() {
    if (state.year < 2022) {
      return;
    }

    state = state.subYears(1);
  }

  /// 다음 연도 선택
  void nextYear() {
    final maxYear = DateTime.now().year + maxYearTerm;

    if (state.year >= maxYear) {
      return;
    }

    state = state.addYears(1);
  }
}

final yearProvider = NotifierProvider<YearNotifier, DateTime>(() {
  return YearNotifier();
});
