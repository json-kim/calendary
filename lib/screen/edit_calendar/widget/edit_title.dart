import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/provider/edit_calendar_provider.dart';

class EditTitle extends ConsumerStatefulWidget {
  const EditTitle({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditTitleState();
}

class _EditTitleState extends ConsumerState<EditTitle> {
  final titleController = TextEditingController();

  @override
  void initState() {
    titleController.text =
        ref.read(editCalendarProvider.select((value) => value.title));
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('캘린더 제목'),
          const SizedBox(height: 8),
          TextField(
            controller: titleController,
            maxLength: 40,
            decoration: const InputDecoration(
                hintText: '제목은 최대 40자까지 입력 가능합니다.', semanticCounterText: '자'),
            inputFormatters: [LengthLimitingTextInputFormatter(40)],
            onChanged: (value) =>
                ref.watch(editCalendarProvider.notifier).chanegeTitle(value),
          ),
        ],
      ),
    );
  }
}
