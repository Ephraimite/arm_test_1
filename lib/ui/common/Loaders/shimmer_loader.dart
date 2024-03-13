import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../app_colors.dart';

shimmerCard(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: lightGrey,
    highlightColor: lightGrey.withOpacity(0.1),
    child: Center(
      child: SizedBox(
        // height: MediaQuery.of(context).size.height / 2.2,
        width: double.infinity,
        // padding: EdgeInsets.symmetric(vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40.0.r)),
          ),
          child: Column(
            children: [Container()],
          ),
        ),
      ),
    ),
  );
}
