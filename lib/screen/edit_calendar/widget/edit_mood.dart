import 'package:flutter/material.dart';
import 'package:flutter_todaily/model/enum/calendar_mood_enum.dart';
import 'package:flutter_todaily/screen/edit_calendar/widget/mood_list_tile.dart';

class EditMood extends StatelessWidget {
  const EditMood({super.key});

  @override
  Widget build(BuildContext context) {
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
              value: CalendarMood.veryGood,
              isExpanded: true,
              items: CalendarMood.moodList
                  .map((mood) => DropdownMenuItem<CalendarMood>(
                      value: mood,
                      child: MoodListTile(
                        mood: mood,
                      )))
                  .toList(),
              onChanged: (value) {},
            ),
          )
        ],
      ),
    );
  }
}
