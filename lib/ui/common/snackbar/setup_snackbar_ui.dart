import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../app_colors.dart';

enum SnackBarType { red, defaultColor }

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.red,
    config: SnackbarConfig(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        margin: EdgeInsets.all(20),
        duration: Duration(seconds: 3),
        borderRadius: 8,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        snackPosition: SnackPosition.TOP),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.defaultColor,
    config: SnackbarConfig(
        margin: EdgeInsets.all(20),
        duration: Duration(seconds: 3),
        backgroundColor: colorPrimary.withOpacity(0.5),
        textColor: Colors.black54,
        borderRadius: 8,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        snackPosition: SnackPosition.TOP),
  );
}
