import 'dart:convert';
import 'package:chirp_chat/models/models.dart';
import 'package:http/http.dart' as http;


const String urlAPI = 'https://drf-api-chirp-chat.onrender.com/usuario/';


class usuarioService{

  Future<List<Usuario>> getUser() async {
    final response = await http.get(Uri.parse(urlAPI));
    if(response.statusCode == 200){
      List<Usuario> user = [];
      String body = utf8.decode(response.bodyBytes);
      final json_data = json.decode(body);
      for(var item in json_data){
        user.add(Usuario.fromMap(item));
      }
      return user;
    }else{
      throw Exception("Fallo la conexión");
    }
  }

  // new user
  newUser(String name, String surname, String username, String email, String password) async {
    var url = Uri.parse(urlAPI); 

    var response = await http.post(url, body: {'imagen': 'aHR0cHM6Ly9pbWFnZXMucGV4ZWxzLmNvbS9waG90b3MvMTU0MTU4MjAvcGV4ZWxzLXBob3RvLTE1NDE1ODIwLmpwZWc/YXV0bz1jb21wcmVzcyZjcz10aW55c3JnYiZ3PTEyNjAmaD03NTAmZHByPTE=',
    'nombre': name,
    'apellido': surname,
    'user_name': username,
    'email': email, 
    'password': password,
    'is_active': 'true'});

    print('Status: ${response.statusCode}');
    print('Status: ${response.body}');
  }
}


//Future<dynamic> post(String api) async{}
//Future<dynamic> put(String api) async{}
//Future<dynamic> patch(String api) async{}