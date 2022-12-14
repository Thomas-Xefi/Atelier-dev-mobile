import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controllers/authentification_controller.dart';
import '../../data/controllers/catalogue_controller.dart';

class CataloguePageView extends GetView<GetxCatalogueController> {
  const CataloguePageView({super.key});

  get onChanged => null;

  @override
  Widget build(BuildContext context) {
    Get.put(GetxAuthentificationController());
    return Scaffold(
      appBar: AppBar(
        leading: const Image(
          image: AssetImage('img/logo.png'),
        ),
        leadingWidth: 100,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('/basket');
                    },
                    child: Obx(
                      () => Badge(
                        animationType: BadgeAnimationType.fade,
                        badgeContent: Text(controller.quantity.string),
                        position: BadgePosition.topEnd(top: -10, end: -6),
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ),
                GetBuilder<GetxAuthentificationController>(
                  init: GetxAuthentificationController(),
                  builder: ((controller) =>
                      controller.isConnected.value == false
                          ? InkWell(
                              onTap: () {
                                Get.toNamed('/login');
                              },
                              child: const Text(
                                'Connexion',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          : Row(
                              children: [
                                DropdownButton(
                                  onChanged: (String? newValue) {
                                    controller.selectedValue.value = newValue!;
                                  },
                                  hint: const Text(
                                    'Jean Moulin',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      value: "",
                                      child: InkWell(
                                        onTap: () {
                                          controller.logout();
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            Text("D??connexion"),
                                            Icon(
                                              Icons.exit_to_app,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        value: controller.selectedValue.value,
                        items: const [
                          DropdownMenuItem(
                            value: "",
                            child: Text("Cat??gorie"),
                          ),
                          DropdownMenuItem(
                            value: "v1",
                            child: Text("Cat??gorie 1"),
                          ),
                          DropdownMenuItem(
                            value: "v2",
                            child: Text("Cat??gorie 2"),
                          ),
                          DropdownMenuItem(
                            value: "v3",
                            child: Text("Cat??gorie 3"),
                          ),
                          DropdownMenuItem(
                            value: "v4",
                            child: Text("Cat??gorie 4"),
                          ),
                        ],
                        onChanged: (String? newValue) {
                          controller.selectedValue.value = newValue!;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Wrap(
                children: List.generate(
                  5,
                  (index) => SizedBox(
                    height: 120,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image(
                            width: 130,
                            image: AssetImage(
                              controller.tabImg[index],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                controller.tabNameImg[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '15???',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {
                                controller.addCart();
                              },
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
