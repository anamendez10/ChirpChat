import 'package:chirp_chat/screens/login.dart';
import "package:flutter/material.dart";

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        // color: Colors.black,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()), // Reemplaza "LoginScreen" con el nombre correcto de tu pantalla de inicio de sesión
              );
            },
            child: Text('Logout'),
          ),
        ),
      ),
    );
  }
}
