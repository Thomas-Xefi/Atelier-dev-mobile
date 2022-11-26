import 'package:get/get.dart';

class GetxBasketController extends GetxController with StateMixin {
  Rx<int> counter = 0.obs;

  void incrementCounter() {
    counter.value++;
  }

  void decrementCounter() {
    counter.value--;
  }
}
