import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/common_text.dart';
import '../constant/color.dart';

class FoodPageBody extends StatelessWidget {
  final String foodImage;
  final String foodName;
  final dynamic foodPrice;

  const FoodPageBody({
    Key? key,
    required this.foodImage,
    required this.foodName,
    required this.foodPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 143.h,
          width: 118.w,
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(foodImage), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10.h),
            color: Colors.grey.shade300,
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(top: 5.h, right: 10.w),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 20.h,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Ts(
          text: foodName,
          size: 14.h,
          weight: FontWeight.w600,
        ),
        SizedBox(height: 5.h),
        Ts(
          text: '\₹ ${foodPrice} per / kg',
          size: 12.h,
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  final String name;
  final String detail;
  const Header({Key? key, required this.name, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 21.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Ts(
                text: name,
                weight: FontWeight.bold,
                size: 16.h,
              ),
              Ts(
                text: '(10% off)',
                weight: FontWeight.bold,
                size: 12.h,
                color: AppColors.mainColor,
              )
            ],
          ),
          SizedBox(height: 5.h),
          Ts(
            text: detail,
            size: 12.h,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
