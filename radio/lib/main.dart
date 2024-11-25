import 'package:flutter/material.dart';
import 'Pages/Radio.dart';
import 'Pages/Diametro.dart';

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
        '/radio': (context) => RadioScreen(),
        '/diameter': (context) => Diametro(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Longitud de Circunferencia')),
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
