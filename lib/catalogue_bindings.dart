import 'package:atelier/catalogue_controller.dart';
import 'package:get/get.dart';

class CatalogueBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetxCatalogueController(),
    );
  }
}
