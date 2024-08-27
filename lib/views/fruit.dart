import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../constant/firebase.dart';
import 'details_screen.dart';
import 'organic_vegtable.dart';

class OrganicFruits extends StatelessWidget {
  OrganicFruits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: collectionReference1
          .doc('data')
          .collection('Organic Fruits')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Header(
                  name: 'Organic Fruits',
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

class MixedFruitPack extends StatelessWidget {
  MixedFruitPack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: collectionReference1
          .doc('data')
          .collection('Mixed Fruit Pack')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Header(
                  name: 'Mixed Fruit Pack',
                  detail: 'Fruit mix fresh pack',
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

class StoneFruits extends StatelessWidget {
  StoneFruits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: collectionReference1
          .doc('data')
          .collection('Stone Fruits')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Header(
                  name: 'Stone Fruits',
                  detail: 'Fresh Stone Fruits',
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

class Melons extends StatelessWidget {
  Melons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: collectionReference1.doc('data').collection('Melons').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Header(
                  name: 'Melons',
                  detail: 'Fresh Melons Vegetables',
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
