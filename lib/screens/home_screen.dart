import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_scan_barcode/core/main_app.dart';
import 'package:test_scan_barcode/widgets/main_button.dart';
import 'package:test_scan_barcode/screens/scaner_screen.dart';
import 'package:test_scan_barcode/screens/scans_list_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MainButton(
                title: "Открыть сканер",
                onTap: () => _openNewScreen(
                    context: context, screen: const ScanerScreen())),
            const SizedBox(
              height: 20,
            ),
            MainButton(
                title: "Открыть cписок сканов",
                onTap: () => _openNewScreen(
                      context: context,
                      screen: const ScansListScreen(),
                    ))
          ],
        ),
      ),
    );
  }

  _openNewScreen({required BuildContext context, required Widget screen}) {
    var qrCodeModelView = context.read<CoreViewModel>();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (contextLoginScreen) => ChangeNotifierProvider.value(
              value: qrCodeModelView, child: screen),
        ));
  }
}
