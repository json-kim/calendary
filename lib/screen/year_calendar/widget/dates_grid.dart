import 'package:flutter/material.dart';
import 'package:flutter_todaily/screen/year_calendar/widget/date_bar.dart';
import 'package:flutter_todaily/screen/year_calendar/widget/month_date_column.dart';

class DatesGrid extends StatelessWidget {
  const DatesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        13,
        (index) {
          if (index == 0) return const Expanded(child: DateBar());

          return Expanded(
            child: MonthDateColumn(month: index),
          );
        },
      ),
    );
  }
}
