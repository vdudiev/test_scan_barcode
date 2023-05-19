import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_scan_barcode/screens/home_screen.dart';

abstract class CoreViewModel extends ChangeNotifier {
  get qrCodesList;
  void addQRScan({required String codeData});
  void initScanList();
}

class MainApp extends StatelessWidget {
  final CoreViewModel coreViewModel;
  const MainApp({super.key, required this.coreViewModel});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider<CoreViewModel>(
            lazy: false,
            create: (_) => coreViewModel,
            child: const HomePage()));
  }
}
