import 'package:flutter/material.dart';
import 'package:spacex/pages/home_page.dart';
import 'package:spacex/pages/launch_page.dart';
import 'package:spacex/pages/splash_page.dart';

Map<String, Widget Function(BuildContext)> getRutas() {
  return <String, Widget Function(BuildContext)>{
    '/':      (_) => const HomePage(),
    'splash':      (_) => const SplashPage(),
    'launch': (_) => const LaunchPage(),
  };
}
