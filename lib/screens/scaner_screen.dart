import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:test_scan_barcode/widgets/main_button.dart';

import '../view_model/qr_codes_model_view.dart';

class ScanerScreen extends StatefulWidget {
  const ScanerScreen({super.key});

  @override
  State<ScanerScreen> createState() => _ScanerScreenState();
}

class _ScanerScreenState extends State<ScanerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QRScaner');
  @override
  void initState() {
    super.initState();
  }

  void _onQRViewCreated(QRViewController qRViewController) {
    qrController = qRViewController;
    QRCodeViewModel qrCodeModelView = context.read<QRCodeViewModel>();
    qRViewController.scannedDataStream.listen((scanData) {
      if (isScanOn && scanData.code != null) {
        qrCodeModelView.addQRScan(codeData: scanData.code!);
        Fluttertoast.showToast(msg: "Скан Добавлен");
        setState(() {
          isScanOn = false;
        });
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  bool isScanOn = false;
  QRViewController? qrController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
            Positioned(
                bottom: 100,
                child: MainButton(
                    color: isScanOn ? Colors.green : Colors.red,
                    title: isScanOn ? "Сканер включен" : "Сканер выключен",
                    onTap: () => _onOrOffScnaer()))
          ],
        ),
      ),
    );
  }

  _onOrOffScnaer() {
    isScanOn = !isScanOn;
    setState(() {});
  }
}
