import 'package:atelier/data/controllers/authentification_controller.dart';
import 'package:get/get.dart';

class AuthentificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetxAuthentificationController(),
    );
  }
}
