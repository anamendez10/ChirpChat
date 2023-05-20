import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  // Obtener datos del usuario desde SharedPreferences
  Future<Usuario> obtenerDatosUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id') ?? 0;
    String nombre = prefs.getString('nombre') ?? "";
    String apellido = prefs.getString('apellido') ?? "";
    String user_name = prefs.getString('user_name') ?? "";
    String email = prefs.getString('email') ?? "";
    String is_active = prefs.getString('is_active') ?? "";
    return Usuario(
        id: id,
        nombre: nombre,
        apellido: apellido,
        user_name: user_name,
        email: email,
        is_active: is_active);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;



    return FutureBuilder<Usuario>(
      future: obtenerDatosUsuario(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Usuario user = snapshot.data!;
          print(user.user_name);

          return Scaffold(
            body: Container(
              constraints: const BoxConstraints.expand(),
              // color: Colors.black,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background2.png"),
                    fit: BoxFit.cover),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(left: 50.0),
                          child:  Text(user.user_name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0)),
                        ),
                        const Spacer(flex: 2),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 50.0, right: 50.0, bottom: 20.0),
                          width: 70.0,
                          height: 70.0,
                          child: Image.asset('assets/icons/user.png'),
                        ),
                      ],
                    ),
                    const Text('Amigos',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0)),
                    Row(
                      children: <Widget>[
                        Container(
                          // height: 50.0,
                          margin: const EdgeInsets.only(
                              left: 55.0, right: 15.0, bottom: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.0),
                            child: Image.asset(
                              'assets/images/miguel.jpg',
                              height: 50.0,
                              width: 50.0,
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: const Text('Miguel Moreno',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0))),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          // height: 50.0,
                          margin: const EdgeInsets.only(
                              left: 55.0, right: 15.0, bottom: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.0),
                            child: Image.asset(
                              'assets/images/sebas.jpg',
                              height: 50.0,
                              width: 50.0,
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: const Text('Sebastian Useche',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0))),
                      ],
                    ),
                    const Text('Publicaciones',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0)),
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
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(
                                      top: size.width * 0.05,
                                      left: size.width * 0.05),
                                  child: Image.asset(
                                    'assets/icons/user.png',
                                    width: size.width * 0.1,
                                    height: size.width * 0.1,
                                  )),
                              Container(
                                margin:
                                EdgeInsets.only(top: size.width * 0.05),
                                width: size.width * 0.4,
                                height: 50.0,
                                child: const Text(
                                  'user',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 10.0),
                            child: const Text(
                              'Lorem ipsum',
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            child: Image.asset(
                              'assets/icons/flutter_logo.png',
                              width: 250.0,
                              height: 250.0,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 25.0),
                            child: const Icon(CupertinoIcons.heart),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.8,
                      margin: const EdgeInsets.only(bottom: 15.0),
                      height: 425.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(
                                      top: size.width * 0.05,
                                      left: size.width * 0.05),
                                  child: Image.asset(
                                    'assets/icons/user.png',
                                    width: size.width * 0.1,
                                    height: size.width * 0.1,
                                  )),
                              Container(
                                margin:
                                EdgeInsets.only(top: size.width * 0.05),
                                width: size.width * 0.4,
                                height: 50.0,
                                child: const Text(
                                  'user',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 10.0),
                            child: const Text(
                              'Lorem ipsum',
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            child: Image.asset(
                              'assets/icons/flutter_logo.png',
                              width: 250.0,
                              height: 250.0,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 25.0),
                            child: const Icon(CupertinoIcons.heart),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * 0.8,
                      margin: const EdgeInsets.only(bottom: 15.0),
                      height: 425.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(
                                      top: size.width * 0.05,
                                      left: size.width * 0.05),
                                  child: Image.asset(
                                    'assets/icons/user.png',
                                    width: size.width * 0.1,
                                    height: size.width * 0.1,
                                  )),
                              Container(
                                margin:
                                EdgeInsets.only(top: size.width * 0.05),
                                width: size.width * 0.4,
                                height: 50.0,
                                child: const Text(
                                  'user',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 30.0, right: 30.0, top: 10.0),
                            child: const Text(
                              'Lorem ipsum',
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            child: Image.asset(
                              'assets/icons/flutter_logo.png',
                              width: 250.0,
                              height: 250.0,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 25.0),
                            child: const Icon(CupertinoIcons.heart),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );



        } else if (snapshot.hasError) {
          // Manejar el caso de error
          return Text('Error al obtener los datos del usuario');
        } else {
          // Mostrar un indicador de carga mientras se espera la resolución del futuro
          return CircularProgressIndicator();
        }
      },
    );
  }
}
