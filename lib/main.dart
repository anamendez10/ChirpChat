import 'package:chirp_chat/screens/login.dart';
import 'package:chirp_chat/screens/register.dart';
import 'package:flutter/material.dart';
void main(){
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
    Widget build(BuildContext context){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Chirp Chat', 
            theme: ThemeData(fontFamily: 'Nunito'),
            home: Login(),
        );
    }
}

class MyApp2 extends StatelessWidget {
  @override
    Widget build(BuildContext context){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Chirp Chat', 
            theme: ThemeData(fontFamily: 'Nunito'),
            home: Register(),
        );
    }
}