import 'package:flutter/material.dart';
import 'package:twitch_crawler_ui/presentation/routing/route_names.dart';
import 'package:twitch_crawler_ui/presentation/services/navigation_service.dart';

import '../../../../locator.dart';

class InitiateFail extends StatelessWidget {
  final String errorMessage;
  const InitiateFail(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Spacer(flex: 3),
        Icon(
          Icons.error,
          size: 50,
          color: Colors.redAccent,
        ),
        Spacer(),
        Text(
          'Initiated Failed',
          style: TextStyle(fontSize: 34, color: Colors.red),
        ),
        Text(
          errorMessage,
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
        Spacer(),
        RaisedButton.icon(
          onPressed: () =>
              locator<NavigationService>().navigateTo(InitiateFormRoute),
          icon: Icon(Icons.replay),
          label: Text('TRY AGAIN'),
        ),
        Spacer(flex: 4),
      ],
    );
  }
}
