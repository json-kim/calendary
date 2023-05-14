import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditTitle extends StatelessWidget {
  const EditTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('캘린더 제목'),
          const SizedBox(height: 8),
          TextField(
            maxLength: 40,
            decoration: InputDecoration(
                hintText: '제목은 최대 40자까지 입력 가능합니다.', semanticCounterText: '자'),
            inputFormatters: [LengthLimitingTextInputFormatter(40)],
          ),
        ],
      ),
    );
  }
}
