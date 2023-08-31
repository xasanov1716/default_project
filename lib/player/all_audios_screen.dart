import 'package:api_default_project/player/player_screen.dart';
import 'package:api_default_project/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../utils/colors.dart';
import '../utils/images.dart';
import '../utils/musics.dart';

class AllAudios extends StatefulWidget {
  const AllAudios({super.key});

  @override
  State<AllAudios> createState() => _AllAudiosState();
}

class _AllAudiosState extends State<AllAudios> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        // systemOverlayStyle:
        // const SystemUiOverlayStyle(statusBarColor: AppColors.c_091227),
        title: Text(
          "Music List",
          style: Theme
              .of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: musics.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return ZoomTapAnimation(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (
                          context) =>
                          PlayerScreen(name: names,
                              music: musics,
                              image: images,
                              index: index)));
                    },
                    child: Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.asset(
                              images[index],
                              height: 160.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          12.ph,
                          Text(
                            musicName[index],
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.c_EAF0FF),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          6.ph,
                          Text(
                            names[index],
                            style: Theme
                                .of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String> musics = [
    AppMusics.bah,
    AppMusics.cocaine,
    AppMusics.fresh,
    AppMusics.lunnayaSonata,
    AppMusics.mertvo,
    AppMusics.nazi,
    AppMusics.susana,
    AppMusics.vput,
    AppMusics.sway,
    AppMusics.trek,
    AppMusics.vdx,
    AppMusics.tchk
  ];
  List<String> musicName = [
    "Бах",
    "Cocaine",
    "Фрєш",
    "Лунная соната ",
    "Мертвое сердце",
    "Wir Sind Des Geyers Schwarzer Haufen",
    "Tom's Diner",
    "В путь",
    "Sway",
    "Трек Салатовый",
    "Вдохновение",
    "ТЧК",
  ];

  List<String> names = [
    "УННВ",
    "Lariste",
    "УННВ",
    "УННВ",
    "УННВ",
    "Botho Lukas Chor",
    "Suzzane",
    "УННВ",
    "Michael Bublé",
    "УННВ",
    "УННВ",
    "УННВ",
  ];

  List<String> images = [
    AppImages.bah,
    AppImages.cocaine,
    AppImages.vdx,
    AppImages.lunnayaSonata,
    AppImages.mertvo,
    AppImages.nazi,
    AppImages.suzanne,
    AppImages.bah,
    AppImages.sway,
    AppImages.mertvo,
    AppImages.vdx,
    AppImages.tchk,
  ];
}
