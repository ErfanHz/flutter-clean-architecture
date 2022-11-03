import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clean_base/src/app.dart';
import 'package:clean_base/src/data/datasources/local/hive_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await initHive();

  runApp(const App());
}
