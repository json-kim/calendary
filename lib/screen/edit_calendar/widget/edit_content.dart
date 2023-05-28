import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todaily/provider/edit_calendar_provider.dart';

class EditContent extends ConsumerStatefulWidget {
  const EditContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditContentState();
}

class _EditContentState extends ConsumerState<EditContent> {
  final contentController = TextEditingController();

  @override
  void initState() {
    contentController.text =
        ref.read(editCalendarProvider.select((value) => value.content ?? ''));
    super.initState();
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  /// 콘텐트 상태값 리스너
  void addContentListener() {
    ref.listen(editCalendarProvider.select((value) => value.content),
        (previous, next) {
      contentController.text = next ?? '';
      contentController.selection = TextSelection(
          baseOffset: contentController.text.length,
          extentOffset: contentController.text.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    addContentListener();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('캘린더 내용'),
          const SizedBox(height: 8),
          TextField(
            controller: contentController,
            maxLength: 1000,
            maxLines: null,
            decoration:
                const InputDecoration(hintText: '내용은 최대 1000자까지 입력 가능합니다.'),
            inputFormatters: [
              LengthLimitingTextInputFormatter(1000),
            ],
            onChanged: (value) =>
                ref.watch(editCalendarProvider.notifier).changeContent(value),
          )
        ],
      ),
    );
  }
}
