// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/common/common_text.dart';
import 'package:fruit_market_app/constant/color.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 79.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                    size: 22.h,
                  ),
                ),
                SizedBox(width: 30.w),
                Ts(
                    text: 'Total Bills : Rs 570',
                    size: 16.h,
                    weight: FontWeight.w500,
                    family: 'Poppins',
                    color: Colors.black),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Image(
                  height: 21.h,
                  width: 21.w,
                  image: AssetImage('assets/images/market.png'),
                ),
                SizedBox(width: 30.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ts(
                      text: 'Organic Fruit Shop',
                      size: 14.h,
                      family: 'Poppins',
                      weight: FontWeight.w500,
                    ),
                    Ts(
                      text: '2 Items : Delivery Time  30 Min',
                      size: 12.h,
                      color: Color(0xffA8A8A8),
                      family: 'Poppins',
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Image(
                  height: 21.h,
                  width: 21.w,
                  image: AssetImage('assets/images/phonepay.png'),
                ),
                SizedBox(width: 30.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ts(
                      text: 'Home Adress',
                      size: 14.h,
                      family: 'Poppins',
                      weight: FontWeight.w500,
                    ),
                    Ts(
                      textAlign: TextAlign.start,
                      text:
                          'D Block  Ram Nagar ,Near Sai Petrol Pump\n Ring Road Nagpur-440001',
                      size: 12.h,
                      color: Color(0xffA8A8A8),
                      family: 'Poppins',
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 17.h),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Ts(
                  text: 'Credit/Debit Cards',
                  size: 16.h,
                  color: Colors.black,
                ),
                Spacer(),
                Ts(
                  text: 'ADD NEW CARD',
                  size: 12.h,
                  color: AppColors.mainColor,
                  weight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Image(
                  height: 21.h,
                  width: 21.w,
                  image: AssetImage('assets/images/card.png'),
                ),
                SizedBox(width: 30.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ts(
                      text: '************4356',
                      size: 14.h,
                      family: 'Poppins',
                      color: Colors.grey,
                      weight: FontWeight.w500,
                    ),
                    Ts(
                      text: 'Manish Chutake',
                      size: 12.h,
                      color: Color(0xffA8A8A8),
                      family: 'Poppins',
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
            Divider(color: Colors.grey),
            SizedBox(height: 25.h),
            Align(
              alignment: Alignment.topLeft,
              child: Ts(
                text: 'Save and Pay via cards',
                size: 10.h,
                color: Colors.grey,
                weight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Image(
                  image: AssetImage('assets/images/master card.png'),
                ),
                SizedBox(width: 6.w),
                Image(
                  image: AssetImage('assets/images/master card.png'),
                ),
                SizedBox(width: 6.w),
                Image(
                  image: AssetImage('assets/images/visa.png'),
                ),
              ],
            ),
            SizedBox(height: 27.7.h),
            Align(
              alignment: Alignment.topLeft,
              child: Ts(
                text: 'Wallet Method',
                size: 16.h,
                family: 'Poppins',
                weight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 27.h),
            commonListTile(
                image: 'assets/images/phon pay.png', title: 'Phone Pay'),
            commonListTile(
                image: 'assets/images/Google-Pay-Logo-Icon-PNG-1024x1024.png',
                title: 'Google pay'),
            commonListTile(image: 'assets/images/paypal.png', title: 'Pay pal'),
          ],
        ),
      ),
    );
  }
}

Widget commonListTile({required String image, required String title}) {
  return ListTile(
    leading: Image(
      image: AssetImage(image),
    ),
    title: Text(title),
  );
}
