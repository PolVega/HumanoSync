import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preguntas Frecuentes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            // Pregunta 1
            ExpansionTile(
              title: const Text(
                '¿Cómo puedo crear una cuenta?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: const <Widget>[
                ListTile(
                  title: Text(
                      'Para crear una cuenta, haz clic en el botón de "Registrarse" en la pantalla de inicio y sigue las instrucciones.'),
                ),
              ],
            ),

            // Pregunta 2
            ExpansionTile(
              title: const Text(
                '¿Cómo puedo restablecer mi contraseña?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: const <Widget>[
                ListTile(
                  title: Text(
                      'Para restablecer tu contraseña, dirígete a la pantalla de inicio de sesión y selecciona "Olvidé mi contraseña".'),
                ),
              ],
            ),

            // Pregunta 3
            ExpansionTile(
              title: const Text(
                '¿Dónde puedo ver mis compras?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: const <Widget>[
                ListTile(
                  title: Text(
                      'Puedes ver tus compras en la sección "Mis Compras" en el menú de navegación.'),
                ),
              ],
            ),

            // Pregunta 4
            ExpansionTile(
              title: const Text(
                '¿Puedo cambiar la dirección de envío?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: const <Widget>[
                ListTile(
                  title: Text(
                      'Sí, puedes cambiar la dirección de envío en la sección "Configuración" de tu cuenta.'),
                ),
              ],
            ),

            // Pregunta 5
            ExpansionTile(
              title: const Text(
                '¿Cómo me comunico con el soporte?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              children: const <Widget>[
                ListTile(
                  title: Text(
                      'Puedes comunicarte con el soporte desde la sección "Contáctanos" en el menú de navegación.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
