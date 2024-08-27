import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/views/details_screen.dart';
import 'package:fruit_market_app/views/home_screen_2.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../common/common_button.dart';
import '../common/common_text.dart';
import '../common/common_textfield.dart';
import '../constant/color.dart';
import '../constant/firebase.dart';
import '../firebase_services/google_services.dart';
import 'bottom_navigation_screen.dart';
import 'otp_screen.dart';

String? verifyId;

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    controller!.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          controller!.reset();
          Get.to(() => OtpScreen(
                mobileNo: _number.text,
              ));
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  final TextEditingController _number = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future verifyNumber() async {
    firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+91' + _number.text,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        print('Done');
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: (String verificationId, int? forceResendingToken) {
        setState(() {
          verifyId = verificationId;
        });
      },
      verificationFailed: (FirebaseAuthException error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$error'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('=========================');
    // print(MediaQuery.of(context).size.width);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 119.h),
                Image.asset(
                  'assets/images/home.png',
                  height: 166.h,
                  width: 221.w,
                ),
                SizedBox(height: 11.h),
                Ts(
                  text: 'Fruit Market',
                  weight: FontWeight.w700,
                  color: AppColors.mainColor,
                  size: 44.h,
                ),
                SizedBox(height: 56.h),
                TsField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Mobile No';
                    }
                    if (value.toString().length < 10) {
                      return 'Enter 10 digit Number';
                    }
                  },
                  controller: _number,
                  hide: false,
                  prefix: CountryCodePicker(
                    onChanged: print,
                    initialSelection: 'IN',
                    favorite: ['+91', 'IN'],
                    showCountryOnly: false,
                    showFlag: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                  ),
                  labelText: 'Enter Number',
                ),
                SizedBox(height: 30.h),
                Button(
                  height: 52.h,
                  width: Get.width,
                  fontSize: 14.h,
                  buttonName: 'Send',
                  onTap: () {
                    showDoneDialog();
                  },
                  buttonColor: AppColors.mainColor,
                ),
                SizedBox(height: 40.h),
                Ts(
                  text: 'OR',
                  size: 14.h,
                ),
                SizedBox(height: 56.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          bool status = await googleServices();
                          if (status == true) {
                            storage.write('email', email);
                            await collectionReference
                                .doc(firebaseAuth.currentUser?.uid)
                                .set(
                                    {'email': email, 'name': '', 'address': ''})
                                .catchError(
                                  (e) => print('Error====>>>$e'),
                                )
                                .whenComplete(
                                  () => Get.offAll(
                                    () => BottomNavigationScreen(),
                                  ),
                                );
                          }
                        },
                        child: Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.h),
                            border: Border.all(color: AppColors.textColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/google.png',
                                height: 24.h,
                                width: 24.h,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Ts(
                                text: 'Log in with',
                                size: 12.h,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.h),
                            border: Border.all(color: AppColors.textColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/facebook.png',
                                height: 24.h,
                                width: 24.h,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Ts(
                                text: 'Log in with',
                                size: 12.h,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDoneDialog() {
    if (_formKey.currentState!.validate()) {
      verifyNumber();
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              Column(
                children: [
                  Lottie.network(
                    'https://assets8.lottiefiles.com/datafiles/Wv6eeBslW1APprw/data.json',
                    height: 150.h,
                    width: 150.h,
                    repeat: false,
                    controller: controller,
                    onLoaded: (p0) {
                      controller!.forward();
                    },
                  ),
                  Ts(
                    text: 'Verification Code Send on',
                    weight: FontWeight.w700,
                    size: 14.h,
                  ),
                  Ts(
                      text: 'your Registered Mobile Number ',
                      weight: FontWeight.w700,
                      size: 14.h),
                ],
              ),
            ],
          );
        },
      );
    } else {
      SizedBox();
    }
  }
}
