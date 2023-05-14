import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditContent extends StatelessWidget {
  const EditContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('캘린더 내용'),
          const SizedBox(height: 8),
          TextField(
            maxLength: 1000,
            maxLines: null,
            decoration: InputDecoration(hintText: '내용은 최대 1000자까지 입력 가능합니다.'),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1000),
            ],
          )
        ],
      ),
    );
  }
}
