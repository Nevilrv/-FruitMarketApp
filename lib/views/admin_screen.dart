import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/views/home_screen_2.dart';

import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:image_picker/image_picker.dart';

import '../common/common_button.dart';
import '../common/common_text.dart';
import '../common/common_textfield.dart';
import '../constant/color.dart';
import '../constant/firebase.dart';
import '../constant/storage.dart';
import '../controller/drop_down_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminScreen extends StatefulWidget {
  AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  File? images;
  TextEditingController productName = TextEditingController();

  TextEditingController productDiscription = TextEditingController();

  TextEditingController productPrice = TextEditingController();

  TextEditingController productNutrition = TextEditingController();
  DropController dropController = Get.put(DropController());

  List<String> categories = [
    'Organic Vegetables',
    'Mixed Vegetables Pack',
    'Allium Vegetabels',
    'Root Vegetabels',
    'Organic Fruits',
    'Mixed Fruit Pack',
    'Stone Fruits',
    'Melons',
    'Indehiscent Dry Fruits',
    'Mixed Dry Fruits Pack',
    'Dehiscent Dry Fruits',
    'Kashmiri Dry Fruits'
  ];
  ImagePicker picker = ImagePicker();

  setImage() async {
    var pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      images = File(pickedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 56.h),
                GestureDetector(
                  onTap: () async {
                    await setImage();
                  },
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: 150.h,
                    width: 150.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.h),
                      color: AppColors.textColor.withAlpha(100),
                    ),
                    child: images == null
                        ? Center(
                            child: Icon(
                              Icons.add,
                              size: 25.h,
                            ),
                          )
                        : Image.file(
                            images!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SizedBox(height: 28.h),
                Container(
                  height: 55.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.h),
                    border: Border.all(
                      color: AppColors.textColor.withAlpha(100),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Obx(
                      () => DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: dropController.selectType.value,
                          items: categories
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Ts(
                                    text: e,
                                    size: 15.h,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            dropController.dropSelect(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                TsField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Product Name';
                    }
                  },
                  controller: productName,
                  hide: false,
                  labelText: 'Product Name',
                ),
                SizedBox(height: 11.h),
                TsField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Product Price';
                    }
                  },
                  controller: productPrice,
                  hide: false,
                  labelText: 'Product Price',
                ),
                SizedBox(height: 11.h),
                TsField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Discription';
                    }
                  },
                  controller: productDiscription,
                  hide: false,
                  labelText: 'Product Discription',
                ),
                SizedBox(height: 11.h),
                TsField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Nutrition';
                    }
                  },
                  controller: productNutrition,
                  hide: false,
                  labelText: 'Product Nutrition',
                ),
                SizedBox(height: 28.h),
                Button(
                  height: 56.h,
                  width: Get.width,
                  fontSize: 15.h,
                  buttonName: 'POST',
                  onTap: () {
                    postProduct();
                  },
                  buttonColor: AppColors.mainColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  postProduct() async {
    String? url =
        await uploadFile(images!, 'product_image_${Random().nextInt(1000)}');
    print(url);
    await collectionReference1
        .doc('data')
        .collection(dropController.selectType.value)
        .add({
      'image': url,
      'name': productName.text,
      'price': num.parse(productPrice.text),
      'discription': productDiscription.text,
      'nutritions': productNutrition.text,
      'isFavourite': false,
      'isAddCart': false
    });
    Get.to(HomeScreen2());
  }
}
