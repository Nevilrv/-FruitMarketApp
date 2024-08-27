// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/views/admin_screen.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import '../common/common_text.dart';
import '../constant/color.dart';
import '../controller/tabcontroller.dart';
import 'dry_fruit.dart';
import 'fruit.dart';
import 'vegetable.dart';

class HomeScreen2 extends StatefulWidget {
  HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2>
    with SingleTickerProviderStateMixin {
  TextEditingController search = TextEditingController();
  TabsController tabsController = Get.put(TabsController());

  List<String> type = ['Vegetables', 'Fruits', 'Dry Fruits'];

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                margin: EdgeInsets.only(bottom: 20.h),
                height: 114.h,
                width: Get.width,
                color: AppColors.mainColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Ts(
                      text: 'Fruit Market',
                      size: 17.h,
                      color: Colors.white,
                      weight: FontWeight.w800,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(AdminScreen());
                      },
                      child: Icon(
                        Icons.notifications,
                        size: 18.h,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 20.h,
                right: 20.h,
                child: Material(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.h),
                  ),
                  child: TextField(
                    controller: search,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20.h,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.h),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8.h),
                      ),
                      filled: true,
                      hintText: 'Search',
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 28.h),
          SizedBox(
            height: 25.h,
            child: TabBar(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: (value) {
                tabsController.tabSelect(value);
              },
              padding: EdgeInsets.symmetric(horizontal: 33.w),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5.h),
                color: Color(0xffCC7D00),
              ),
              controller: tabController,
              tabs: List.generate(
                type.length,
                (index) => Obx(
                  () => Ts(
                    text: type[index],
                    weight: FontWeight.w500,
                    color: tabsController.selectTab.value == index
                        ? Colors.white
                        : AppColors.textColor,
                    size: 14.h,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 28.h),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      OrganicVegetables(),
                      MixedVegetablesPack(),
                      AlliumVegetabels(),
                      RootVegetabels(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      OrganicFruits(),
                      MixedFruitPack(),
                      StoneFruits(),
                      Melons(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      IndehiscentDryFruits(),
                      MixedDryFruitsPack(),
                      DehiscentDryFruits(),
                      KashmiriDryFruits(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
//
// IconButton(
// onPressed: () async {
// await googleSignOut()
// .then((value) => storage.remove('email'))
// .whenComplete(() => Get.offAll(() => LogInScreen()));
// },
// icon: Icon(Icons.login))
