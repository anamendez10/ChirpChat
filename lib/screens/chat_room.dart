import "package:flutter/material.dart";

import "../models/models.dart";
import "../services/usuario.service.dart";

class ChatRoom extends StatelessWidget {
  const ChatRoom({Key? key}) : super(key: key);
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
      // color: Colors.black,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background2.png"),
            fit: BoxFit.cover),
      ),
      child: Column(children: <Widget>[
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
        Container(
          margin: const EdgeInsets.only(top: 15.0),
          width: size.width * 1,
          height: 100.0,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 0.5)),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 15.0, left: 30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: Image.asset(
                      'assets/images/miguel.jpg',
                      width: 60.0,
                      height: 60.0,
                    ),
                  ),
                ),
                Column(children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 15.0),
                    child: Column(children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 5.0, top: 10.0),
                        child: const Text(
                          'Miguel Moreno',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 15.0),
                          child: const Text('Quiubo pana, como va?')),
                    ]),
                  )
                ]),
              ]),
            ],
          ),
        ),
        Container(
          width: size.width * 1,
          height: 100.0,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 0.5)),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 15.0, left: 30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60.0),
                    child: Image.asset(
                      'assets/images/sebas.jpg',
                      width: 60.0,
                      height: 60.0,
                    ),
                  ),
                ),
                Column(children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 15.0),
                    child: Column(children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(bottom: 5.0, top: 10.0),
                        child: const Text(
                          'Sebastián Useche',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 15.0),
                          child: const Text('Que hay pa hacer hoy? :p')),
                    ]),
                  )
                ]),
              ]),
            ],
          ),
        ),
      ]),
    ));
  }
}
