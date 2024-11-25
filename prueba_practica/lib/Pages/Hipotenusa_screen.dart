import 'package:flutter/material.dart';
import 'dart:math';

class HypotenuseScreen extends StatefulWidget {
  @override
  _HypotenuseScreenState createState() => _HypotenuseScreenState();
}

class _HypotenuseScreenState extends State<HypotenuseScreen> {
  final TextEditingController _catetoAController = TextEditingController();
  final TextEditingController _catetoBController = TextEditingController();
  String _result = "";

  void _calculateHypotenuse() {
    final catetoA = double.tryParse(_catetoAController.text);
    final catetoB = double.tryParse(_catetoBController.text);

    if (catetoA == null || catetoA <= 0 || catetoB == null || catetoB <= 0) {
      setState(() {
        _result = "Por favor, ingrese valores válidos mayores a 0.";
      });
      return;
    }

    final hypotenuse = sqrt(pow(catetoA, 2) + pow(catetoB, 2));

    setState(() {
      _result = "La longitud de la hipotenusa es: $hypotenuse";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hipotenusa')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _catetoAController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el primer cateto (a)'),
            ),
            TextField(
              controller: _catetoBController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el segundo cateto (b)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateHypotenuse,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}
