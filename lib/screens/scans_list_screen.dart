import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/qr_codes_model_view.dart';

class ScansListScreen extends StatelessWidget {
  const ScansListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final qrCodeList = context.read<QRCodeViewModel>();
    return Scaffold(
        body: qrCodeList.qrCodesList.isNotEmpty
            ? ListView.builder(
                itemCount: qrCodeList.qrCodesList.length,
                itemBuilder: (context, index) =>
                    _ScanListItem(title: qrCodeList.qrCodesList[index]),
              )
            : const Center(
                child: Text("Пусто"),
              ));
  }
}

class _ScanListItem extends StatelessWidget {
  final String title;
  const _ScanListItem({required this.title});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: const Divider(
        height: 0,
      ),
    );
  }
}
