
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:chirp_chat/screens/Register.dart';
import 'package:chirp_chat/screens/navbar.dart';
import '../models/models.dart';
import '../services/login.service.dart';


class Login extends StatelessWidget {
  final emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void showTemporarySnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message), duration: Duration(seconds: 3));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> guardarDatosUsuario(Usuario user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', user.id);
    prefs.setString('nombre', user.nombre);
    prefs.setString('apellido', user.apellido);
    prefs.setString('user_name', user.user_name);
    prefs.setString('email', user.email);
    prefs.setString('is_active', user.is_active);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background2.png"), 
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 60.0, bottom: 30.0),
                width: 200.0,
                height: 180.0,
                child: Image.asset('assets/icons/icon_woman.png'),
              ),
              Container(
                width: 350.0,
                height: 230.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                    margin: const EdgeInsets.only(top: 20.0, bottom: 15.0),
                    width: 300.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hoverColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                        isDense: true,
                        hintText: 'Type your username!',
                      ),
                      controller: emailController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 25.0),
                    width: 300.0,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        isDense: true,
                        hintText: 'Type your paassword!', // Added this
                      ),
                      controller: passwordController,
                    ),
                  ),
                  Container(
                width: 300.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      elevation: 10.0,
                      minWidth: 110.0,
                      height: 40.0,
                      color: Colors.green[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      onPressed: () async {
                        if(emailController.text != "" && passwordController.text != ""){
                          final service = LoginService();
                          final Usuario response = await service.postLogin(emailController.text, passwordController.text);
                          if(response != null){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar()));
                            guardarDatosUsuario(response);
                            print(response);
                          }
                          else{
                            showTemporarySnackBar(context, 'Error en el usuario o contraseña');
                          }
                        }else{
                          showTemporarySnackBar(context, 'Llene los campos requeridos');
                        }
                  },
                ),
                    const Spacer(
                      flex: 2,
                    ),
                    MaterialButton(
                      elevation: 10.0,
                      minWidth: 110.0,
                      height: 40.0,
                      color: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                        },
                    ),
                  ],
                ),
              ),
                  ]
                  
                ),
                
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}
