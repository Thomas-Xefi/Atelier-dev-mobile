import 'package:get/get.dart';
import '../controllers/basket_controller.dart';

class BasketBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetxBasketController(),
    );
  }
}
