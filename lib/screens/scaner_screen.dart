import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:test_scan_barcode/core/main_app.dart';
import 'package:test_scan_barcode/widgets/main_button.dart';

import '../view_model/qr_codes_model_view.dart';

class ScanerScreen extends StatefulWidget {
  const ScanerScreen({super.key});

  @override
  State<ScanerScreen> createState() => _ScanerScreenState();
}

class _ScanerScreenState extends State<ScanerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QRScaner');
  bool isScanOn = false;
  bool isHasCamrePermissions = false;

  bool hasPermissions = true;
  QRViewController? qrController;
  @override
  void initState() {
    _checkPermissions();
    super.initState();
  }

  void _onQRViewCreated(QRViewController qRViewController) {
    qrController = qRViewController;
    var qrCodeModelView = context.read<CoreViewModel>();
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

  void _checkPermissions() async {
    if (await Permission.camera.isDenied) {
      var status = await Permission.camera.request();
      if (status.isGranted) {
        isHasCamrePermissions = true;
        setState(() {});
      }
    } else {
      isHasCamrePermissions = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            isHasCamrePermissions
                ? QRView(key: qrKey, onQRViewCreated: _onQRViewCreated)
                : Container(),
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
