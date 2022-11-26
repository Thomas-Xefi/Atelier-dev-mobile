import 'package:atelier/catalogue_controller.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CataloguePageView extends GetView<GetxCatalogueController> {
  const CataloguePageView({super.key});

  get onChanged => null;

  @override
  Widget build(BuildContext context) {
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
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Badge(
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
                  controller.isConnected.isFalse
                      ? InkWell(
                          onTap: () {
                            controller.isConnected.value =
                                controller.isConnected.isFalse;
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
                                      controller.isConnected.value =
                                          controller.isConnected.isFalse;
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Text("Déconnexion"),
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
                        ),
                ],
              ),
            ),
          )
        ],
      ),
      body: controller.obx(
        (state) => Center(
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
                              child: Text("Catégorie"),
                            ),
                            DropdownMenuItem(
                              value: "v1",
                              child: Text("Catégorie 1"),
                            ),
                            DropdownMenuItem(
                              value: "v2",
                              child: Text("Catégorie 2"),
                            ),
                            DropdownMenuItem(
                              value: "v3",
                              child: Text("Catégorie 3"),
                            ),
                            DropdownMenuItem(
                              value: "v4",
                              child: Text("Catégorie 4"),
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
                                  '15€',
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
      ),
    );
  }
}
