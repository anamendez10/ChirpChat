import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);


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
              fit: BoxFit.cover
            ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: 60.0,
              //   margin: const EdgeInsets.only(left: 20.0, top: 10.0, bottom:10.0),  
              //   child: Row(children: <Widget>[
              //     Container(
              //       child: Image.asset('assets/icons/icon_woman.png',
              //       height: 40.0,
              //       width: 40.0,) 
              //     ),
              //     const Spacer(flex: 2),
              //     Container(
              //       margin: const EdgeInsets.only(right: 20.0, top: 10.0, bottom:10.0),
              //       child: Image.asset('assets/icons/white_settings.png',
              //       height: 40.0,
              //       width: 40.0)
              //     ),
              //   ]
              // ),           
              ),
              Container(
                width: size.width * 0.8,
                height: 60.0,
                margin: const EdgeInsets.only(bottom: 15.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextFormField(
                      decoration: const InputDecoration(
                        hoverColor: Color.fromARGB(255, 198, 186, 186),
                        isDense: true,
                        hintText: 'Add a new comment',
                      ),
                    ),
              ),
              Container(
                width: size.width * 0.8,
                height: 400.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: size.width * 0.05, left:size.width * 0.05),
                          child: Image.asset('assets/icons/user.png',
                          width: size.width * 0.1, 
                          height: size.width * 0.1,)
                        ),
                        Container(
                          margin: EdgeInsets.only(top: size.width * 0.05),
                          width: size.width * 0.4,
                          height: 50.0,
                          child: const Text('user',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                      child: const Text('Lorem ipsum',
                      textAlign: TextAlign.left,),
                    ),
                    Container(
                      child: Image.asset('assets/icons/flutter_logo.png',
                      width: 250.0,
                      height: 250.0,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(left: 25.0),
                      child: const Icon(CupertinoIcons.heart),
                      // child: Image.asset('assets/icons/like.png',
                      // height: 35.0,
                      // width: 35.0,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}