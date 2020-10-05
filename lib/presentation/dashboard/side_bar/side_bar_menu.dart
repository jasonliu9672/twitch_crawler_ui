import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitch_crawler_ui/locator.dart';
import 'package:twitch_crawler_ui/presentation/services/navigation_service.dart';
import 'package:twitch_crawler_ui/presentation/routing/route_names.dart';

class SideBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                color: Colors.deepPurple,
                padding: EdgeInsets.all(16.0),
                splashColor: Colors.purpleAccent,
                onPressed: () {
                  locator<NavigationService>().navigateTo(InitiateFormRoute);
                  locator<MainContentNav>().navigateTo(ProbeStatusPageRoute);
                },
                child: Text(
                  "Twitch Crawler",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 4,
                  ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                color: Colors.lightGreen,
                padding: EdgeInsets.all(16.0),
                splashColor: Colors.greenAccent,
                onPressed: () {
                  locator<NavigationService>().navigateTo(QueryFormRoute);
                  locator<MainContentNav>().navigateTo(DataTablePageRoute);
                },
                child: Text(
                  "Database",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 4,
                  ),
                ),
              ),
            ),
            Spacer(flex: 30),
          ],
        ));
  }
}
