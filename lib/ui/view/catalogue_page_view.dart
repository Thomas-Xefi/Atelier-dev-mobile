import 'package:atelier/catalogue_controller.dart';
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(8.0),
                  ),
                  onPressed: () => {},
                  child: const Text(
                    'Connexion',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
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
                    20,
                    (index) => SizedBox(
                      height: 120,
                      child: Card(
                        child: Row(
                          children: [
                            Row(
                              children: [
                                index < 5
                                    ? Image(
                                        width: 100,
                                        image: AssetImage(
                                          controller.tabImg[index],
                                        ),
                                      )
                                    : const Image(
                                        image: NetworkImage(
                                            'data:image/png;base64,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'),
                                      ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    Text(
                                      'Marque de la voiture',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '15€',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                              child: Center(
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
