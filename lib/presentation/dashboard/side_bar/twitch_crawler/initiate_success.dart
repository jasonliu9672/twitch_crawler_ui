import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:twitch_crawler_ui/presentation/routing/route_names.dart';
import 'package:twitch_crawler_ui/presentation/routing/router.dart';
import 'package:twitch_crawler_ui/presentation/services/navigation_service.dart';

import '../../../../locator.dart';

class InitiateSucess extends StatelessWidget {
  InitiateSucess({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Spacer(flex: 4),
        Icon(
          FontAwesome5.earlybirds,
          size: 50,
          color: Colors.greenAccent[700],
        ),
        Spacer(),
        Text(
          'Initiated Success',
          style: TextStyle(fontSize: 34, color: Colors.white),
        ),
        Spacer(),
        RaisedButton.icon(
          onPressed: () =>
              locator<NavigationService>().navigateTo(InitiateFormRoute),
          icon: Icon(Icons.replay),
          label: Text('INITIATE AGAIN'),
        ),
        Spacer(flex: 4),
      ],
    );
  }
}
