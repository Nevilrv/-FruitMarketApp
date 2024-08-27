// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/common/common_appbar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../common/common_text.dart';
import '../constant/color.dart';

class ShoppingCartScreen extends StatelessWidget {
  ShoppingCartScreen({Key? key}) : super(key: key);

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(name: 'Shopping Cart'),
      body: Column(
        children: [
          SizedBox(height: 40.h),
          StreamBuilder(
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 95.h,
                            width: 95.w,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '${snapshot.data?.docs[index]['image']}')),
                              borderRadius: BorderRadius.circular(15.h),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Ts(
                                text: 'Broccoli',
                                size: 14.h,
                                color: Colors.black,
                                weight: FontWeight.bold,
                              ),
                              Ts(
                                text: '190',
                                size: 14.h,
                                color: Colors.black,
                              ),
                              Ts(
                                text: '150 per/kg',
                                size: 14.h,
                                color: Colors.black,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 25.h,
                                    width: 25.w,
                                    child: Icon(
                                      Icons.remove,
                                      size: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(5.h),
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Text('0'),
                                  SizedBox(width: 5.w),
                                  Container(
                                    height: 25.h,
                                    width: 25.w,
                                    child: Icon(Icons.add, size: 15),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(5.h),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Ts(
                            text: 'Rs 40 Saved',
                            size: 14.h,
                            color: AppColors.mainColor,
                            weight: FontWeight.bold,
                          ),
                          Spacer(),
                          Icon(Icons.delete),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            stream: FirebaseFirestore.instance.collection('cart').snapshots(),
          )
        ],
      ),
    );
  }
}
