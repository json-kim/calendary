import 'package:dart_date/dart_date.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/provider/year_provider.dart';

/// 선택된 연도의 달에 해당하는 날짜 프로바이더
final dateOfMonthProvider = Provider.family<int, int>((ref, int month) {
  final year = ref.watch(yearProvider);

  final date = DateTime(year, month);

  return date.getDaysInMonth;
}, name: 'DateOfMonthProvider');
