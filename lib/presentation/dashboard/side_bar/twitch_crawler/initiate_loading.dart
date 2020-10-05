import 'package:flutter/material.dart';

class InitiateLoading extends StatelessWidget {
  const InitiateLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Loading... Be patient please',
            style: TextStyle(fontSize: 26, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 80,
            height: 80,
            padding: EdgeInsets.all(12.0),
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
