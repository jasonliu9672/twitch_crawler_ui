import 'package:flutter/material.dart';

class QueryLoading extends StatelessWidget {
  const QueryLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Query executing...',
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
