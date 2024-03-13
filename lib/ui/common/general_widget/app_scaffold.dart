import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import '../Loaders/circular_loader.dart';
import '../pops.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigation;
  final Color? backgroundColor;

  final bool? isModelBusy;
  final PreferredSizeWidget? appbar;
  final Widget? floatingActionButton;

  const AppScaffold({
    super.key,
    required this.body,
    this.bottomNavigation,
    this.isModelBusy,
    this.appbar,
    this.floatingActionButton,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(),
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: appbar,
        bottomNavigationBar: bottomNavigation,
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Stack(
            children: [
              body,
              if (isModelBusy == true) ...[Loader()]
            ],
          ),
        ),
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
