import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/colors.dart';

class GetZoomTapItem extends StatelessWidget {
  const GetZoomTapItem({super.key, required this.title, required this.img});
  final String title;
  final String img;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      child: Container(
        margin:EdgeInsets.symmetric(horizontal: 5.w),
        padding: const EdgeInsets.all(6),
        height: 20.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.C_22222A
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(img,width: 16.w,),
            SizedBox(width: 6.w,),
            Text(title,style: Theme.of(context).textTheme.labelMedium,),
          ],
        ),
      ),
    );
  }
}
