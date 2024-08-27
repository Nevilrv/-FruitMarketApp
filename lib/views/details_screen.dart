// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/common/common_appbar.dart';
import 'package:fruit_market_app/common/common_text.dart';
import 'package:fruit_market_app/constant/color.dart';
import 'package:fruit_market_app/views/home_screen_2.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../firebase_services/google_services.dart';
import '../firebase_services/google_services.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(
      {Key? key, required this.name, required this.price, required this.image})
      : super(key: key);
  final String? name;
  final dynamic? price;
  final String? image;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        name: 'Details',
        icon: InkWell(
          onTap: () {
            Get.to(() => HomeScreen2());
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Container(
              height: 176.h,
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                image: DecorationImage(
                    image: NetworkImage('${widget.image}'), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10.h),
              ),
            ),
            SizedBox(height: 18.h),
            Ts(
                text: '${widget.name}',
                color: Colors.black,
                size: 18.sp,
                family: 'Poppins'),
            SizedBox(height: 8.h),
            Ts(
                text:
                    'Grapes will provide natural nutrients. The  Chemical in organic grapes which can be healthier hair andskin. It can be improve Your heart health. Protect yourbody from Cancer.',
                color: Color(0xff626262),
                size: 12.sp,
                family: 'Poppins'),
            SizedBox(height: 25.h),
            Ts(
                text: 'Nutrition',
                color: Colors.black,
                size: 18.sp,
                family: 'Poppins'),
            SizedBox(height: 25.h),
            Ts(
                text: 'Nutrition',
                color: Colors.black,
                size: 18.sp,
                family: 'Poppins'),
            SizedBox(height: 10.h),
            Row(
              children: [
                Ts(
                    text: '${widget.price}',
                    color: Colors.black,
                    size: 18.sp,
                    family: 'Poppins'),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('cart').add({
                      'image': widget.image,
                      'name': widget.name,
                      'price': widget.price,
                    });
                  },
                  height: 40.h,
                  minWidth: 148.w,
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: AppColors.mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
