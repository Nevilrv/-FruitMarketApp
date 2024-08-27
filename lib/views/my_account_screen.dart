// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/constant/color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/common_text.dart';
import '../firebase_services/google_services.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 275.h,
              width: Get.width,
              color: AppColors.mainColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                child: Column(
                  children: [
                    SizedBox(height: 67.h),
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                        radius: 50.h,
                        backgroundImage: image == null
                            ? NetworkImage(
                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
                            : NetworkImage(
                                '${FirebaseAuth.instance.currentUser!.photoURL!}')),
                    SizedBox(height: 10.h),
                    Ts(
                      text: name == null
                          ? 'Loading'
                          : '${FirebaseAuth.instance.currentUser!.displayName!}',
                      size: 16.h,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    Ts(
                      text: email == null
                          ? 'Loading'
                          : '${FirebaseAuth.instance.currentUser!.email!}',
                      size: 16.h,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 27.h),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.shop_two,
                color: AppColors.mainColor,
              ),
              title: Ts(
                text: 'My Orders',
                color: Colors.black,
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.3),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.favorite,
                color: AppColors.mainColor,
              ),
              title: Ts(
                text: 'Favourite',
                color: Colors.black,
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.3),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.settings,
                color: AppColors.mainColor,
              ),
              title: Ts(
                text: 'settings',
                color: Colors.black,
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.3),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.shopping_cart,
                color: AppColors.mainColor,
              ),
              title: Ts(
                text: 'My Cart',
                color: Colors.black,
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.3),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.rate_review_outlined,
                color: AppColors.mainColor,
              ),
              title: Ts(
                text: 'Rate Us',
                color: Colors.black,
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.3),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.share,
                color: AppColors.mainColor,
              ),
              title: Ts(
                text: 'Refer a Friends',
                color: Colors.black,
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.3),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.help,
                color: AppColors.mainColor,
              ),
              title: Ts(
                text: 'help',
                color: Colors.black,
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.3),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.login_outlined,
                color: AppColors.mainColor,
              ),
              title: Ts(
                text: 'log out',
                color: Colors.black,
              ),
            ),
            Divider(
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }
}
