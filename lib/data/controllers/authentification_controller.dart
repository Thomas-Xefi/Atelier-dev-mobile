import 'package:get/get.dart';

class GetxAuthentificationController extends GetxController with StateMixin {
  Rx<bool> isConnected = false.obs;
  Rx<String> selectedValue = ''.obs;

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void login() {
    isConnected.value = isConnected.isFalse;
    update();
  }

  void logout() {
    isConnected.value = isConnected.isFalse;
    update();
  }
}
