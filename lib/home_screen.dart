import 'package:flutter/material.dart';
import 'package:humanosync_tf/configuracion_screen.dart';
import 'package:humanosync_tf/faq_screen.dart';
import 'package:humanosync_tf/quienes_somos_screen.dart';
import 'package:humanosync_tf/robot_screen.dart';
import 'login_screen.dart'; // Asegúrate de importar LoginScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('RepetiBot', style: TextStyle(color: Colors.white)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú Principal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen())
                ); // Cerrar el drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('Preguntas Frecuentes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FAQScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Quiénes Somos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuienesSomosScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.android),
              title: const Text('Ver Robot'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RobotListScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ConfiguracionScreen()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Cerrar Sesión'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child:  SingleChildScrollView( // Usamos SingleChildScrollView para hacer scroll si es necesario
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '¡Bienvenido a tu Espacio!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            // Lista de tarjetas con las actualizaciones del robot
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Card 1
                  Card(
                    color: Colors.blue,
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      leading: Image.asset(
                        'assets/update1.jpg', // Asegúrate de tener esta imagen en la carpeta assets
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: const Text(
                        'Actualización 1: Mejoras en la autonomía',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: const Text(
                        'Nuestro robot ahora puede operar durante 12 horas continuas gracias a una mejora en la batería.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  // Card 2
                  Card(
                    color: Colors.blue,
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      leading: Image.asset(
                        'assets/update2.jpg', // Asegúrate de tener esta imagen en la carpeta assets
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: const Text(
                        'Actualización 2: Reconocimiento facial',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                      subtitle: const Text(
                        'Ahora el robot puede reconocer y saludar a los usuarios de manera personalizada.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  // Card 3
                  Card(
                    color: Colors.blue,
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      leading: Image.asset(
                        'assets/update3.jpg', // Asegúrate de tener esta imagen en la carpeta assets
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: const Text(
                        'Actualización 3: Nueva interfaz de usuario',
                        style: TextStyle(fontWeight: FontWeight.bold
                        ,color: Colors.white),
                      ),
                      subtitle: const Text(
                        'La interfaz del robot ha sido rediseñada para ser más intuitiva y fácil de usar.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}


