import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/post.dart';

const String urlAPI = 'https://drf-api-chirp-chat.onrender.com/publicacion/';
var url = Uri.parse(urlAPI);


class postService {
  Future<List<Post>> getPost() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<Post> post = [];
      String body = utf8.decode(response.bodyBytes);
      final json_data = json.decode(body);
      for (var item in json_data) {
        post.add(Post.fromMap(item));
      }
      return post;
    } else {
      throw Exception("Fallo la conexión");
    }
  }

  // new user
  Future<dynamic> postPost(Post post) async{
    var headers = {'Content-Type': 'application/json'};
    var jsonBody = jsonEncode(post.toJson());
    if(post.imagen == null){
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

  Future<List<Post>> getPostsMios(int id) async {
    String urlPostMio = 'https://drf-api-chirp-chat.onrender.com/lista-publicaciones/' + id.toString() + "/";
    final response = await http.get(Uri.parse(urlPostMio));
    if (response.statusCode == 200) {
      List<Post> post = [];
      String body = utf8.decode(response.bodyBytes);
      final json_data = json.decode(body);
      for (var item in json_data) {
        post.add(Post.fromMap(item));
      }
      return post;
    } else {
      throw Exception("Fallo la conexión");
    }
  }
}

//Future<dynamic> put(String api) async{}
