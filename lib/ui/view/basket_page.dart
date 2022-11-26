import 'package:atelier/data/controllers/authentification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controllers/basket_controller.dart';

class BasketPage extends GetView<GetxBasketController> {
  const BasketPage({super.key});

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<GetxAuthentificationController>(
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
                                          if (Get.currentRoute == '/basket') {
                                            Navigator.pop(context);
                                            Get.toNamed('/catalogue');
                                          }
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
                            )),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Panier (nombre)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 20),
              ),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ListTile(
                    leading: Icon(Icons.car_crash),
                    title: Text(
                      'Marque: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    subtitle: Text(
                      'Modèle: ',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                  ),
                  const Text('Prix: ', style: TextStyle(fontFamily: 'Poppins')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Icon(
                          Icons.delete_outlined,
                        ),
                        onPressed: () {/* ... */},
                      ),
                      FloatingActionButton.small(
                        heroTag: null,
                        onPressed: () {
                          controller.decrementCounter();
                        },
                        shape: const RoundedRectangleBorder(),
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.blue,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          controller.counter.string,
                        ),
                      ),
                      FloatingActionButton.small(
                        heroTag: null,
                        onPressed: () {
                          controller.incrementCounter();
                        },
                        shape: const RoundedRectangleBorder(),
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: null,
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text("Procédé à l'achat"),
      ),
    );
  }
}
