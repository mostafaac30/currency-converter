import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: SizedBox(
        height: 100,
        width: 100,
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => WillPopScope(
        // Wrap dialog with WillPopScope widget
        onWillPop: () async => false, // Disable popping dialog with back button
        child: const LoadingDialog()),
  );
}
