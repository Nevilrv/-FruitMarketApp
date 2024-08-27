import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/color.dart';

AppBar commonAppBar({Widget? icon, required String name, IconData? preIcon}) {
  return AppBar(
    backgroundColor: AppColors.mainColor,
    toolbarHeight: 84.h,
    leading: icon,
    title: Text(name),
    actions: [Icon(preIcon)],
  );
}
