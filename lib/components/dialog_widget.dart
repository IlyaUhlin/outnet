import 'package:flutter/material.dart';
import 'package:outnet/app_res/AppColors.dart';

class AppDialog extends StatefulWidget {
  AppDialog({
    required this.title,
    required this.message,
    this.buttons,
  });

  String title;
  String message;
  List<Widget>? buttons;

  @override
  _AppDialogState createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      elevation: 0,
      backgroundColor: Colors.black,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.orange),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.title,
                style: const TextStyle(color: AppColors.orange, fontSize: 15),
              ),
            ),
            const SizedBox(height: 35),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                widget.message,
                style: const TextStyle(color: AppColors.orange, fontSize: 30),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              children: widget.buttons ?? [],
            ),
          ],
        ),
      ),
    );
  }
}

extension AppDialogExtension on AppDialog {
  void show(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return this;
        });
  }
}
