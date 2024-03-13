import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import '../../common/ui_helpers.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: labelColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, bottom: 30.0, left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, ${viewModel.userName}',
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Available balance',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    '₦ 5,000.00',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  children: [
                    GridItems(icon: Icons.history, text: 'Transaction History'),
                    GridItems(icon: Icons.send, text: 'Send Money'),
                    GridItems(icon: Icons.lightbulb, text: 'Electricity'),
                    GridItems(icon: Icons.money, text: 'Apply for Loans'),
                    GridItems(icon: Icons.money, text: 'Buy Airtime'),
                    GridItems(
                        icon: Icons.account_balance_wallet, text: 'cashout'),
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
  Future<void> onViewModelReady(HomeViewModel viewModel) async {
    super.onViewModelReady(viewModel);

   viewModel.getUserDetails();
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class GridItems extends StatelessWidget {
  IconData icon;
  String text;

  GridItems({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30.sp,
            color: colorPrimary,
          ),
          SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 14.0),
          )
        ],
      ),
    );
  }
}
