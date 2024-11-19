import 'dart:convert';
import 'package:http/http.dart' as http;

class RobotService {
  final String baseUrl = 'https://humansyncbackend.onrender.com/api/v1/robot'; // Cambia esto por la URL de tu backend

  // Método para obtener la lista de robots
  Future<List<dynamic>> getRobots(String token) async {
    final url = Uri.parse('$baseUrl/all-by-my');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Autorización con token
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Error al obtener la lista de robots: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }



  
  // Método para ejectuar el movimiento 
  Future<String> executeMovement(String token, String robotToken, String movementId) async {
    final url = Uri.parse('$baseUrl/execute-movement/$movementId/$robotToken');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return 'Movimiento ejecutado correctamente';
      } else {
        throw Exception('Error al ejecutar el movimiento: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
  // Método para añadir un nuevo robot
  Future<Map<String, dynamic>> addRobot(String token, Map<String, dynamic> robotData) async {
    final url = Uri.parse(baseUrl);

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(robotData),
      );

      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Error al añadir el robot: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  // Método para actualizar información de un robot
  Future<Map<String, dynamic>> updateRobot(String token, String robotId, Map<String, dynamic> updatedData) async {
    final url = Uri.parse('$baseUrl/$robotId');

    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(updatedData),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Error al actualizar el robot: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }

  // Método para eliminar un robot
  Future<void> deleteRobot(String token, String robotId) async {
    final url = Uri.parse('$baseUrl/$robotId');

    try {
      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode != 204) {
        throw Exception('Error al eliminar el robot: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}
