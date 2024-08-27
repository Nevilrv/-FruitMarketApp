import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BottomController extends GetxController {
  RxInt selectedPage = 0.obs;

  selectItem(index) {
    selectedPage.value = index;
    update();
  }
}
