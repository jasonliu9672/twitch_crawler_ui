import 'package:flutter/material.dart';
import 'package:twitch_crawler_ui/presentation/common/theme.dart';
import 'package:twitch_crawler_ui/locator.dart';
import 'package:twitch_crawler_ui/presentation/services/navigation_service.dart';
import 'package:twitch_crawler_ui/presentation/routing/route_names.dart';
import 'package:twitch_crawler_ui/presentation/routing/router.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black26, spreadRadius: 2)
        ],
        color: drawerBgColor,
      ),
      child: Navigator(
        key: locator<NavigationService>().navigatorKey,
        onGenerateRoute: generateRoute,
        initialRoute: SideBarMenuRoute,
      ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: Container(
      //         alignment: Alignment.center,
      //         padding: const EdgeInsets.all(8.0),
      //         decoration: BoxDecoration(
      //           color: Colors.deepPurple,
      //         ),
      //         child: Text(
      //           'Twitch Crawler',
      //           style: TextStyle(
      //               color: Colors.white, fontSize: 20, letterSpacing: 4),
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       child: Navigator(
      //         key: locator<NavigationService>().navigatorKey,
      //         onGenerateRoute: generateRoute,
      //         initialRoute: InitiateFormRoute,
      //       ),

      //       // child: InitiateForm(),
      //     )
      //   ],
      // ),
    );
  }
}
