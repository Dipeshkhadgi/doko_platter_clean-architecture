import 'package:doko_platter_clean_architecture/app/app.dart';
import 'package:doko_platter_clean_architecture/app/di/di.dart';
import 'package:doko_platter_clean_architecture/core/network/hive_service.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    const MyApp(),
  );
}
