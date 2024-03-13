import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../app_colors.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.7),
      body: Center(
        child: Container(
          width: 50.0.h,
          height: 50.0.h,
          alignment: Alignment.center,
          child: const LoadingIndicator(
              indicatorType: Indicator.ballRotateChase,
              colors: [colorPrimary],
              strokeWidth: 5.0,
              pathBackgroundColor: Colors.black),
        ),
      ),
    );
  }
}
