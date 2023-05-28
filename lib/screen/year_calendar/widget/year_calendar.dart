import 'package:flutter/material.dart';
import 'package:flutter_todaily/screen/year_calendar/widget/dates_grid.dart';

class YearCalendar extends StatelessWidget {
  const YearCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// 날짜 그리드
            DatesGrid(),
          ],
        ),
      ),
    );
  }
}
