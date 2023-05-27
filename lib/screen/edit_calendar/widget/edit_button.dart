import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todaily/provider/edit_calendar_provider.dart';
import 'package:flutter_todaily/provider/selected_calendar_provider.dart';
import 'package:flutter_todaily/util/color_utils.dart';
import 'package:flutter_todaily/util/toast_utils.dart';

class EditButton extends ConsumerWidget {
  const EditButton({super.key});

  /// 캘린더 저장하기
  Future<void> saveCalendar(WidgetRef ref) async {
    final isValid = ref.watch(editCalendarProvider.notifier).checkValidate();

    if (!isValid) {
      ToastUtils.showToast(ToastUtils.titleValid);
      return;
    }

    final isSuccess =
        await ref.watch(editCalendarProvider.notifier).saveCalendar();

    ToastUtils.showToast(
        isSuccess ? ToastUtils.successSave : ToastUtils.failSave);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () => saveCalendar(ref),
          child: Center(
            child: Text(
              ref.watch(selectedCalendarProvider
                      .select((calendar) => calendar.value == null))
                  ? '캘린더 저장하기'
                  : '캘린더 수정하기',
              style: const TextStyle(color: ColorUtils.pureBlack),
            ),
          )),
    );
  }
}
