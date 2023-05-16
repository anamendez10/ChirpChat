import 'package:http/http.dart' as http;
import 'dart:convert';

const String urlAPI = 'https://drf-api-chirp-chat.onrender.com/login/';
var url = Uri.parse(urlAPI);


class LoginService {
// login
  Future<dynamic> postLogin(String email, String password) async {
    var jsonBody = jsonEncode({"email":email,"password":password});//de Usuario a JSON
    var headers = {'Content-Type': 'application/json'};
    var response = await http.post(url, headers: headers, body: jsonBody);
    print('${response.statusCode}: ${response.body}');
    return response.statusCode;

  }
}