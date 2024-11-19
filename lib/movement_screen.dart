import 'package:flutter/material.dart';
import 'package:humanosync_tf/services/movement_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/robot_service.dart';

class MovementsScreen extends StatefulWidget {
  final String robotId;
  final String robotToken;
  const MovementsScreen({super.key, required this.robotId,required this.robotToken});

  @override
  _MovementsScreenState createState() => _MovementsScreenState();
}

class _MovementsScreenState extends State<MovementsScreen> {
  final RobotService _robotService = RobotService();
  final MovementService _movementService = MovementService();
  List<dynamic> _movements = [];

  @override
  void initState() {
    super.initState();
    _fetchMovements();
  }

 Future<void> _fetchMovements() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token') ?? '';
  

  try {
    final movements = await _movementService.getMovements(token, widget.robotId);
    print('Movements fetched: $movements'); // Registro de depuración
    setState(() {
      _movements = movements;
    }); 
  } catch (e) {
    // Manejar errores de la solicitud
    setState(() {
      _movements = [];
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}


  // Función para ejecutar el movimiento
  Future<void> _executeMovement(String robotId,String movementId) async {
    
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    try {
      final result = await _robotService.executeMovement(token.toString(), widget.robotToken.toString(),movementId.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Movimiento ejecutado: $result')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error ejecutando el movimiento: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movimientos del Robot '),
      ),
      body:ListView.builder(
              itemCount: _movements.length,
              itemBuilder: (context, index) {
                final movement = _movements[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Movimiento: ${movement['name']}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () => _executeMovement(widget.robotId.toString(),movement['id'].toString()),
                            child: const Text('Ejecutar Movimiento'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
