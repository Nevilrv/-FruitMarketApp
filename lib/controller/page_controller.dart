import 'package:get/get.dart';

class PagesController extends GetxController {
  RxInt selectPage = 0.obs;
  pageChange(value) {
    selectPage.value = value;
    update();
  }

  indicatorChange(index) {
    selectPage.value = index;
    update();
  }
}
