import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../common/common_button.dart';
import '../common/common_text.dart';
import '../controller/page_controller.dart';
import 'log_in_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Map<String, dynamic>> pages = [
    {
      'name': 'E Shopping',
      'detail': 'Explore  top organic fruits & grab them',
      'image': 'assets/images/onBoarding1.png',
    },
    {
      'name': 'Delivery on the way',
      'detail': 'Get your order by speed delivery',
      'image': 'assets/images/onBoarding2.png',
    },
    {
      'name': 'Delivery Arrived',
      'detail': 'Order is arrived at your Place',
      'image': 'assets/images/onBoarding3.png',
    },
  ];

  PageController? _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  PagesController pagesController = Get.put(PagesController());

  @override
  Widget build(BuildContext context) {
    print('===>>>>Build Done');

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 86.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 29.h),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  // Get.off(LogInPage());
                },
                child: Ts(
                  text: 'Skip',
                  size: 14.h,
                  color: Color(0xff898989),
                ),
              ),
            ),
          ),
          SizedBox(
            width: Get.width,
            height: 420.h,
            child: PageView(
              controller: _pageController,
              physics: BouncingScrollPhysics(),
              onPageChanged: (value) {
                pagesController.pageChange(value);
              },
              children: List.generate(
                pages.length,
                (index) => Column(
                  children: [
                    SizedBox(
                      height: 79.h,
                    ),
                    Image.asset(
                      pages[index]['image'],
                      height: 210.h,
                      width: 185.w,
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                    Ts(
                      text: pages[index]['name'],
                      size: 20.h,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Ts(
                      text: pages[index]['detail'],
                      size: 15.h,
                      weight: FontWeight.w400,
                      color: Color(0xff78787C),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 45.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              pages.length,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: GestureDetector(
                  onTap: () {
                    pagesController.indicatorChange(index);
                  },
                  child: Obx(
                    () => Container(
                      height: 10.h,
                      width: 10.h,
                      decoration: BoxDecoration(
                        color: pagesController.selectPage.value == index
                            ? Color(0xff69A03A)
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: pagesController.selectPage.value == index
                              ? Colors.transparent
                              : Color(0xff69A03A),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 89.h,
          ),
          Obx(
            () => Button(
              height: 48.h,
              width: 246.w,
              buttonName: pagesController.selectPage.value == pages.length - 1
                  ? 'Get Started'
                  : 'Next',
              onTap: () {
                pagesController.selectPage.value == pages.length - 1
                    ? Get.off(
                        LogInScreen(),
                      )
                    : _pageController!.nextPage(
                        duration: Duration(milliseconds: 600),
                        curve: Curves.ease,
                      );
              },
              buttonColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
