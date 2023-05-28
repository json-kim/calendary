import 'package:flutter/material.dart';

class DateBar extends StatelessWidget {
  const DateBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          31,
          (index) => AspectRatio(
                aspectRatio: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Text('${index + 1}'),
                ),
              )),
    );
  }
}
