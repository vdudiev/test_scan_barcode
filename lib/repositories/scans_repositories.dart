import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_scan_barcode/models/scan_model.dart';
import 'package:test_scan_barcode/view_model/qr_codes_model_view.dart';

class ScansListFromHiveRepositories implements ScanListRepository {
  @override
  List<ScanModel> qrCodesList = [];
  late DateTime _scanedTime;
  late Box<ScanModel> _box;
  ScansListFromHiveRepositories() {
    _scanedTime = DateTime.now();
  }

  @override
  Future<void> addQRScan(
      {required String codeData, required String time}) async {
    var scanModel = ScanModel(scan: codeData, scanDate: _scanedTime.toString());
    qrCodesList.add(scanModel);
    await _box.add(scanModel);
  }

  @override
  Future<void> loadScanLsit() async {
    _box = await Hive.openBox('scanList');
    qrCodesList = _box.values.cast<ScanModel>().toList();
  }
}
