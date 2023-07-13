import 'package:api_default_project/sliver/widgets/gred_view_items.dart';
import 'package:api_default_project/sliver/widgets/header_view_item.dart';
import 'package:api_default_project/sliver/widgets/list_view_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../utils/images.dart';

class SliverScreen extends StatefulWidget {
  const SliverScreen({super.key});

  @override
  State<SliverScreen> createState() => _SliverScreenState();
}

class _SliverScreenState extends State<SliverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF111015),
        toolbarHeight: 20.h,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Привет, Максим",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Row(
                          children: [
                            ZoomTapAnimation(
                                child:
                                    SvgPicture.asset('assets/svg/search.svg')),
                            SizedBox(
                              width: 12.w,
                            ),
                            Image.asset(
                              AppImages.profileImg,
                              width: 36.w,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 8.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        gradient: LinearGradient(
                          begin: Alignment.center,
                          colors: [Color(0xFFE1D24A), Color(0xFFC69233)],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ваши любимые товары",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "Посмотреть все",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Color(0xFFEDB216)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 7.w),
                height: 114.h,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    ListItem(
                        title: "Чикен Бургер",
                        img: AppImages.chickenBurger1,
                        subtitle:
                            "Котлета куриная, свежие\nовощи, сыр чеддер, \nсоус для бургера",
                        price: "₽160",
                        gram: "290g"),
                    ListItem(
                        title: "Блэк Бургер",
                        img: AppImages.blackBurger,
                        subtitle:
                            "Котлета свино-говяжья,\nсвежие овощи, сыр чеддер,\nсоус для бургера",
                        price: "₽190",
                        gram: "330g"),
                    ListItem(
                        title: "Дабл Бургер",
                        img: AppImages.chickenBurger3,
                        subtitle:
                            "Булка с кунжутом тройная, \n2 котлеты с солью и \nперцем, лист..",
                        price: "₽230",
                        gram: "300g"),
                    ListItem(
                        title: "BBQ Бургер",
                        img: AppImages.chickenBurger1,
                        subtitle:
                            "Котлета свино-говяжья,\nсоленый огурец, свежие \nовощи, бекон, сыр чед..",
                        price: "₽190",
                        gram: "330g"),
                    ListItem(
                        title: "Шеф Бургер",
                        img: AppImages.chickenBurger1,
                        subtitle:
                            "Котлета мраморной\nговядины, свежие овощи,\nсыр чеддер, соус для бу..",
                        price: "₽220",
                        gram: "310g"),
                  ],
                ),
              )
            ]),
          ),
          SliverPadding(
              padding: const EdgeInsets.all(0),
              sliver: SliverPersistentHeader(
                delegate: HeaderViewItem(),
                pinned: true,
              )),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 20.h,
                childAspectRatio: 0.69.h),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GridViewItem(
                    title: title[index],
                    img: imagePath[index],
                    subtitle: subtitles[index],
                    price: price[index],
                    gram: gram[index]);
              },
              childCount: 5,
            ),
          )
        ],
      ),
    );
  }

  List<String> title = [
    "Чикен Бургер",
    "Блэк Бургер",
    "Дабл Бургер",
    "BBQ Бургер",
    "Шеф Бургер",
  ];
  List<String> imagePath = [
    AppImages.chickenBurger1,
    AppImages.blackBurger,
    AppImages.blackBurger,
    AppImages.chickenBurger3,
    AppImages.chickenBurger4,
  ];
  List<String> subtitles = [
    "Котлета куриная, свежие \nовощи, сыр чеддер, соус \nдля бургера",
    "Котлета свино-говяжья,\nсвежие овощи, сыр чеддер,\nсоус для бургера",
    "Булка с кунжутом тройная, \n2 котлеты с \nсолью и перцем, лист..",
    "Котлета свино-говяжья,\nсоленый огурец, свежие \nовощи, бекон, сыр чед..",
    "Котлета мраморной\nговядины, свежие овощи,\nсыр чеддер, соус для бу..",
  ];
  List<String> price = [
    "₽160",
    "₽190",
    "₽230",
    "₽190",
    "₽220",
  ];
  List<String> gram = [
    "300g",
    "330g",
    "300g",
    "330g",
    "310g",
  ];
}
