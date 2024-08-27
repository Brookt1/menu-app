import 'package:flutter/material.dart';
import 'package:grocery/injection_container.dart' as sl;

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  runApp(const App());
}
