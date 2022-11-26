// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:atelier/data/controllers/authentification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<GetxAuthentificationController> {
  LoginPage({super.key});

  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Image(
                image: AssetImage('img/logo.png'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email*',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Entrer votre email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Il faut renseigner votre mail';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                  ),
                  Text(
                    'Mot de passe*',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Entrer votre mot de passe',
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Il faut renseigner votre mot de passe';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                value: isChecked,
                                onChanged: (bool? value) {
                                  isChecked = value!;
                                },
                              ),
                              Text('Rester connecté')
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            child: Text(
                              'Mot de passe oublié ?',
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Vous êtes connecté')),
                          );
                          controller.login();
                          Get.back();
                        }
                      },
                      child: const Text('Connexion'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
