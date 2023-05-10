import 'package:flutter/material.dart';
import 'package:flutter_todaily/screen/year_calendar/widget/month_date_column.dart';

class DatesGrid extends StatelessWidget {
  const DatesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        12,
        (index) => Expanded(
          child: MonthDateColumn(month: index + 1),
        ),
      ),
    );
  }
}
