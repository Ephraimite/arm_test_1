import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class FilledBtn extends StatelessWidget {
  final String text;
  final Color? textColor;
  // final Color? backgroundColor;
  final bool? isEnabled;
  final Function()? onPressed;

  FilledBtn({
    required this.text,
    this.textColor,
    this.onPressed,
    // this.backgroundColor,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 15.h),
            ),
            backgroundColor: MaterialStateProperty.all(
                isEnabled == false ? colorPrimary : colorPrimary),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ),
          onPressed: isEnabled == false ? () {} : onPressed,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 17.sp, fontWeight: FontWeight.w500, color: textColor),
          )),
    );
  }
}
