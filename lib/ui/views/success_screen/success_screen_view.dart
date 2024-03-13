import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

import '../../common/buttons/filled_btn.dart';
import '../../common/general_widget/default_app_bar.dart';
import 'success_screen_viewmodel.dart';

class SuccessScreenView extends StackedView<SuccessScreenViewModel> {
  final bool? shouldHaveAppBar;
  final String? title;
  final String? subTittle;
  final String? redBtnText;
  final Function()? onTapped;

  const SuccessScreenView({
    Key? key,
    this.onTapped,
    this.shouldHaveAppBar,
    this.title,
    this.subTittle,
    this.redBtnText,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SuccessScreenViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        children: [
          if (shouldHaveAppBar == true)
            DefaultAppBar(
              title: Text(""),
            ),
          Expanded(
            child: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19.sp,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      subTittle == null ? '' : subTittle!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                          color: Colors.black45),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Lottie.asset(
                      'assets/images/success_lottie_n.json',
                      height: 350.0.h,
                      width: 350.0.w,
                    ),
                    Spacer(),
                    FilledBtn(
                      textColor: Colors.white,
                      onPressed: onTapped,
                      text: redBtnText!,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  SuccessScreenViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SuccessScreenViewModel();
}
