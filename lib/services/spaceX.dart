import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacex/models/launch.dart';

class SpaceX {

  static final SpaceX _instance = SpaceX._internal();
  factory SpaceX() => _instance;
  SpaceX._internal();
  static const baseUrl = "https://api.spacexdata.com/v4/launches";

  Future<List<Launch>> getData() async {
    //SpaceX
    final resp = await http.get(Uri.parse(baseUrl));
    final data = resp.body;
    final List<dynamic> obj = jsonDecode(data);
    final listLaunch = obj.map((p) => Launch.fromMap(p)).toList();

    return listLaunch;
  }
}
