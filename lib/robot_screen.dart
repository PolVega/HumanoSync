import 'dart:ffi';

import 'package:flutter/material.dart';
import '../services/robot_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'movement_screen.dart';

class RobotListScreen extends StatefulWidget {
  const RobotListScreen({super.key});

  @override
  _RobotListScreenState createState() => _RobotListScreenState();
}

class _RobotListScreenState extends State<RobotListScreen> {
  final RobotService _robotService = RobotService();
  List<dynamic> _robots = [];

  @override
  void initState() {
    super.initState();
    _fetchRobots();
  }

  Future<void> _fetchRobots() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    try {
      final robots = await _robotService.getRobots(token);
      setState(() {
        _robots = robots;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  // Función para guardar el token del robot y navegar
  Future<void> _viewDetails(String robotId, String robotToken) async {

    // Redirigir a la nueva pantalla de movimientos
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovementsScreen(robotId: robotId,robotToken: robotToken),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Robots'),
      ),
      body: _robots.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _robots.length,
              itemBuilder: (context, index) {
                final robot = _robots[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: Card(
                    color: Colors.blue,
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
                            robot['botname'] ?? 'Robot sin nombre',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'ID: ${robot['id']}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Estado: ${robot['is_connected_broker'] ?? 'Desconocido'}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _viewDetails(robot['id'].toString(),robot['token'].toString());
                                },
                                child: const Text('Ver detalles'),
                              ),
                            ],
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
