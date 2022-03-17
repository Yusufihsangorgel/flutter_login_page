import 'package:flutter/material.dart';

class MySize extends StatelessWidget {
  final myHeight;
  const MySize({Key? key, required this.myHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: myHeight,
    );
  }
}
