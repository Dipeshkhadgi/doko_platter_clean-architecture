import 'package:flutter/material.dart';
import 'package:doko_platter/app/app.dart';
import 'package:doko_platter/app/di/di.dart';
import 'package:doko_platter/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    App(),
  );
}
