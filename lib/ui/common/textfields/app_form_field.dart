import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';

class AppFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onTap;
  final String? label;
  final String? hintText;
  final Color? filledColor;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Function? onChanged;
  final FocusNode? focusNode;
  final bool shouldReadOnly;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;
  final TextInputFormatter? formatter;
  final bool? isEnabled;
  final Color? fieldLabelColor;
  final Color? hintTextColor;

  final int? maxLength;
  final int? maxLines;
  final Key? key;
  final index;

  AppFormField({
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
    this.filledColor,
    this.label,
    this.fieldLabelColor,
    this.maxLines,
    this.focusNode,
    this.hintTextColor,
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
                color: fieldLabelColor ?? labelColor,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 6.0.h),
          SizedBox(
            child: TextFormField(
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              enabled: isEnabled,
              maxLines: maxLines,
              onTap: onTap,
              focusNode: focusNode,
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
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  counterText: "",
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: hintTextColor ?? naturalGrey, fontSize: 12.sp),
                  contentPadding: const EdgeInsets.all(
                    19.0,
                  ),
                  // prefixIcon: Container(
                  //     height: 50,
                  //     width: 50,
                  //     padding: EdgeInsets.all(10.0),
                  //     child: prefixIcon),
                  suffixIcon: suffixIcon,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: naturalGrey20,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: naturalGrey20, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: naturalGrey20, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  // focusedErrorBorder: const OutlineInputBorder(
                  //     borderSide: BorderSide(color: redColor, width: 1.0),
                  //     borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  // errorBorder: const OutlineInputBorder(
                  //     borderSide: BorderSide(color: redColor, width: 1.0),
                  //     borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  fillColor: filledColor ?? naturalGrey20,
                  filled: true),
            ),
          )
        ],
      ),
    );
  }
}
