import 'package:flutter/material.dart';
import 'login_screen.dart'; // Asegúrate de importar la vista de Login
import 'home_screen.dart'; // Importa la vista de Home (si es necesario)
import 'configuracion_screen.dart'; // Importa la vista de Configuración si es necesario

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Aquí es donde configuramos la pantalla inicial como LoginScreen
      home: const LoginScreen(), // Asegúrate de que esta sea la pantalla inicial
    );
  }
}
