import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';

import '../models/models.dart';
import '../services/usuario.service.dart';

class AddFriends extends StatefulWidget {
  const AddFriends({Key? key}) : super(key: key);

  @override
  State<AddFriends> createState() => _AddFriendsState();
}

class _AddFriendsState extends State<AddFriends> {
  String selectedUser = "";
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;

    Future<List<Usuario>> obtenerUsuarios() async {
      final service = usuarioService();
      return await service.getUser();
    }

    return FutureBuilder<List<Usuario>>(
        future: obtenerUsuarios(),
        builder: (BuildContext context, AsyncSnapshot<List<Usuario>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras se obtienen los datos
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Maneja cualquier error que se produzca durante la obtención de los datos
            return Text('Error: ${snapshot.error}');
          } else {
            // Los datos se obtuvieron correctamente, puedes acceder a ellos en snapshot.data
            List<Usuario> usuarios = snapshot.data!;

            return Scaffold(
              appBar: AppBar(
                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hoverColor: Colors.white,
                      isDense: true,
                      hintText: 'Search friends',
                      icon: Icon(CupertinoIcons.search),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                backgroundColor: Colors.black,
                elevation: 0,
              ),
              body: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: ListView.builder(
                  itemCount: usuarios.length,
                  itemBuilder: (BuildContext context, int index) {
                    Usuario usuario = usuarios[index];

                    return Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 15.0, left: 15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60.0),
                            child: Image.network(
                              usuario.imagen ?? 'https://chirpchatbucketimages.s3.us-east-2.amazonaws.com/media/f0372380-8287-4a2c-b632-4f390bbe6c34.png',
                              width: 60.0,
                              height: 60.0,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(
                                    bottom: 5.0, top: 15.0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: size.width * 0.6,
                                      child: Text(
                                        usuario.user_name ?? "Hubo un error",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedUser = usuario.nombre;
                                              selected = !selected;
                                            });
                                            print(usuario.nombre);
                                          },
                                          child: Icon(
                                            selected &&
                                                    selectedUser ==
                                                        usuario.nombre
                                                ? Icons.person
                                                : Icons.person_add_alt_1,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            );
          }
        });
  }
}

// return Scaffold(
//   body: // Container(
// constraints: const BoxConstraints.expand(),
// // color: Colors.black,
// decoration: const BoxDecoration(
//   image: DecorationImage(
//       image: AssetImage("assets/images/background2.png"),
//       fit: BoxFit.cover),
// ),
// child: Column(
//   children: <Widget>[
//     Container(
//       width: size.width * 0.8,
//       height: 60.0,
//       margin: const EdgeInsets.only(
//           top: 30.0, bottom: 15.0, left: 6.0, right: 6.0),
//       padding: const EdgeInsets.all(10.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: TextFormField(
//         decoration: const InputDecoration(
//             hoverColor: Colors.white,
//             isDense: true,
//             hintText: 'Search friends',
//             icon: Icon(CupertinoIcons.search)),
//       ),
//     ),
//     Container(
//       margin: const EdgeInsets.only(top: 15.0),
//       width: size.width * 0.8,
//       height: 90.0,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: Column(
//         children: <Widget>[
//           Row(children: <Widget>[
//             const SizedBox(height: 15.0),

//                       ListView.builder(
//                         itemCount: usuarios.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           Usuario usuario = usuarios[index];
//
//                           return Row(children: <Widget>[
//                             Container(
//                               margin:
//                               const EdgeInsets.only(top: 15.0, left: 15.0),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(30.0),
//                               ),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(60.0),
//                                 child: Image.asset(
//                                   usuario.imagen ?? 'assets/images/miguel.jpg',
//                                   width: 60.0,
//                                   height: 60.0,
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.only(left: 15.0),
//                               child: Column(children: <Widget>[
//                                 Container(
//                                   margin: const EdgeInsets.only(
//                                       bottom: 5.0, top: 15.0),
//                                   child: Text(
//                                     usuario.nombre ?? "Hubo un error",
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 20.0),
//                                   ),
//                                 ),
//                               ]),
//                             )
//                           ]);
//
//
//                         }),
//
//
//
//
//
//
//
//
//
//
//
//                       // const Spacer(
//                       //   flex: 2,
//                       // ),
//                       // GestureDetector(
//                       //   onTap: () {
//                       //     setState(
//                       //       () {
//                       //         added = !added;
//                       //       },
//                       //     );
//                       //   },
//                       //   child: Container(
//                       //       margin: const EdgeInsets.only(
//                       //           right: 30.0, top: 15.0),
//                       //       child: (added
//                       //           ? Icon(Icons.person_add_alt_outlined)
//                       //           : Icon(Icons.person_outline_sharp))),
//                       // ),
//
//
//                     /*]),
//                   ],
//                 ),
//               ),
//             ],
//           ),*/
//         ),
//       );
//     }
//   }
// );
