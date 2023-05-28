import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todaily/provider/edit_calendar_provider.dart';
import 'package:flutter_todaily/provider/selected_calendar_provider.dart';
import 'package:flutter_todaily/util/toast_utils.dart';

class DeleteButton extends ConsumerWidget {
  const DeleteButton({super.key});

  /// 캘린더 삭제 버튼 콜백
  Future<void> deleteCalendar(WidgetRef ref) async {
    final isSuccess =
        await ref.watch(editCalendarProvider.notifier).deleteCalendar();

    ToastUtils.showToast(
        isSuccess ? ToastUtils.successDelete : ToastUtils.failDelete);

    if (isSuccess) {
      ref.refresh(selectedCalendarProvider);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
        visible: ref.watch(selectedCalendarProvider
            .select((calendar) => calendar.value != null)),
        child: IconButton(
            onPressed: () => deleteCalendar(ref),
            icon: const Icon(Icons.delete_outline)));
  }
}
