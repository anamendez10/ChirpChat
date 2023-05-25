import 'dart:convert';
import 'package:chirp_chat/models/ManyToMay.dart';
import 'package:chirp_chat/models/models.dart';
import 'package:http/http.dart' as http;

const String urlAPI = 'https://drf-api-chirp-chat.onrender.com/lista-amigos/';
var url = Uri.parse(urlAPI);

class amigosService {
  Future<List<ManyToMany>> getAmigos(int id) async {
    String url_id = urlAPI + id.toString() + "/";
    final response = await http.get(Uri.parse(url_id));
    if (response.statusCode == 200) {
      List<ManyToMany> ids = [];
      String body = utf8.decode(response.bodyBytes);
      final json_data = json.decode(body);
      for (var item in json_data) {
        ids.add(ManyToMany.fromMap(item));
      }
      return ids;
    } else {
      throw Exception("Fallo la conexión");
    }
  }

  Future<List<Usuario>> getAllAmigos(int id) async {
    List<ManyToMany> lista = await getAmigos(id);
    const String urlAPII = 'https://drf-api-chirp-chat.onrender.com/usuario/';
    List<Usuario> usuarios = [];
    for(int i=0; i<lista.length; i++){
      String url_ids = urlAPII + lista[i].amigo.toString() + "/";
      final response = await http.get(Uri.parse(url_ids));


      if (response.statusCode == 200) {
        String body = utf8.decode(response.bodyBytes);
        final json_data = json.decode(body);
        for (var item in json_data) {
          print("askdhjfkashfkashkh");
          print("sdf ${Usuario.fromMap(item)}");
          usuarios.add(Usuario.fromMap(item));
         }
      } else {
        throw Exception("Fallo la conexión");
      }
    }
    return usuarios;
  }

  // new user
  Future<dynamic> post(Usuario user) async {
    var headers = {'Content-Type': 'application/json'};
    var jsonBody = jsonEncode(user.toJson());
    if (user.imagen == null) {
      Map<String, dynamic> json = jsonDecode(jsonBody);
      json.remove('imagen');
      jsonBody = jsonEncode(json);
    }
    var response = await http.post(url, headers: headers, body: jsonBody);
    if (response.statusCode == 201) {
      print(response
          .body);
    } else {
      throw Exception('${response.statusCode}: ${response.body}');
    }
  }
}

//Future<dynamic> put(String api) async{}
//Future<dynamic> patch(String api) async{}
