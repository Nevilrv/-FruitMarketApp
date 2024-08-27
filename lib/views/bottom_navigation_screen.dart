import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/views/favourite_screen.dart';
import 'package:fruit_market_app/views/my_account_screen.dart';
import 'package:fruit_market_app/views/shopping_cart_screen.dart';
import 'package:get/get.dart';

import '../common/common_text.dart';
import '../constant/color.dart';
import '../controller/bottom_controller.dart';
import 'home_screen_2.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Build done');
    BottomController bottomController = Get.put(BottomController());

    List bottomItem = [
      {'icon': Icons.home_outlined, 'name': 'Home'},
      {'icon': Icons.shopping_cart_outlined, 'name': 'Cart'},
      {'icon': Icons.favorite_border, 'name': 'Favourite'},
      {'icon': Icons.person_outline, 'name': 'Account'},
    ];
    List pages = [
      HomeScreen2(),
      ShoppingCartScreen(),
      FavouriteScreen(),
      MyAccountScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60.h,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 20.h,
              color: Colors.grey.shade400,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottomItem.length,
            (index) => GestureDetector(
              onTap: () {
                bottomController.selectItem(index);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Icon(
                      bottomItem[index]['icon'],
                      size: 25.h,
                      color: bottomController.selectedPage.value == index
                          ? AppColors.mainColor
                          : AppColors.textColor,
                    ),
                  ),
                  Obx(
                    () => Ts(
                      text: bottomItem[index]['name'],
                      size: 10.h,
                      weight: FontWeight.w700,
                      color: bottomController.selectedPage.value == index
                          ? AppColors.mainColor
                          : AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => pages[bottomController.selectedPage.value],
      ),
    );
  }
}
