import 'package:flutter/material.dart';
import 'Pages/hipotenusa.dart';

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
        '/hypotenuse': (context) => Hypotenusa(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cálculo de Hipotenusa')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/hypotenuse'),
          child: Text('Calcular Hipotenusa'),
        ),
      ),
    );
  }
}
