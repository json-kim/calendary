import 'package:dart_date/dart_date.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todaily/provider/date_provider.dart';
import 'package:flutter_todaily/provider/selected_date_provider.dart';

class DateAppBarTitle extends ConsumerWidget {
  const DateAppBarTitle({super.key});

  /// 날짜 선택
  Future<void> selectDate(BuildContext context, WidgetRef ref) async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: ref.read(selectedDateProvider),
        firstDate: ref.read(firstDateProvider),
        lastDate: ref.read(lastDateProvider));

    if (selectedDate == null) return;

    ref.watch(selectedDateProvider.notifier).state = selectedDate;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
        onTap: () => selectDate(context, ref),
        child: Text(ref.watch(selectedDateProvider).format('y.M.d')));
  }
}
