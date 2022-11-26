import 'package:atelier/data/controllers/authentification_controller.dart';
import 'package:get/get.dart';
import '../controllers/catalogue_controller.dart';

class CatalogueBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetxCatalogueController(),
    );
  }
}
