import 'package:arm_test_1/app/app.router.dart';
import 'package:arm_test_1/ui/common/buttons/filled_btn.dart';
import 'package:arm_test_1/ui/common/general_widget/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/general_widget/validations.dart';
import '../../common/textfields/outline_form_field.dart';
import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
   SignupView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return Form(
      key: _formKey,
      child: AppScaffold(
        isModelBusy: viewModel.isBusy,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 50.h,
              ),
              Text(
                "Create Account",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Create an instant account within few seconds",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.black26),
              ),
              SizedBox(
                height: 50.h,
              ),
              OutlineFormField(
                  validator: Validation.validateString,
                  keyboardType: TextInputType.text,
                  hintText: "Enter your firstname",
                  label: "First name",
                  textEditingController: viewModel.firstNameController,
                  shouldReadOnly: false),
              SizedBox(
                height: 20.h,
              ),
              OutlineFormField(
                  validator: Validation.validateString,
                  keyboardType: TextInputType.text,
                  hintText: "Enter your last name",
                  label: "Last name",
                  textEditingController: viewModel.lastNameController,
                  shouldReadOnly: false),
              SizedBox(
                height: 20.h,
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
                height: 50.h,
              ),
              FilledBtn(
                text: "Create Account",
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    viewModel.signUpUser(viewModel.emailController.text, viewModel.passwordController.text);
                  }
                },
                textColor: Colors.white,
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  viewModel.navigationService.navigateToLoginView();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 0.5.h,
                    ),
                    Text(
                      ' Login',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: colorPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(SignupViewModel viewModel) {
    super.onViewModelReady(viewModel);
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
