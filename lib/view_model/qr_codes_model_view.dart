import 'package:test_scan_barcode/core/main_app.dart';
import 'package:test_scan_barcode/models/scan_model.dart';

abstract class ScanListRepository {
  List<ScanModel> qrCodesList = [];
  Future<void> addQRScan({required String codeData, required String time});
  Future<void> loadScanLsit();
}

class QRCodeViewModel extends CoreViewModel {
  final ScanListRepository _scanListRepository;
  QRCodeViewModel({required ScanListRepository scanListRepository})
      : _scanListRepository = scanListRepository {
    _scanedTime = DateTime.now();
    initScanList();
  }
  late DateTime _scanedTime;

  @override
  List<ScanModel> get qrCodesList => _scanListRepository.qrCodesList;

  @override
  void addQRScan({required String codeData}) async {
    await _scanListRepository.addQRScan(
        codeData: codeData, time: _scanedTime.toString());
    notifyListeners();
  }

  @override
  void initScanList() async {
    await _scanListRepository.loadScanLsit();
    notifyListeners();
  }
}
