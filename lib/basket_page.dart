import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  }

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
                      FloatingActionButton.small(onPressed: _decrementCounter, child: const Icon(Icons.remove, color: Colors.blue,), shape: RoundedRectangleBorder(), backgroundColor: Colors.white,),
                      Padding(padding: EdgeInsets.all(15), child: Text('$_counter', ),),
      FloatingActionButton.small(onPressed: _incrementCounter, child: const Icon(Icons.add, color: Colors.blue,), shape: RoundedRectangleBorder(), backgroundColor: Colors.white,),
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