import 'package:flutter/material.dart';

import 'app.dart';
import 'dependencies/dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(MyApp());
}
