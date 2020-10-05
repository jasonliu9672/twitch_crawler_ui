import 'dart:convert';
import 'dart:io';

import 'package:twitch_crawler_ui/models/probe.dart';
import 'package:http/http.dart' as http;

Future<dynamic> initiateProbe(
  String country,
  String language,
) async {
  final http.Response response = await http.post(
    'http://140.112.42.160:22222/nslab/start',
    body: <String, String>{'country': country, 'language': language},
  );
  print(response.statusCode);
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    // print()
    return Probe.fromJson(json.decode(response.body)['probe']);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return json.decode(response.body)['error'];
  }
}

Future<dynamic> closeProbe(
  String id,
) async {
  print(id);
  final http.Response response = await http.delete(
    'http://140.112.42.160:22222/nslab/close/$id',
  );
  print(response.statusCode);
  if (response.statusCode == 202) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    // print()
    print(json.decode(response.body)['status']);
    return json.decode(response.body)['status'];
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return json.decode(response.body)['error'];
  }
}

Future<List<Probe>> getProbesList() async {
  final http.Response response = await http.get(
    'http://140.112.42.160:22222/nslab/status',
  );
  if (response.statusCode == 200) {
    List<Probe> probeList = new List<Probe>();
    List<dynamic> fetchedprobList =
        json.decode(response.body)['status']['aliveContaiers'];

    if (fetchedprobList != null) {
      fetchedprobList.forEach((probe) => probeList.add(Probe.fromJson(probe)));
    }
    return probeList;
  } else {
    throw Exception('Failed to load probes');
  }
}
