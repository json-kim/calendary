import 'package:flutter/material.dart';
import 'package:flutter_todaily/screen/year_calendar/widget/year_calendar.dart';
import 'package:flutter_todaily/screen/year_calendar/widget/year_select_bar.dart';

class MainCalendarScreen extends StatelessWidget {
  const MainCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '오늘 하루',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: const [
          /// 연도 선택 바
          YearSelectBar(),

          /// 연도 캘린더
          Expanded(child: YearCalendar()),
        ],
      ),
    );
  }
}
