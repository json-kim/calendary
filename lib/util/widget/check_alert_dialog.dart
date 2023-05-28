import 'package:flutter/material.dart';

class CheckAlertDialog extends StatelessWidget {
  const CheckAlertDialog(
      {required this.title,
      required this.content,
      this.cancelText = '취소',
      this.submitText = '확인',
      super.key});

  final String title;
  final String content;
  final String cancelText;
  final String submitText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelText)),
        ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(submitText)),
      ],
    );
  }
}
