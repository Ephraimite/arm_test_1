import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class OutlineFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final Function()? onTap;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Function? onChanged;
  final bool shouldReadOnly;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final TextInputFormatter? formatter;
  final bool? isEnabled;
  final int? maxLength;
  final Key? key;
  final index;

  OutlineFormField({
    this.label,
    this.prefixIcon,
    this.maxLength,
    this.onTap,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.obscureText,
    this.onChanged,
    this.formatter,
    this.validator,
    this.textEditingController,
    this.isEnabled,
    this.key,
    this.index,
    this.shouldReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label!,
            style: TextStyle(
                fontSize: 12.0.sp,
                color: naturalGrey70,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 5.0.h),
          SizedBox(
            child: TextFormField(
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              enabled: isEnabled,
              onTap: onTap,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLength: maxLength,
              controller: textEditingController,
              cursorColor: Colors.black,
              keyboardType: keyboardType,
              readOnly: shouldReadOnly,
              obscureText: obscureText ?? false,
              onChanged: (text) {
                if (onChanged != null) onChanged!(text);
              },
              validator: validator,
              inputFormatters: [
                formatter ?? FilteringTextInputFormatter.singleLineFormatter
              ],
              style: TextStyle(
                  fontSize: 12.0.sp,
                  color: labelColor,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                counterText: "",
                hintText: hintText,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Colors.black26),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.0.w,
                  vertical: 25.0.h,
                ),
                // prefixIcon: Container(
                //     height: 50,
                //     width: 50,
                //     padding: EdgeInsets.all(10.0),
                //     child: prefixIcon),
                suffixIcon: suffixIcon,
                border: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorPrimaryLight, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorPrimaryLight, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorPrimaryLight, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: redColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: redColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
