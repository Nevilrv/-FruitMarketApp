// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/views/admin_screen.dart';
import 'package:fruit_market_app/views/bottom_navigation_screen.dart';
import 'package:fruit_market_app/views/details_screen.dart';
import 'package:fruit_market_app/views/home_screen_2.dart';
import 'package:fruit_market_app/views/log_in_screen.dart';
import 'package:fruit_market_app/views/my_account_screen.dart';
import 'package:fruit_market_app/views/onBoarding_screen.dart';
import 'package:fruit_market_app/views/payment_screen.dart';
import 'package:fruit_market_app/views/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'demo/number_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // home: PaymentScreen(),
          home: numberScreen(),
        );
      },
    );
  }
}
