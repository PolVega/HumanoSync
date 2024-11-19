import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'https://humansyncbackend.onrender.com/api/v1/auth'; // Cambia esto por la URL de tu backend

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        // Suponiendo que el backend devuelve un JSON con un token
        return jsonDecode(response.body);
      } else {
        // Error del servidor o credenciales incorrectas
        throw Exception('Error al iniciar sesión: ${response.body}');
      }
    } catch (e) {
      // Error de red u otro tipo
      throw Exception('Error de conexión: $e');
    }
  }
}
