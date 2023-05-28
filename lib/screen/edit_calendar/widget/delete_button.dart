import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todaily/provider/edit_calendar_provider.dart';
import 'package:flutter_todaily/provider/selected_calendar_provider.dart';
import 'package:flutter_todaily/util/dialog_utils.dart';
import 'package:flutter_todaily/util/toast_utils.dart';
import 'package:flutter_todaily/util/widget/check_alert_dialog.dart';

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

  /// 삭제 전 확인 다이얼로그 콜백
  Future<bool> checkDeleteDialog(BuildContext context) async {
    return await showDialog<bool?>(
          context: context,
          builder: (context) => const CheckAlertDialog(
            title: DialogUtils.deleteTitle,
            content: DialogUtils.deleteContent,
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
        visible: ref.watch(selectedCalendarProvider
            .select((calendar) => calendar.value != null)),
        child: IconButton(
            onPressed: () async {
              final check = await checkDeleteDialog(context);
              if (!check) return;
              deleteCalendar(ref);
            },
            icon: const Icon(Icons.delete_outline)));
  }
}
