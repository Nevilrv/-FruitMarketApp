// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/firebase.dart';
import 'details_screen.dart';
import 'organic_vegtable.dart';

class OrganicVegetables extends StatelessWidget {
  OrganicVegetables({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: collectionReference1
          .doc('data')
          .collection('Organic Vegetables')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Header(
                  name: 'Organic Vegetable',
                  detail: 'Pick up from organic farms',
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        snapshot.data!.docs.length,
                        (index) {
                          var data = snapshot.data?.docs[index];

                          return GestureDetector(
                            onTap: () {
                              Get.to(() => DetailsScreen(
                                    image: data!.get('image'),
                                    name: data.get('name'),
                                    price: data.get('price'),
                                  ));
                            },
                            child: FoodPageBody(
                              foodImage: '${data?.get('image')}',
                              foodName: '${data?.get('name')}',
                              foodPrice: data?.get('price'),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

class MixedVegetablesPack extends StatelessWidget {
  MixedVegetablesPack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: collectionReference1
          .doc('data')
          .collection('Mixed Vegetables Pack')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Header(
                  name: 'Mixed Vegetables Pack',
                  detail: 'Pick up from organic farms',
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...List.generate(
                        snapshot.data!.docs.length,
                        (index) {
                          var data = snapshot.data?.docs[index];

                          return GestureDetector(
                            onTap: () {
                              Get.to(() => DetailsScreen(
                                    image: data!.get('image'),
                                    name: data.get('name'),
                                    price: data.get('price'),
                                  ));
                            },
                            child: FoodPageBody(
                              foodImage: '${data?.get('image')}',
                              foodName: '${data?.get('name')}',
                              foodPrice: data?.get('price'),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

class AlliumVegetabels extends StatelessWidget {
  AlliumVegetabels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: collectionReference1
          .doc('data')
          .collection('Allium Vegetabels')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Header(
                  name: 'Allium Vegetabels',
                  detail: 'Fresh Allium Vegetables',
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        snapshot.data!.docs.length,
                        (index) {
                          var data = snapshot.data?.docs[index];

                          return GestureDetector(
                            onTap: () {
                              Get.to(() => DetailsScreen(
                                    image: data!.get('image'),
                                    name: data.get('name'),
                                    price: data.get('price'),
                                  ));
                            },
                            child: FoodPageBody(
                              foodImage: '${data?.get('image')}',
                              foodName: '${data?.get('name')}',
                              foodPrice: data?.get('price'),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

class RootVegetabels extends StatelessWidget {
  RootVegetabels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: collectionReference1
          .doc('data')
          .collection('Root Vegetabels')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Header(
                  name: 'Root Vegetabels',
                  detail: 'Fresh Root Vegetables',
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        snapshot.data!.docs.length,
                        (index) {
                          var data = snapshot.data?.docs[index];

                          return GestureDetector(
                            onTap: () {
                              Get.to(() => DetailsScreen(
                                    image: data!.get('image'),
                                    name: data.get('name'),
                                    price: data.get('price'),
                                  ));
                            },
                            child: FoodPageBody(
                              foodImage: '${data?.get('image')}',
                              foodName: '${data?.get('name')}',
                              foodPrice: data?.get('price'),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
