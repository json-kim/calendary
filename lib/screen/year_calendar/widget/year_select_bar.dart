import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/screen/year_calendar/provider/year_provider.dart';

class YearSelectBar extends ConsumerWidget {
  const YearSelectBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final year = ref.watch(yearProvider);
    final notifier = ref.watch(yearProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// 이전 연도 버튼
        IconButton(
            onPressed: notifier.beforeYear,
            icon: const Icon(Icons.arrow_back_ios)),

        /// 현재 연도
        Text(year.toString()),

        /// 다음 연도 버튼
        IconButton(
            onPressed: notifier.nextYear,
            icon: const Icon(Icons.arrow_forward_ios)),
      ],
    );
  }
}