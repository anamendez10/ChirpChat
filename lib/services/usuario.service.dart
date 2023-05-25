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
  Future<Usuario> getIdUser(int id) async {
    String idUrl = urlAPI + id.toString() + "/";
    final response = await http.get(Uri.parse(idUrl));
    if (response.statusCode == 200) {
      Usuario user;
      String body = utf8.decode(response.bodyBytes);
      final json_data = json.decode(body);
      user = Usuario.fromMap(json_data);
      return user;
    } else {
      throw Exception("Fallo la conexión");
    }
  }
  Future<List<Usuario>> getMisAmigos(int id) async {
    String idUrl = "https://drf-api-chirp-chat.onrender.com/lista-amigos" + id.toString() + "/";
    final response = await http.get(Uri.parse(idUrl));
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
  Future<dynamic> post(Usuario user) async{
    var headers = {'Content-Type': 'application/json'};
    var jsonBody = jsonEncode(user.toJson());
    if(user.imagen == null){
      Map<String, dynamic> json = jsonDecode(jsonBody);
      json.remove('imagen');
      jsonBody = jsonEncode(json);
    }
    var response = await http.post(url,  headers: headers, body: jsonBody);
    if(response.statusCode == 201){
    }else{
      throw Exception('${response.statusCode}: ${response.body}');
  }
  }
  Future<dynamic> patchIMG(String img64, int id) async{

    var headers = {'Content-Type': 'application/json'};
    String patchURL = 'https://drf-api-chirp-chat.onrender.com/usuario/' + id.toString() + "/";
    Map<String, dynamic> data = {'imagen': img64};
    String jsonData = json.encode(data);
    var response = await http.patch(Uri.parse(patchURL),  headers: headers, body: jsonData);
    print('${response.statusCode}: ${response.body}');
    if(response.statusCode == 200){
      print("object");
    }else{
      throw Exception('${response.statusCode}: ${response.body}');
    }

  }
}

//Future<dynamic> put(String api) async{}
