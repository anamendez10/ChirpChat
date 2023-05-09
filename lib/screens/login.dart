import 'package:flutter/material.dart';
import 'package:chirp_chat/screens/Register.dart';
import 'package:chirp_chat/screens/Feed.dart';


class Login extends StatelessWidget {
  final emailController = TextEditingController();

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
                height: 210.0,
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
                        
                        // Added this
                      ),
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
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Feed()));
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
