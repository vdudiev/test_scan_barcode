import 'package:flutter/material.dart';
import 'package:test_scan_barcode/core/main_app.dart';
import 'package:test_scan_barcode/repositories/scans_repositories.dart';

import 'package:test_scan_barcode/view_model/qr_codes_model_view.dart';

class DiContainer {
  const DiContainer();
  CoreViewModel makeViewModel() {
    debugPrint(_makeScanListRepository().toString());
    return QRCodeViewModel(scanListRepository: _makeScanListRepository());
  }

  ScanListRepository _makeScanListRepository() =>
      ScansListFromHiveRepositories();
}
