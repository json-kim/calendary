import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/util/const_value.dart';

/// 메인 캘린더 화면 (연도 선택)
/// 선택된 연도 상태 관리
class YearNotifier extends Notifier<int> {
  @override
  int build() {
    return DateTime.now().year;
  }

  /// 이전 연도 선택
  void beforeYear() {
    if (state < 2022) {
      return;
    }

    state--;
  }

  /// 다음 연도 선택
  void nextYear() {
    final maxYear = DateTime.now().year + maxYearTerm;

    if (state >= maxYear) {
      return;
    }

    state++;
  }
}

/// 선택된 연도 프로바이더
final yearProvider = NotifierProvider<YearNotifier, int>(() {
  return YearNotifier();
}, name: 'YearProvider');
