import 'dart:async';

import 'package:spacex/models/launch.dart';

class LauchData {


  static final LauchData _instance = LauchData._internal();
  factory LauchData() => _instance;
  LauchData._internal();

  final StreamController<List<Launch>> _launch = StreamController<List<Launch>>.broadcast();


  StreamController<List<Launch>> get streamLaunch =>  _launch;

  void datalaunch(List<Launch> lista){
    _launch.add(lista); 
  }
  




}