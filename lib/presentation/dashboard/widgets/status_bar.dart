import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:fluttericon/entypo_icons.dart';

class StatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> statues = [
      {
        "icon": Icon(
          Typicons.location,
          size: 40,
          color: Colors.lightGreen,
        ),
        "type": "Country",
        "value": "Japan",
        "detail": "Country of the currently using VPN Server"
      },
      {
        "icon": Icon(
          FontAwesome5.server,
          size: 40,
          color: Colors.redAccent,
        ),
        "type": "Server ID",
        "value": "jp32",
        "detail": "Server ID of the currently using VPN Server"
      },
      {
        "icon": Icon(
          FontAwesome5.globe,
          size: 40,
          color: Colors.blueAccent,
        ),
        "type": "IP Address",
        "value": "23.63.122.53",
        "detail": "IP address of the currently using VPN Server"
      },
      {
        "icon": Icon(
          Entypo.gauge,
          size: 40,
          color: Colors.blue,
        ),
        "type": "Average Request sent Per Stream",
        "value": "123",
        "detail": "Total API Requests sent for probing one channel "
      },
    ];
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          statues.length,
          (index) => StatusCard(
            icon: statues[index]["icon"],
            type: statues[index]["type"],
            value: statues[index]["value"],
            detail: statues[index]["detail"],
          ),
        ),
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  const StatusCard({
    Key key,
    @required this.icon,
    @required this.type,
    @required this.value,
    @required this.detail,
  }) : super(key: key);
  final Icon icon;
  final String type, detail, value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon,
                Expanded(
                  child: Column(
                    children: <Widget>[
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          type,
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ),
                      Text(
                        value,
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Align(
              alignment: Alignment.center,
              child: FittedBox(
                child: Text(
                  detail,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
