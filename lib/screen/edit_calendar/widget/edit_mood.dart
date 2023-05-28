import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/model/enum/calendar_mood_enum.dart';
import 'package:flutter_todaily/provider/edit_calendar_provider.dart';
import 'package:flutter_todaily/screen/edit_calendar/widget/mood_list_tile.dart';

class EditMood extends ConsumerWidget {
  const EditMood({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('캘린더 색상 선택'),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<CalendarMood>(
              value:
                  ref.watch(editCalendarProvider.select((value) => value.mood)),
              isExpanded: true,
              items: CalendarMood.moodList
                  .map((mood) => DropdownMenuItem<CalendarMood>(
                      value: mood,
                      child: MoodListTile(
                        mood: mood,
                      )))
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                ref.watch(editCalendarProvider.notifier).changeMood(value);
              },
            ),
          )
        ],
      ),
    );
  }
}
