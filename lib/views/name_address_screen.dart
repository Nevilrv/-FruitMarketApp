import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/utils.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/common_button.dart';
import '../common/common_text.dart';
import '../common/common_textfield.dart';
import '../constant/color.dart';
import '../constant/firebase.dart';
import 'home_screen_2.dart';

class NameAddress extends StatelessWidget {
  NameAddress({Key? key}) : super(key: key);

  TextEditingController userName = TextEditingController();
  TextEditingController userAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 86.h),
            Ts(
              text: 'Enter Your Name',
              family: 'Roboto',
              size: 16.h,
              weight: FontWeight.w600,
            ),
            SizedBox(height: 16.h),
            TsField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter  Your Name';
                }
              },
              controller: userName,
              hide: false,
              labelText: 'Name',
            ),
            SizedBox(height: 30.h),
            Ts(
              text: 'Add Address',
              family: 'Roboto',
              size: 16.h,
              weight: FontWeight.w600,
            ),
            SizedBox(height: 16.h),
            TsField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter  Your Address';
                }
              },
              controller: userAddress,
              hide: false,
              labelText: 'Address',
            ),
            SizedBox(height: 56.h),
            Button(
              height: 52.h,
              width: Get.width,
              fontSize: 14.h,
              buttonName: 'Verify',
              onTap: () async {
                await collectionReference
                    .doc(firebaseAuth.currentUser?.uid)
                    .update(
                        {'address': userAddress.text, 'name': userName.text})
                    .catchError(
                      (e) => print('Error====>>>$e'),
                    )
                    .whenComplete(() => Get.offAll(() => HomeScreen2()));
              },
              buttonColor: AppColors.mainColor,
            )
          ],
        ),
      ),
    );
  }
}
