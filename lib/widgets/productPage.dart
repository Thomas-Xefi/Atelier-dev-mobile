import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class productPage extends StatelessWidget {
  const productPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        color: Colors.white,
        shadowColor: Colors.black,
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  'images/AudiA1.jpg',
                  fit: BoxFit.contain,
                  height: 340.0,
                  width: 340.0,
                ),
                const Text(
                  'AUDI A1',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const Text(
                  '2017',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Chip(
                    backgroundColor: Colors.black,
                    label: Text(
                      'Ajouter au panier',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
