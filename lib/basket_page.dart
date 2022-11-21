import 'dart:html';

import 'package:flutter/material.dart';


class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BuyMyCar", style: TextStyle(fontFamily: 'Poppins')),),
      body: Column(children: [
        const Padding(
    padding: EdgeInsets.all(16.0),
    child: Text('Panier (nombre)', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', fontSize: 20),),
  ),
        Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.car_crash),
              title: Text('Marque: ', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins',),),
              subtitle: Text('Modèle: ', style: TextStyle(fontFamily: 'Poppins'),),
            ),
            const Text('Prix: ', style: TextStyle(fontFamily: 'Poppins')),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: Icon(
  Icons.delete_outlined,
),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: Icon(
  Icons.remove_outlined,
),
                  onPressed: () {/* ... */},
                ),
                const Text('Qté'),
                TextButton(
                  child: Icon(
  Icons.add_outlined,
),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
      ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text("Procédé à l'achat"),
      ),
      );
  }
}