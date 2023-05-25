import 'package:chirp_chat/services/post.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chirp_chat/screens/new_post.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import '../models/post.dart';
import '../services/usuario.service.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool addPost = false;
  bool liked = true;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;

    Future<Usuario> obtenerPerfil(int id) async {
      final service = usuarioService();
      return await service.getIdUser(id);
    }

    Future<List<Post>> obtenerPosts() async {
      final service = postService();
      return await service.getPost();
    }

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
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 60.0,
                ),
                Container(
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: FutureBuilder<List<Post>>(
                    future: obtenerPosts(),
                    builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return const Text('Error al obtener los posts');
                      }
                      List<Post> posts = snapshot.data ?? [];
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: posts.length,
                        itemBuilder: (BuildContext context, int index) {
                          Post post = posts[index];
                          return Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: size.width * 0.03,
                                      left: size.width * 0.05,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(60.0),
                                      child: FutureBuilder<Usuario>(
                                        future: obtenerPerfil(post.my_self),
                                        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return const CircularProgressIndicator();
                                          }
                                          if (snapshot.hasError) {
                                            return const Icon(Icons.error);
                                          }
                                          Usuario usuario = snapshot.data ?? Usuario();
                                          return Image.network(
                                            usuario.imagen ?? 'https://chirpchatbucketimages.s3.us-east-2.amazonaws.com/media/f0372380-8287-4a2c-b632-4f390bbe6c34.png',
                                            width: size.width * 0.1,
                                            height: size.width * 0.1,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: size.width * 0.06),
                                    width: size.width * 0.4,
                                    height: 50.0,
                                    child: FutureBuilder<Usuario>(
                                      future: obtenerPerfil(post.my_self),
                                      builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return const CircularProgressIndicator();
                                        }
                                        if (snapshot.hasError) {
                                          return const Text('Error al obtener el perfil');
                                        }
                                        Usuario usuario = snapshot.data ?? Usuario();
                                        return Text(
                                          usuario.user_name,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  right: 30.0,
                                  top: 10.0,
                                ),
                                child: Text(
                                  post.contenido,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(fontSize: 20.0),
                                ),
                              ),
                              Image.network(
                                post.imagen ?? 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Post_Holdings_logo.svg/1200px-Post_Holdings_logo.svg.png',
                                width: 250.0,
                                height: 250.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    liked = !liked;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(
                                    left: 25.0,
                                    bottom: 18.0,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      (liked
                                          ? const Icon(CupertinoIcons.heart)
                                          : const Icon(
                                        CupertinoIcons.heart_fill,
                                        color: Colors.red,
                                      )),
                                      (liked
                                          ? const Text('0')
                                          : const Text(
                                        '0',
                                        style: TextStyle(color: Colors.red),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 20.0,
                                color: Colors.black,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewPost()));
        },
      ),
    );
  }
}