import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TabsController extends GetxController {
  RxInt selectTab = 0.obs;
  tabSelect(value) {
    selectTab.value = value;
  }
}
