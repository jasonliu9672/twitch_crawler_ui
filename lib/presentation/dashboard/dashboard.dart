import 'package:flutter/material.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/widgets/log_output_area.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/side_bar/side_bar.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/widgets/probe_status_table.dart';
import 'package:twitch_crawler_ui/locator.dart';
import 'package:twitch_crawler_ui/presentation/services/navigation_service.dart';
import 'package:twitch_crawler_ui/presentation/routing/router.dart';
import 'package:twitch_crawler_ui/presentation/routing/route_names.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SideBar(),
          ),
          Expanded(
            flex: 4,
            child: Navigator(
              key: locator<MainContentNav>().navigatorKey,
              onGenerateRoute: generateRoute,
              initialRoute: ProbeStatusPageRoute,
            ),
          ),
        ],
      ),
    );
  }
}
