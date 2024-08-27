// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../views/log_in_screen.dart';

class OtpField extends StatefulWidget {
  const OtpField({Key? key}) : super(key: key);

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final TextEditingController _otp = TextEditingController();

  Future enterOtp() async {
    PhoneAuthCredential phoneAuthProvider = await PhoneAuthProvider.credential(
        verificationId: verifyId!, smsCode: _otp.text);
    if (phoneAuthProvider == null) {
      Get.snackbar('Empty', 'Enter OTP');
    }
    FirebaseAuth.instance.signInWithCredential(phoneAuthProvider);
  }

  Future listen() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  void initState() {
    listen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // PinFieldAutoFill(
              //   controller: _otp,
              //   codeLength: 6,
              //   onCodeSubmitted: (code) {},
              // ),
              TextField(
                controller: _otp,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  await enterOtp()
                      .then((value) => Get.snackbar('successful', ''));
                },
                child: Text('verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
