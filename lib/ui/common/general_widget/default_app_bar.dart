import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Text? title;
  final double? appBarHeight;
  final IconData? iconData;
  final Widget? actions;
  final Widget? leading;
  final bool? centerTittle;

  const DefaultAppBar(
      {super.key,
      this.title,
      this.iconData,
      this.actions,
      this.leading,
      this.appBarHeight,
      this.centerTittle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // systemOverlayStyle: const SystemUiOverlayStyle(
      //   statusBarColor: Colors.white,
      //   statusBarIconBrightness: Brightness.dark,
      //   statusBarBrightness: Brightness.dark,
      // ),
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      title: title,
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 4),
        child: leading ??
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_sharp),
            ),
      ),
      centerTitle: centerTittle ?? false,
      actions: [
        actions == null
            ? Container()
            : Padding(
                padding: EdgeInsets.only(top: 20.h, right: 10.w),
                child: actions!,
              ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? 60);
}

// class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final Text? title;
//   final IconData? iconData;
//   final Widget? actions;
//
//   DefaultAppBar({this.title, this.iconData, this.actions});
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//         systemOverlayStyle: SystemUiOverlayStyle.dark,
//         iconTheme: const IconThemeData(color: Colors.black),
//         titleTextStyle: TextStyle(
//           color: Colors.black,
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w400,
//         ),
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         title: title,
//         leading: Container(),
//         centerTitle: true,
//         actions: [
//           actions == null
//               ? Container()
//               : Padding(
//                   padding: EdgeInsets.only(top: 20.h, right: 10.w),
//                   child: actions!,
//                 )
//         ]);
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(70);
// }
