import 'package:flutter/material.dart';

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
            child: DropdownButton(
              value: 'one',
              isExpanded: true,
              items: [
                DropdownMenuItem<String>(child: Text('test'), value: 'one'),
                DropdownMenuItem<String>(child: Text('two'), value: 'two'),
              ],
              onChanged: (value) {},
            ),
          )
        ],
      ),
    );
  }
}
