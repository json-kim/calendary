import 'package:flutter/material.dart';
import 'package:flutter_todaily/util/color_utils.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {},
          child: Center(
            child: const Text(
              '캘린더 저장하기',
              style: TextStyle(color: ColorUtils.pureBlack),
            ),
          )),
    );
  }
}
