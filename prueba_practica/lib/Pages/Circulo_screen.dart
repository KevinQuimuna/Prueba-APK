import 'package:flutter/material.dart';

class CircleScreen extends StatefulWidget {
  @override
  _CircleScreenState createState() => _CircleScreenState();
}

class _CircleScreenState extends State<CircleScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _result = "";

  void _calculateCircumference(bool useDiameter) {
    final value = double.tryParse(_inputController.text);

    if (value == null || value <= 0) {
      setState(() {
        _result = "Por favor, ingrese un valor válido mayor a 0.";
      });
      return;
    }

    final radius = useDiameter ? value / 2 : value;
    final circumference = 2 * 3.14159 * radius;

    setState(() {
      _result = "La longitud de la circunferencia es: $circumference";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Circunferencia')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Ingrese el radio o diámetro'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculateCircumference(false),
                  child: Text('Usar Radio'),
                ),
                ElevatedButton(
                  onPressed: () => _calculateCircumference(true),
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
