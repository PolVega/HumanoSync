import 'package:flutter/material.dart';

class ConfiguracionScreen extends StatefulWidget {
  const ConfiguracionScreen({super.key});

  @override
  _ConfiguracionScreenState createState() => _ConfiguracionScreenState();
}

class _ConfiguracionScreenState extends State<ConfiguracionScreen> {
  // Variable para controlar el modo nocturno
  bool _isDarkMode = false;

  // Variable para el tamaño de la fuente
  double _fontSize = 16;

  // Método para alternar el modo nocturno
  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  // Método para cambiar el tamaño de la fuente
  void _changeFontSize(double value) {
    setState(() {
      _fontSize = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Opción de Modo Nocturno
            SwitchListTile(
              title: const Text('Modo Nocturno'),
              subtitle: const Text('Activa o desactiva el modo oscuro'),
              value: _isDarkMode,
              onChanged: _toggleDarkMode,
            ),
            const Divider(),

            // Opción de Tamaño de Fuente
            const Text(
              'Accesibilidad',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Control deslizante para cambiar el tamaño de la fuente
            ListTile(
              title: const Text('Tamaño de la fuente'),
              subtitle: Text('Ajusta el tamaño de la fuente según tus necesidades'),
              trailing: SizedBox(
                width: 150, // Limitar el tamaño del Slider
                child: Slider(
                  value: _fontSize,
                  min: 12,
                  max: 30,
                  divisions: 18,
                  label: _fontSize.toStringAsFixed(0),
                  onChanged: (value) {
                    _changeFontSize(value);
                  },
                ),
              ),
            ),
            const Divider(),

            // Otras opciones de accesibilidad (si es necesario agregar más en el futuro)
            ListTile(
              title: const Text('Contraste alto'),
              subtitle: const Text('Mejora la visibilidad con alto contraste'),
              trailing: Icon(
                Icons.accessibility,
                color: Theme.of(context).iconTheme.color,
              ),
              onTap: () {
                // Agrega alguna acción para cambiar el contraste si es necesario
              },
            ),
            const Divider(),

            // Opcional: más configuraciones aquí
          ],
        ),
      ),
    );
  }
}
