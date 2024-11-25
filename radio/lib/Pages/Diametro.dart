import 'package:flutter/material.dart';

class Diametro extends StatefulWidget {
  @override
  _DiameterScreenState createState() => _DiameterScreenState();
}

class _DiameterScreenState extends State<Diametro> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";

  void _calculateLength() {
    final diameter = double.tryParse(_controller.text);
    if (diameter == null || diameter <= 0) {
      setState(() {
        _result = "Por favor, ingrese un diámetro válido mayor a 0.";
      });
      return;
    }
    final length = 3.14159 * diameter;
    setState(() {
      _result = "La longitud de la circunferencia es: $length";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calcular con Diámetro')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el diámetro'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateLength,
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
