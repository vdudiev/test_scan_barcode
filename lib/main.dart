import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_scan_barcode/core/main_app.dart';
import 'package:test_scan_barcode/di_containers/di_container.dart';
import 'package:test_scan_barcode/models/scan_model.dart';

void main() async {
  const diContainer = DiContainer();
  await Hive.initFlutter();
  Hive.registerAdapter(ScanModelAdapter());
  runApp(MainApp(
    coreViewModel: diContainer.makeViewModel(),
  ));
}
