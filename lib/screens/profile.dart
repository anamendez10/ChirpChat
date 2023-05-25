import 'package:chirp_chat/services/post.service.dart';
import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:io';
import '../models/models.dart';
import '../models/post.dart';
import '../services/usuario.service.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  Future<int> obtenerIdUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id') ?? 0;
    return id;
  }

  Future<Usuario> obtenerMiPerfil() async {
    int id = await obtenerIdUsuario();
    final service = usuarioService();
    return await service.getIdUser(id);
  }

  Future<String> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      int id = await obtenerIdUsuario();
      final service = usuarioService();
      service.patchIMG(base64Image, id);
      print(base64Image);
      return base64Image;
    }
    return "";
  }

  Future<List<Post>> obtenerListaPosts() async {
    int id = await obtenerIdUsuario();
    final service = postService();
    return await service.getPostsMios(id);
  }
/*  Future<List<Usuario>> obtenerListaAmigos() async {
    int id = await obtenerIdUsuario();
    final service = usuarioService();
    return await service.getMisAmigos(id);
  }*/
  Future<List<Usuario>> obtenerListaAmigos() async {
    final service = usuarioService();
    return await service.getUser();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;

    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: FutureBuilder<Usuario>(
            future: obtenerMiPerfil(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                Usuario usuario = snapshot.data!;
                return Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(usuario.imagen ?? 'https://chirpchatbucketimages.s3.us-east-2.amazonaws.com/media/f0372380-8287-4a2c-b632-4f390bbe6c34.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: size.width * 0.2, top: size.width * 0.09),
                            child: Column(
                              children: [
                                Text(
                                  usuario.user_name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  ),
                                ),
                                Text(
                                  "Nombre: " + (usuario.nombre ?? "") + (usuario.apellido ?? ""),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                                Text(
                                  "Correo: " + usuario.email,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(flex: 2),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 55.0,
                              right: 50.0,
                              bottom: 20.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            width: 70.0,
                            height: 70.0,
                            child: GestureDetector(
                              onTap: () {
                                _pickImage();
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(60.0),
                                child: Image.network(
                                  usuario.imagen ?? 'https://chirpchatbucketimages.s3.us-east-2.amazonaws.com/media/f0372380-8287-4a2c-b632-4f390bbe6c34.png',
                                  height: 70.0,
                                  width: 70.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Amigos',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                      ),
                    ),
                    FutureBuilder<List<Usuario>>(
                      future: obtenerListaAmigos(), // Obtener la lista de usuarios de la API
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          List<Usuario> usuarios = snapshot.data!;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: usuarios.map((usuario) {
                                return Container(
                                  margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(60.0),
                                          child: Image.network(
                                            usuario.imagen ?? 'https://chirpchatbucketimages.s3.us-east-2.amazonaws.com/media/f0372380-8287-4a2c-b632-4f390bbe6c34.png',
                                            height: 50.0,
                                            width: 50.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          usuario.user_name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                        }
                      },
                    ),
                    const Text(
                      'Publicaciones',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: size.width * 0.8,
                      margin: const EdgeInsets.only(bottom: 15.0),
                      height: 425.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: FutureBuilder<List<Post>>(
                        future: obtenerListaPosts(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            List<Post> posts = snapshot.data!;
                            return ListView.builder(
                              itemCount: posts.length,
                              itemBuilder: (context, index) {
                                Post post = posts[index];
                                return Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: size.width * 0.05,
                                            left: size.width * 0.05,
                                          ),
                                          child: Image.network(
                                            usuario.imagen ??
                                                'https://chirpchatbucketimages.s3.us-east-2.amazonaws.com/media/5c4b4577-491e-4ba4-8d15-aaa519f6098a.jpg',
                                            width: size.width * 0.1,
                                            height: size.width * 0.1,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: size.width * 0.05,
                                          ),
                                          width: size.width * 0.4,
                                          height: 50.0,
                                          child: Text(
                                            usuario.user_name,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        left: 30.0,
                                        right: 30.0,
                                        top: 10.0,
                                      ),
                                      child: Text(
                                        post.contenido,
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Container(
                                      child: Image.network(
                                        post.imagen ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Post_Holdings_logo.svg/1200px-Post_Holdings_logo.svg.png',
                                        width: 250.0,
                                        height: 250.0,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.only(left: 25.0),
                                      child: const Icon(CupertinoIcons.heart),
                                    ),
                                    Container(
                                      height: 20.0,
                                      color: Colors.black,
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
