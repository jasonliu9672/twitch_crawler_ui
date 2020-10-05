import 'package:flutter/material.dart';
import 'package:twitch_crawler_ui/apis/probe.dart';
import 'package:progress_indicators/progress_indicators.dart';

class CloseProbeButton extends StatefulWidget {
  final String id;
  CloseProbeButton({Key key, this.id}) : super(key: key);

  @override
  _CloseProbeButtonState createState() => _CloseProbeButtonState();
}

class _CloseProbeButtonState extends State<CloseProbeButton> {
  Future<dynamic> _isClosed;
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: _isClosed, // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // List<Widget> children;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () async {
                setState(() {
                  _isClosed = closeProbe(widget.id);
                });
              },
              child: Text(
                "Close",
                style: TextStyle(fontSize: 20.0),
              ),
            );
          case ConnectionState.waiting:
            print("waiting");
            return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Closing',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  JumpingDotsProgressIndicator(
                    fontSize: 20.0,
                    color: Colors.black,
                  )
                ]);
          case ConnectionState.active:
            print("active");
            return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Closing',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  JumpingDotsProgressIndicator(
                    fontSize: 20.0,
                    color: Colors.black,
                  )
                ]);
          case ConnectionState.done:
            return FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () async {
                setState(() {
                  _isClosed = closeProbe(widget.id);
                });
              },
              child: Text(
                "Close",
                style: TextStyle(fontSize: 20.0),
              ),
            );
        }
        // if (snapshot.hasData) {
        //   children = <Widget>[
        //     FlatButton(
        //       color: Colors.red,
        //       textColor: Colors.white,
        //       disabledColor: Colors.grey,
        //       disabledTextColor: Colors.black,
        //       padding: EdgeInsets.all(8.0),
        //       splashColor: Colors.blueAccent,
        //       onPressed: () async {
        //         setState(() {
        //           _isClosed = closeProbe(widget.id);
        //         });
        //       },
        //       child: Text(
        //         "Close",
        //         style: TextStyle(fontSize: 20.0),
        //       ),
        //     ),
        //   ];
        // } else if (snapshot.hasError) {
        //   children = <Widget>[
        //     Icon(
        //       Icons.error_outline,
        //       color: Colors.red,
        //       size: 60,
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(top: 16),
        //       child: Text('Error: ${snapshot.error}'),
        //     )
        //   ];
        // } else {
        //   children = <Widget>[
        //     SizedBox(
        //       child: LinearProgressIndicator(
        //         backgroundColor: Colors.grey,
        //       ),
        //       width: 20,
        //       height: 20,
        //     ),
        //     Padding(
        //       padding: EdgeInsets.only(top: 6),
        //       child: Row(children: <Widget>[
        //         Text('Closing'),
        //         JumpingDotsProgressIndicator(
        //           fontSize: 20.0,
        //         )
        //       ]),
        //     )
        //   ];
        // }
        // return Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: children,
        //   ),
        // );
      },
    );
  }
}
