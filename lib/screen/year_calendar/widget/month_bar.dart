import 'package:flutter/material.dart';

class MonthBar extends StatelessWidget {
  const MonthBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: List.generate(
          12,
          (index) => Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Center(
                child: Text('${index + 1}'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
