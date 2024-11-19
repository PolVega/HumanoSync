import 'dart:convert';
import 'package:http/http.dart' as http;

class MovementService {
    final String baseUrl = 'https://humansyncbackend.onrender.com/api/v1/movement'; // Cambia esto por la URL de tu backend

  // Método para obtener los movimientos del robot
  Future<List<dynamic>> getMovements(String token,String robotId) async {
    final url = Uri.parse('$baseUrl/all-by-robot/$robotId');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Autorización con token
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> movements = jsonDecode(response.body);
      return movements;
      } else {
        throw Exception('Error al obtener la lista de movements: ${response.body}');
      }
    } catch (e){
      throw Exception('Error de conexión: $e');
    }
  }
}
