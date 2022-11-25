import 'package:get/get.dart';

class GetxCatalogueController extends GetxController with StateMixin {
  Rx<int> quantity = 0.obs;
  Rx<String> selectedValue = ''.obs;
  List<String> tabImg = [
    'img/aston-martin-db.jpg',
    'img/bugatti-chiron-pur-sport.jpg',
    'img/Pagani_Huayra-NC.jpg',
    'img/skyline-gtr.jpg',
    'img/toyota-supra-mk4.jpg'
  ];

  @override
  void onInit() {
    change(null, status: RxStatus.loading());
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void addCart() {
    if (quantity.value < 10) {
      quantity.value++;
    }
  }

  void removeCart() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }
}
