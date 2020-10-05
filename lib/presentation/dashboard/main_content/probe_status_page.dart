import 'package:flutter/material.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/widgets/log_output_area.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/widgets/probe_status_table.dart';

class ProbeStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(color: Colors.grey[50], child: ProbeStatusTable()),
        ),
        Expanded(
          flex: 1,
          child: LogOutputArea(),
        )
      ],
    );
  }
}
