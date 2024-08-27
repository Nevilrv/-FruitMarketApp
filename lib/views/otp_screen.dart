// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/common_button.dart';
import '../common/common_text.dart';
import '../common/common_textfield.dart';
import '../constant/color.dart';
import '../constant/firebase.dart';
import 'log_in_screen.dart';
import 'name_address_screen.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key, required this.mobileNo}) : super(key: key);

  final String mobileNo;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otp = TextEditingController();
  Future enterOtp() async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verifyId!, smsCode: otp.text);
    if (phoneAuthCredential == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("enter valid OTP"),
        ),
      );
    } else {
      storage.write(
        'email',
        otp.text,
      );
      await collectionReference
          .doc(firebaseAuth.currentUser?.uid)
          .set({'number': widget.mobileNo, 'address': '', 'name': ''})
          .catchError(
            (e) => print('Error====>>>$e'),
          )
          .whenComplete(
            () => Get.offAll(
              () => NameAddress(),
            ),
          );
      Get.offAll(() => NameAddress());
    }
    firebaseAuth.signInWithCredential(phoneAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(height: 86.h),
              Ts(
                text: 'Enter The 6 digit code that was ',
                size: 14.h,
                weight: FontWeight.w700,
              ),
              Ts(
                text: 'send to your Mobile Number ',
                weight: FontWeight.w700,
                size: 14.h,
              ),
              SizedBox(height: 28.h),
              TsField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter OTP';
                  } else if (value!.length < 6) {
                    return 'Enter 6 digit OTP';
                  }
                },
                controller: otp,
                length: 6,
                keyboardType: TextInputType.number,
                align: TextAlign.center,
                hide: false,
                labelText: '',
              ),
              SizedBox(height: 30.h),
              Button(
                height: 52.h,
                width: Get.width,
                fontSize: 14.h,
                buttonName: 'Verify',
                onTap: () async {
                  await enterOtp();
                },
                buttonColor: AppColors.mainColor,
              ),
              SizedBox(height: 11.h),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Ts(
                    text: 'Resend OTP',
                    color: Colors.blue,
                    size: 10.h,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
