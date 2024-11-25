import 'package:flutter/material.dart';
import 'Pages/Circulo_screen.dart';
import 'Pages/Cilindro_screen.dart';
import 'Pages/Hipotenusa_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cálculos Matemáticos',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/circle': (context) => CircleScreen(),
        '/cylinder': (context) => CylinderScreen(),
        '/hypotenuse': (context) => HypotenuseScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cálculos Matemáticos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/circle'),
              child: Text('Longitud de Circunferencia'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/cylinder'),
              child: Text('Área y Volumen de Cilindro'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/hypotenuse'),
              child: Text('Hipotenusa de Triángulo'),
            ),
          ],
        ),
      ),
    );
  }
}
