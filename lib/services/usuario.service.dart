import 'dart:convert';
import 'package:chirp_chat/models/models.dart';
import 'package:http/http.dart' as http;

const String urlAPI = 'https://drf-api-chirp-chat.onrender.com/usuario/';

class usuarioService {
  Future<List<Usuario>> getUser() async {
    final response = await http.get(Uri.parse(urlAPI));
    if (response.statusCode == 200) {
      List<Usuario> user = [];
      String body = utf8.decode(response.bodyBytes);
      final json_data = json.decode(body);
      for (var item in json_data) {
        user.add(Usuario.fromMap(item));
      }
      return user;
    } else {
      throw Exception("Fallo la conexión");
    }
  }

  // new user
  newUser(String name, String surname, String username, String email,
      String password) async {
    var url = Uri.https('drf-api-chirp-chat.onrender.com', 'usuario');
    // parse(urlAPI);
    final response = await http.post(
      Uri.parse('https://drf-api-chirp-chat.onrender.com/usuario/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nombre': name,
        'apellido': surname,
        'user_name': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Usuario.fromMap(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}


//Future<dynamic> post(String api) async{}
//Future<dynamic> put(String api) async{}
//Future<dynamic> patch(String api) async{}