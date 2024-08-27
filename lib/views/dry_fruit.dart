import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constant/firebase.dart';
import 'details_screen.dart';
import 'organic_vegtable.dart';

class IndehiscentDryFruits extends StatelessWidget {
  IndehiscentDryFruits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: collectionReference1
          .doc('data')
          .collection('Indehiscent Dry Fruits')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Header(
                  name: 'Indehiscent Dry Fruits',
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

class MixedDryFruitsPack extends StatelessWidget {
  // MixedVegetablesPack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: collectionReference1
          .doc('data')
          .collection('Mixed Dry Fruits Pack')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Header(
                  name: 'Mixed Dry Fruits Pack',
                  detail: 'Dry Fruits mix fresh pack',
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

class DehiscentDryFruits extends StatelessWidget {
  DehiscentDryFruits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: collectionReference1
          .doc('data')
          .collection('Dehiscent Dry Fruits')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Header(
                  name: 'Dehiscent Dry Fruits',
                  detail: 'Fresh Dehiscent Dry Fruits',
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

class KashmiriDryFruits extends StatelessWidget {
  KashmiriDryFruits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: collectionReference1
          .doc('data')
          .collection('Kashmiri Dry Fruits')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Header(
                  name: 'Kashmiri Dry Fruits',
                  detail: 'Fresh Kashmiri Dry Fruits',
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
