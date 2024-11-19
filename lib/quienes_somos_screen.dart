import 'package:flutter/material.dart';

class QuienesSomosScreen extends StatelessWidget {
  const QuienesSomosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('¿Quiénes somos?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Título y pequeña introducción
            const Text(
              'HumanoSync - Startup de Ingeniería de Software',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            const Text(
              'Somos un grupo de estudiantes apasionados por la tecnología y la innovación. '
                  'En HumanoSync, nuestro objetivo es desarrollar productos que aprovechen las últimas '
                  'tecnologías para mejorar la vida de las personas y las empresas. Creemos en la creación '
                  'de soluciones tecnológicas prácticas, accesibles y que puedan generar un impacto real '
                  'en la sociedad.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),

            // Subtítulo: Misión
            const Text(
              'Misión',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8),

            const Text(
              'Nuestra misión es construir productos digitales que puedan transformar la forma '
                  'en que las personas interactúan con la tecnología, mejorando su calidad de vida y '
                  'facilitando el trabajo diario de las empresas. Nos enfocamos en crear soluciones '
                  'que estén a la vanguardia de la tecnología y sean fáciles de usar, siempre con un '
                  'enfoque centrado en el usuario.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),

            // Subtítulo: Visión
            const Text(
              'Visión',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8),

            const Text(
              'Aspiramos a convertirnos en una de las startups más innovadoras en el sector '
                  'de la ingeniería de software. Queremos que nuestros productos sean una referencia '
                  'en la industria por su calidad, utilidad y capacidad de adaptación a las necesidades '
                  'cambiantes del mercado. Nos esforzamos por ofrecer soluciones que realmente marquen '
                  'la diferencia, desde pequeños emprendimientos hasta grandes corporaciones.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),

            // Subtítulo: Valores
            const Text(
              'Valores',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8),

            const Text(
              '• Innovación: Siempre buscamos la manera de mejorar, de aprender y de crear algo nuevo.\n'
                  '• Compromiso: Nos comprometemos a ofrecer productos de alta calidad y que resuelvan '
                  'las necesidades reales de nuestros usuarios.\n'
                  '• Trabajo en equipo: Creemos que la colaboración es clave para el éxito, por lo que '
                  'trabajamos en conjunto para alcanzar nuestras metas.\n'
                  '• Ética: Nos guiamos por principios éticos en todas nuestras acciones, priorizando el '
                  'bienestar de nuestros usuarios y el respeto mutuo.',
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),

            // Agregar una pequeña conclusión o llamado a la acción
            const Text(
              'Únete a nosotros en este emocionante viaje de innovación y tecnología. Juntos, '
                  'podemos construir el futuro.',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Imagen representativa (opcional)
            Center(
              child: Image.asset(
                'assets/HumanoSync.png',  // Aquí puedes poner una imagen relacionada con la startup
                width: 250,
                height: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
