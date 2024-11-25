import 'package:flutter/material.dart';

class RadioScreen extends StatefulWidget {
  @override
  _RadioScreenState createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";

  void _calculateLength() {
    final radio = double.tryParse(_controller.text);
    if (radio == null || radio <= 0) {
      setState(() {
        _result = "Por favor, ingrese un radio válido mayor a 0.";
      });
      return;
    }
    final length = 2 * 3.14159 * radio;
    setState(() {
      _result = "La longitud de la circunferencia es: $length";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calcular con Radio')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el radio'),
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
