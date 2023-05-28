import 'package:flutter/material.dart';
import 'package:flutter_todaily/screen/year_calendar/widget/month_bar.dart';
import 'package:flutter_todaily/screen/year_calendar/widget/year_calendar.dart';
import 'package:flutter_todaily/screen/year_calendar/widget/year_select_bar.dart';

class MainCalendarScreen extends StatelessWidget {
  const MainCalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '캘린더리',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: const Column(
        children: [
          /// 연도 선택 바
          YearSelectBar(),

          /// 월 표시 바
          MonthBar(),

          /// 연도 캘린더
          Expanded(child: YearCalendar()),
        ],
      ),
    );
  }
}
