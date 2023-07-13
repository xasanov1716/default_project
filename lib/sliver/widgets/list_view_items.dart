import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/colors.dart';
import '../../../utils/icons.dart';


class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.title, required this.img, required this.subtitle, required this.price, required this.gram});
  final String title;
  final String img;
  final String subtitle;
  final String price;
  final String gram;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      width: 300.w,
      height: 114.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.C_22222A,
      ),
      child: Stack(
        children: [Row(
          children: [
            Image.asset(
              img,
              width: 87.w,
            ),
            SizedBox(width: 12.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.white),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  children: [
                    Text(price,style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(width: 52.w,),
                    Container(
                      width: 38.w,
                      height: 18.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.C_16151B
                      ),
                      child: Center(child: Text(gram,style: Theme.of(context).textTheme.labelSmall,)),
                    )
                  ],
                )
              ],
            )
          ],
        ),Positioned(right: 10,
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 5.h),
            child: Container(
              height: 100.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LikeButton(),
                  ZoomTapAnimation(
                    child: Stack(alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.ellipse),
                        SvgPicture.asset(AppIcons.shop,),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )],
      ),
    );
  }
}
