import 'package:arm_test_1/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import '../../common/buttons/filled_btn.dart';
import '../../common/general_widget/app_scaffold.dart';
import '../../common/general_widget/validations.dart';
import '../../common/textfields/outline_form_field.dart';
import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  LoginView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Form(
      key: _formKey,
      child: AppScaffold(
        backgroundColor: Colors.white,
        isModelBusy: viewModel.isBusy,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/arm_logo.png",
                      width: 161.w,
                      height: 71.h,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: colorPrimary),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Center(
                    child: Text(
                      "Experience the best banking process from ARM MFB",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  OutlineFormField(
                      validator: Validation.validateString,
                      keyboardType: TextInputType.text,
                      hintText: "Enter your email",
                      label: "Email",
                      textEditingController: viewModel.emailController,
                      shouldReadOnly: false),
                  SizedBox(
                    height: 20.h,
                  ),
                  OutlineFormField(
                      validator: Validation.validateString,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "Enter your password",
                      label: "Password",
                      textEditingController: viewModel.passwordController,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            viewModel.obscurePassword();
                          },
                          child: Icon(
                            viewModel.isObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: labelColor,
                          )),
                      obscureText: viewModel.isObscure,
                      shouldReadOnly: false),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        // if (viewModel.emailController.text.isEmpty) {
                        //   viewModel.snackBarService.showCustomSnackBar(
                        //       message: "Enter username to reset password",
                        //       variant: SnackBarType.red);
                        // } else {
                        //   viewModel.navigationDataService.username =
                        //       viewModel.usernameController.text;
                        //   // viewModel.navigationService
                        //   //     .navigateToForgotPasswordView();
                        // }
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: secondaryColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Remember user',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: secondaryColor),
                      ),
                      SizedBox(
                        height: 30.sp,
                        width: 30.sp,
                        child: Checkbox(
                            value: viewModel.isChecked,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            activeColor: secondaryColor,
                            onChanged: (value) {
                              viewModel.updateIsChecked(value!);
                              // if (viewModel.isChecked == true) {
                              //   viewModel.appSecureStorage.saveRememberUser(
                              //       viewModel.usernameController.text);
                              // } else {
                              //   viewModel.appSecureStorage
                              //       .removeKey(AppConstants.rememberUser);
                              // }
                            }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: FilledBtn(
                          text: "Login to proceed",
                          onPressed: () {
                            // viewModel.navigationService.navigateToBottomNavigationView();
                            if (_formKey.currentState!.validate()) {
                              viewModel.loginUser(
                                  email: viewModel.emailController.text,
                                  password: viewModel.passwordController.text);
                            }
                          },
                          textColor: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      // if (Platform.isIOS) ...[
                      //   Expanded(
                      //       flex: 0,
                      //       child: InkWell(
                      //         onTap: () async {
                      //           // model.deviceHasBiometrics
                      //           //     ? model.checkUserBiometrics()
                      //           //     : showToast(
                      //           //     msg:
                      //           //     'No FaceId enabled o this device, kindly setup faceId and try again.',
                      //           //     context: context);
                      //         },
                      //         child: Image.asset(
                      //           "assets/images/icon_face_id.png",
                      //           height: 50.h,
                      //           width: 50.w,
                      //         ),
                      //       ))
                      // ] else ...[
                      //   Expanded(
                      //       flex: 0,
                      //       child: InkWell(
                      //         onTap: () {
                      //           model.deviceHasBiometrics
                      //               ? model.checkUserBiometrics()
                      //               : showToast(
                      //               msg:
                      //               'No Biometrics available for this device.',
                      //               context: context);
                      //         },
                      //         child: Image.asset(
                      //           "assets/images/icon_fingerprint.png",
                      //           height: 50.h,
                      //           width: 50.w,
                      //         ),
                      //       ))
                      // ]
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      viewModel.navigationService.navigateToSignupView();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 0.5.h,
                        ),
                        Text(
                          ' Create Account',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: colorPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.emailController.text = "aniekanephraim@gmail.com";
    viewModel.passwordController.text = "Ep1234";
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
