import 'package:flutter/material.dart';
import 'Pages/radio_cilindro.dart';
import 'Pages/diametro_cilindro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/radio': (context) => RadioCilindro(),
        '/diameter': (context) => DiametroCilindro(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cálculo de Cilindro')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/radio'),
              child: Text('Calcular con Radio'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/diameter'),
              child: Text('Calcular con Diámetro'),
            ),
          ],
        ),
      ),
    );
  }
}
