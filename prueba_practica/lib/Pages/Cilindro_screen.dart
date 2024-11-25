import 'package:flutter/material.dart';

class CylinderScreen extends StatefulWidget {
  @override
  _CylinderScreenState createState() => _CylinderScreenState();
}

class _CylinderScreenState extends State<CylinderScreen> {
  final TextEditingController _input1Controller = TextEditingController();
  final TextEditingController _input2Controller = TextEditingController();
  String _result = "";

  void _calculateCylinder(bool useDiameter) {
    final value = double.tryParse(_input1Controller.text);
    final height = double.tryParse(_input2Controller.text);

    if (value == null || value <= 0 || height == null || height <= 0) {
      setState(() {
        _result = "Por favor, ingrese valores válidos mayores a 0.";
      });
      return;
    }

    final radius = useDiameter ? value / 2 : value;
    final area = 3.14159 * radius * radius;
    final volume = area * height;

    setState(() {
      _result = "Área Basal: $area\nVolumen: $volume";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cilindro')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _input1Controller,
              keyboardType: TextInputType.number,
              decoration:
              InputDecoration(labelText: 'Ingrese el radio o diámetro'),
            ),
            TextField(
              controller: _input2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese la altura'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculateCylinder(false),
                  child: Text('Usar Radio'),
                ),
                ElevatedButton(
                  onPressed: () => _calculateCylinder(true),
                  child: Text('Usar Diámetro'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(_result),
          ],
        ),
      ),
    );
  }
}
