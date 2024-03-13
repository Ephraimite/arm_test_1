import 'package:arm_test_1/ui/common/buttons/filled_btn.dart';
import 'package:arm_test_1/ui/common/general_widget/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return AppScaffold(
        isModelBusy: viewModel.isBusy,
        body: Center(
          child: SizedBox(
              width: 200,
              height: 100,
              child: FilledBtn(
                text: "Logout User",
                textColor: Colors.white,
                onPressed: () {
                  viewModel.signOut();
                },
              )),
        ));
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
