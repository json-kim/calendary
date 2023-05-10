import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/provider/date_of_month_provider.dart';

class MonthDateColumn extends ConsumerWidget {
  const MonthDateColumn({required this.month, super.key});

  final int month;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dates = ref.watch(dateOfMonthProvider(month));

    return Column(
        children: List.generate(
      dates,
      (index) => AspectRatio(
        aspectRatio: 1,
        child: Container(
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(border: Border.all()),
        ),
      ),
    ));
  }
}
