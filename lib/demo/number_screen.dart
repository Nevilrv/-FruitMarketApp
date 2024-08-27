// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'otpfield.dart';

String? verifyId;

class numberScreen extends StatefulWidget {
  const numberScreen({Key? key}) : super(key: key);

  @override
  State<numberScreen> createState() => _numberScreenState();
}

class _numberScreenState extends State<numberScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  Future sendOtp() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91' + phoneNumberController.text,
      codeSent: (String verificationId, int? forceResendingToken) {
        setState(() {
          verifyId = verificationId;
        });
      },
      verificationFailed: (FirebaseAuthException error) {
        Get.snackbar('Failed', '$error');
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
        print('Done');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Enter the your Number',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                hintText: 'phone Number',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              final signature = await SmsAutoFill().getAppSignature;
              print('${signature}');
              await sendOtp().whenComplete(
                () => Get.to(
                  () => OtpField(),
                ),
              );
            },
            child: Text('Send otp'),
          ),
        ],
      ),
    );
  }
}
