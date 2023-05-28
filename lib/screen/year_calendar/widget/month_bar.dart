import 'package:flutter/material.dart';

class MonthBar extends StatelessWidget {
  const MonthBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: List.generate(
          13,
          (index) => Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: index == 0
                  ? const SizedBox()
                  : Center(
                      child: Text('$index'),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
