class QRCodeViewModel {
  final List<String> _qrCodesList = [];

  List<String> get qrCodesList => _qrCodesList;

  void addQRScan({required String codeData}) {
    _qrCodesList.add(codeData);
  }
}
