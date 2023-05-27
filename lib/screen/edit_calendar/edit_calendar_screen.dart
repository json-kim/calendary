import 'package:flutter/material.dart';
import 'package:flutter_todaily/screen/edit_calendar/widget/date_appbar_title.dart';
import 'package:flutter_todaily/screen/edit_calendar/widget/edit_button.dart';
import 'package:flutter_todaily/screen/edit_calendar/widget/edit_content.dart';
import 'package:flutter_todaily/screen/edit_calendar/widget/edit_mood.dart';
import 'package:flutter_todaily/screen/edit_calendar/widget/edit_title.dart';
import 'package:flutter_todaily/util/color_utils.dart';

class EditCalendarScreen extends StatelessWidget {
  const EditCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading: const BackButton(
          color: ColorUtils.pureBlack,
        ),
        title: const DateAppBarTitle(),
        backgroundColor: ColorUtils.pureWhite,
        elevation: 0,
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  /// 캘린더 기분 입력
                  EditMood(),

                  /// 캘린더 제목 입력
                  EditTitle(),

                  /// 캘린더 내용 입력
                  EditContent(),
                ],
              ),
            ),

            /// 캘린더 저장 버튼
            const EditButton(),
          ],
        ),
      ),
    );
  }
}
