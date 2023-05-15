import 'package:http/http.dart' as http;
import 'dart:convert';

const String urlAPI = 'https://drf-api-chirp-chat.onrender.com/usuario/';
var url = Uri.parse(urlAPI);


class LoginService {
// login
  Future<dynamic> post(String email, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var response = await http.post(url, headers: headers, body: {"email":email,"password":password});
    return response.statusCode;

  }
}