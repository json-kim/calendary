import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/model/enum/calendar_mood_enum.dart';
import 'package:flutter_todaily/provider/mood_color_provider.dart';

class MoodListTile extends ConsumerWidget {
  const MoodListTile({required this.mood, super.key});

  final CalendarMood mood;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorTheme = ref.watch(moodColorThemeProvider);

    return Row(
      children: [
        Container(
          color: colorTheme.colorWithMood(mood),
          width: 16,
          height: 16,
        ),
        const SizedBox(width: 16),
        Expanded(child: Text(mood.enString)),
      ],
    );
  }
}
