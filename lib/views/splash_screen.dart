import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../common/common_text.dart';
import '../constant/firebase.dart';
import 'home_screen_2.dart';
import 'onBoarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  String? userData;
  @override
  void initState() {
    getData().whenComplete(
      () => timer = Timer(
        const Duration(seconds: 2),
        () {
          Get.offAll(
            () => userData == null ? OnBoardingScreen() : HomeScreen2(),
          );
        },
      ),
    );
    super.initState();
  }

  Future getData() async {
    var storeData = storage.read('email');
    setState(
      () {
        userData = storeData;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff69A03A),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 330.h),
            Ts(
              text: 'Fruit Market',
              color: Colors.white,
              family: 'Roboto',
              size: 44.h,
            ),
            const Spacer(),
            Image.asset(
              'assets/images/splash.png',
              width: Get.width,
              height: 250.h,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
