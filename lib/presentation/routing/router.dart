import 'package:flutter/material.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/side_bar/side_bar_menu.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/side_bar/twitch_crawler/initiate_form.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/side_bar/twitch_crawler/initiate_success.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/side_bar/twitch_crawler/initiate_loading.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/side_bar/twitch_crawler/initiate_fail.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/side_bar/database/query_form.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/side_bar/database/query_loading.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/main_content/probe_status_page.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/main_content/data_table_page.dart';
import 'package:twitch_crawler_ui/presentation/routing/route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ProbeStatusPageRoute:
      return _getPageRoute(ProbeStatusPage());
    case DataTablePageRoute:
      return _getPageRoute(DataTablePage(settings.arguments));
    case SideBarMenuRoute:
      return _getPageRoute(SideBarMenu());
    case InitiateFormRoute:
      return _getPageRoute(InitiateForm());
    case InitiateSuccessRoute:
      return _getPageRoute(InitiateSucess());
    case InitiateLoadingRoute:
      return _getPageRoute(InitiateLoading());
    case InitiateFailRoute:
      return _getPageRoute(InitiateFail(settings.arguments));
    case QueryFormRoute:
      return _getPageRoute(QueryForm());
    case QueryLoadingRoute:
      return _getPageRoute(QueryLoading());
    default:
      return _getPageRoute(InitiateForm());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
