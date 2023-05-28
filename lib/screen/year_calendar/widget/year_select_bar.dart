import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/provider/year_provider.dart';

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
            icon: const Icon(
              Icons.arrow_left,
              size: 30,
            )),

        /// 현재 연도
        Text(
          year.toString(),
          style: const TextStyle(fontSize: 18),
        ),

        /// 다음 연도 버튼
        IconButton(
            onPressed: notifier.nextYear,
            icon: const Icon(
              Icons.arrow_right,
              size: 30,
            )),
      ],
    );
  }
}
