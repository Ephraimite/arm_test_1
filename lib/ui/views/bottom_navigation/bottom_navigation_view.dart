import 'package:animations/animations.dart';
import 'package:arm_test_1/ui/views/chat/chat_view.dart';
import 'package:arm_test_1/ui/views/profile/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import '../home/home_view.dart';
import 'bottom_navigation_viewmodel.dart';

class BottomNavigationView extends StackedView<BottomNavigationViewModel> {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BottomNavigationViewModel viewModel,
    Widget? child,
  ) {
    final bottomNavigationScreens = [
      HomeView(),
      ChatView(),
      ProfileView(),
    ];

    void _onItemTap(int index) {
      viewModel.updateCurrentIndex(index);
    }

    return Scaffold(
      body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 100),
          transitionBuilder: (Widget child, Animation<double> primaryAnimation,
                  Animation<double> secondaryAnimation) =>
              FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              ),
          child: bottomNavigationScreens[viewModel.currentIndex]),
      bottomNavigationBar: SizedBox(
        height: 85.h,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: viewModel.currentIndex,
          onTap: _onItemTap,
          elevation: 16,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_text),
              label: 'Group Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Profile',
            ),
          ],
          selectedItemColor: colorPrimary,
          backgroundColor: naturalGrey10,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }

  @override
  BottomNavigationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      BottomNavigationViewModel();
}
