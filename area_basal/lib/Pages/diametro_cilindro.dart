import 'package:flutter/material.dart';

class DiametroCilindro extends StatefulWidget {
  @override
  _DiameterCylinderScreenState createState() =>
      _DiameterCylinderScreenState();
}

class _DiameterCylinderScreenState extends State<DiametroCilindro> {
  final TextEditingController _diameterController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = "";

  void _calculate() {
    final diameter = double.tryParse(_diameterController.text);
    final height = double.tryParse(_heightController.text);

    if (diameter == null || diameter <= 0) {
      setState(() {
        _result = "Por favor, ingrese un diámetro válido mayor a 0.";
      });
      return;
    }
    if (height == null || height <= 0) {
      setState(() {
        _result = "Por favor, ingrese una altura válida mayor a 0.";
      });
      return;
    }

    final radio = diameter / 2;
    final areaBasal = 3.14159 * radio * radio;
    final volumen = areaBasal * height;

    setState(() {
      _result = "Área Basal: $areaBasal\nVolumen: $volumen";
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
              controller: _diameterController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Ingrese el diámetro'),
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
