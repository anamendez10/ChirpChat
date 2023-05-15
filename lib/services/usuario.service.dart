import 'dart:convert';
import 'package:chirp_chat/models/models.dart';
import 'package:http/http.dart' as http;

const String urlAPI = 'https://drf-api-chirp-chat.onrender.com/usuario/';
var url = Uri.parse(urlAPI);
class usuarioService {
  Future<List<Usuario>> getUser() async {
    final response = await http.get(url);
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
  Future<dynamic> post(Usuario user) async{//"promesa"
    var headers = {'Content-Type': 'application/json'};
    var jsonBody = jsonEncode(user.toJson());//de Usuario a JSON
    if(user.imagen == null){//si no paso imagen eliminar el item
      Map<String, dynamic> json = jsonDecode(jsonBody);// Convertir JSON a Map
      json.remove('imagen');// Eliminar el elemento 'email' del Map
      jsonBody = jsonEncode(json);// Convertir Map modificado de vuelta a JSON
    }
    var response = await http.post(url,  headers: headers, body: jsonBody);
    if(response.statusCode == 201){//cuando se hace un POST el backend devuelve un 201 no 200
      print(response.body);//el backend responde con el JSON del usuario que se registro
    }else{
      throw Exception('${response.statusCode}: ${response.body}');
  }
  }
}

//Future<dynamic> put(String api) async{}
//Future<dynamic> patch(String api) async{}