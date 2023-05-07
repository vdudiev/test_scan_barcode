import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_scan_barcode/view_model/qr_codes_model_view.dart';
import 'package:test_scan_barcode/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Provider(
            create: (context) => QRCodeViewModel(), child: const HomePage()));
  }
}
