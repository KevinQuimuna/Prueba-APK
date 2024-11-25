import 'package:flutter/material.dart';

class RadioCilindro extends StatefulWidget {
  @override
  _RadioCylinderScreenState createState() => _RadioCylinderScreenState();
}

class _RadioCylinderScreenState extends State<RadioCilindro> {
  final TextEditingController _radioController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = "";

  void _calculate() {
    final radio = double.tryParse(_radioController.text);
    final height = double.tryParse(_heightController.text);

    if (radio == null || radio <= 0) {
      setState(() {
        _result = "Por favor, ingrese un radio válido mayor a 0.";
      });
      return;
    }
    if (height == null || height <= 0) {
      setState(() {
        _result = "Por favor, ingrese una altura válida mayor a 0.";
      });
      return;
    }

    final areaBasal = 3.14159 * radio * radio;
    final volumen = areaBasal * height;

    setState(() {
      _result = "Área Basal: $areaBasal\nVolumen: $volumen";
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
              controller: _radioController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el radio'),
            ),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese la altura'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
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
