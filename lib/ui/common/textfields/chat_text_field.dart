import 'package:arm_test_1/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onTap;
  final Function()? onMessageSendBtnTap;
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
  final int? maxLength;
  final int? maxLines;
  final Key? key;
  final index;

  ChatFormField({
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
    this.focusNode, this.onMessageSendBtnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 6.0.h),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(48.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
              child: SizedBox(
                child: Row(
                  children: [
                    Expanded(
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
                          formatter ??
                              FilteringTextInputFormatter.singleLineFormatter
                        ],
                        style: TextStyle(
                            fontSize: 12.0.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            counterText: "",
                            hintText: hintText,
                            hintStyle:
                                TextStyle(color: colorPrimary, fontSize: 12.sp),
                            contentPadding: const EdgeInsets.all(
                              19.0,
                            ),
                            suffixIcon: suffixIcon,
                            border: InputBorder.none,
                            filled: false),
                      ),
                    ),
                    Icon(
                      Icons.attachment_outlined,
                      color: colorPrimary,
                      size: 25.sp,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    InkWell(
                      onTap: onMessageSendBtnTap,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: colorPrimary,
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
