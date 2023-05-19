import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_scan_barcode/core/main_app.dart';

class ScansListScreen extends StatelessWidget {
  const ScansListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final qrCodeList = context.watch<CoreViewModel>().qrCodesList;
    return Scaffold(
        body: qrCodeList.isNotEmpty
            ? ListView.builder(
                itemCount: qrCodeList.length,
                itemBuilder: (context, index) => _ScanListItem(
                  title: qrCodeList[index].scan,
                  scanDate: qrCodeList[index].scanDate,
                ),
              )
            : const Center(
                child: Text("Пусто"),
              ));
  }
}

class _ScanListItem extends StatelessWidget {
  final String? title;
  final String? scanDate;
  const _ScanListItem({required this.title, required this.scanDate});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title ?? ''),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(scanDate ?? ''),
          const Divider(),
        ],
      ),
    );
  }
}
