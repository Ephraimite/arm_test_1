import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class NoIconFormFieldWidget extends StatelessWidget {
  final String? label;
  final TextInputType? keyboardType;
  final obscureText;
  final String? hintText;
  final TextInputFormatter? formatter;
  final Function(String)? onChanged;
  final Function()? onTap;
  final int? maxLength;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Color? labelColor;
  final Color? filledColor;
  final TextEditingController? textEditingController;
  final dynamic validator;
  final bool shouldReadOnly;
  final bool enabled;
  final int? minLines;

  NoIconFormFieldWidget({
    this.label,
    this.onChanged,
    this.onTap,
    this.keyboardType,
    this.formatter,
    this.obscureText,
    this.hintText,
    this.maxLength,
    this.textEditingController,
    this.validator,
    this.shouldReadOnly = false,
    trailing,
    this.suffixIcon,
    this.enabled = true,
    this.borderColor,
    this.minLines,
    this.labelColor,
    this.filledColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null
            ? Container()
            : Text(
                label!,
                style: TextStyle(
                    fontSize: 12.0.sp,
                    color: labelColor,
                    fontWeight: FontWeight.w400),
              ),
        SizedBox(height: 5.0.h),
        TextFormField(
          maxLines: minLines,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          onTap: onTap ?? null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLength: obscureText ? null : maxLength,
          controller: textEditingController,
          cursorColor: colorPrimary,
          keyboardType: keyboardType,
          readOnly: shouldReadOnly,
          obscureText: obscureText,
          onChanged: (text) {
            if (onChanged != null) onChanged!(text);
          },
          validator: validator,
          inputFormatters: [
            formatter ?? FilteringTextInputFormatter.singleLineFormatter
          ],
          style: TextStyle(
              fontSize: 12.0.sp,
              color: colorPrimary,
              fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              counterText: "",
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Colors.black45,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
              suffixIcon: suffixIcon,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? colorPrimary, width: 1.0.w),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: borderColor ?? colorPrimary, width: 1.0.w),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.5.w),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.5.w),
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              fillColor: filledColor,
              filled: true),
        )
      ],
    );
  }
}
