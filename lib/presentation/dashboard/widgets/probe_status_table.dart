import 'dart:async';

import 'package:flutter/material.dart';
import 'package:twitch_crawler_ui/models/probe.dart';
import 'package:twitch_crawler_ui/apis/probe.dart';
import 'package:twitch_crawler_ui/presentation/dashboard/widgets/close_probe_button.dart';

class ProbeStatusTable extends StatefulWidget {
  // final Color cardColor;
  // final String id;
  // final String name;
  // final String createdOn;
  // final String language;
  // final String country;

  const ProbeStatusTable({
    Key key,
  }) : super(key: key);

  @override
  _ProbeStatusTableState createState() => _ProbeStatusTableState();
}

class _ProbeStatusTableState extends State<ProbeStatusTable> {
  Future<List<Probe>> _probes;

  setUpTimedFetch() {
    Timer.periodic(Duration(milliseconds: 5000), (timer) {
      setState(() {
        _probes = getProbesList();
      });
    });
  }

  @override
  void initState() {
    super.initState();

    // _probes = getProbesList();
    setUpTimedFetch();
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    final List<String> TableColumns = [
      "Probe Id",
      "Created On",
      "Server ID",
      "Country",
      "Language",
      "State",
      "Options"
    ];
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2,
      textAlign: TextAlign.center,
      child: FutureBuilder<List<Probe>>(
        future: _probes, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<List<Probe>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            return Material(
              elevation: 10,
              shadowColor: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
              child: Container(
                // height: _media.height / 1.9,
                // width: _media.width / 3 + 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: ListView(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Positioned(
                          top: 10,
                          left: 50,
                          child: Container(
                            // decoration: BoxDecoration(
                            //     border:
                            //         Border.all(color: Colors.green, width: 1)),
                            child: Text(
                              'Acitve Probes Status',
                              style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, left: 20, right: 20),
                          child: Column(
                            children: <Widget>[
                              Container(
                                color: Colors.grey[300],
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: List<Widget>.generate(
                                      TableColumns.length,
                                      (index) => SizedBox(
                                        width: 150,
                                        child: Text(
                                          TableColumns[index],
                                          style: TextStyle(color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )),
                              ),
                              // SizedBox(height: 10),
                              Divider(
                                thickness: 2,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: <Widget>[
                                        ProbeStatusTableRow(
                                            snapshot.data[index].id),
                                        ProbeStatusTableRow(
                                            snapshot.data[index].createdOn),
                                        ProbeStatusTableRow(
                                            snapshot.data[index].serverId),
                                        ProbeStatusTableRow(
                                            snapshot.data[index].country),
                                        ProbeStatusTableRow(
                                            snapshot.data[index].language),
                                        ProbeStatusTableRow(
                                            snapshot.data[index].state),
                                        // ProbeStatusTableRow(
                                        //     probeExamples[index].isActive.toString()),
                                        SizedBox(
                                            width: 150,
                                            child: CloseProbeButton(
                                                id: snapshot.data[index].id)
                                            // FlatButton(
                                            //   color: Colors.red,
                                            //   textColor: Colors.white,
                                            //   disabledColor: Colors.grey,
                                            //   disabledTextColor: Colors.black,
                                            //   padding: EdgeInsets.all(8.0),
                                            //   splashColor: Colors.blueAccent,
                                            //   onPressed: () async {
                                            //     await closeProbe(
                                            //         snapshot.data[index].id);
                                            //     /*...*/
                                            //   },
                                            //   child: Text(
                                            //     "Close",
                                            //     style:
                                            //         TextStyle(fontSize: 20.0),
                                            //   ),
                                            // )
                                            ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            children = <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ];
          } else {
            children = <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'Fetching Data...',
                  style: TextStyle(fontSize: 36),
                ),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}

class ProbeStatusTableRow extends StatelessWidget {
  final String text;
  ProbeStatusTableRow(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 150,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
