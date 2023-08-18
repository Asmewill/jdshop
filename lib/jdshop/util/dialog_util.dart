import 'package:flutter/material.dart';
import 'package:jdshop/widget/dialog/loading_dialog.dart';

class DialogUtil {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return LoadingDialog();
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}
