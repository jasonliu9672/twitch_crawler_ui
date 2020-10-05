import 'package:flutter/material.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/dashboard.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/widgets/log_output_area.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twith Crawler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.purple[800],
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Roboto",
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          )),
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.group_work),
              onPressed: () {},
            ),
            backgroundColor: Colors.blue[600],
            title: Text(
              'NSLAB',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          body: DashBoard()),
    );
  }
}
