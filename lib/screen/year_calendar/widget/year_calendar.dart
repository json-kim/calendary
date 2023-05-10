import 'package:flutter/material.dart';
import 'package:flutter_todaily/screen/year_calendar/widget/dates_grid.dart';
import 'package:flutter_todaily/screen/year_calendar/widget/month_bar.dart';

class YearCalendar extends StatelessWidget {
  const YearCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            /// 월 표시 바
            MonthBar(),

            /// 날짜 그리드
            DatesGrid(),
          ],
        ),
      ),
    );
  }
}
