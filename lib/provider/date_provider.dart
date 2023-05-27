import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/util/const_value.dart';

/// 선택 가능한 첫 날짜 프로바이더
final firstDateProvider = Provider<DateTime>((ref) {
  return DateTime(firstYear);
}, name: 'FirstDateProvider');

/// 선택 가능한 마지막 날짜 프로바이더
final lastDateProvider = Provider<DateTime>((ref) {
  final maxYear = DateTime.now().year + maxYearTerm;

  return DateTime(maxYear, 12, 31);
}, name: 'LastDateProvider');
