import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class OutlineBtn extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? textColor;
  final Color? borderColor;

  OutlineBtn(
      {required this.text, this.onPressed, this.textColor, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 15.h),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            )),
            side: MaterialStateProperty.all(
                BorderSide(width: 1.0, color: borderColor ?? colorPrimary)),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16.sp, fontWeight: FontWeight.w500, color: textColor),
          )),
    );
  }
}
