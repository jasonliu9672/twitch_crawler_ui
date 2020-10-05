import 'package:flutter/material.dart';

class LogOutputArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.black,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(3),
    ));
  }
}
