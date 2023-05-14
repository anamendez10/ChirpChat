import "package:flutter/material.dart";

class ChatRoom extends StatelessWidget {
  const ChatRoom({Key? key}) : super(key: key);

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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                    right: 25.0, left: 35.0, bottom: 15.0, top: 35.0),
                child: Image.asset(
                  'assets/images/miguel.jpg',
                  height: 80.0,
                  width: 80.0,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 25.0, left: 10.0, bottom: 15.0, top: 35.0),
                child: Image.asset(
                  'assets/images/sebas.jpg',
                  height: 80.0,
                  width: 80.0,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 25.0, left: 10.0, bottom: 15.0, top: 35.0),
                child: Image.asset(
                  'assets/icons/icon_man.png',
                  height: 80.0,
                  width: 80.0,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 25.0, left: 10.0, bottom: 15.0, top: 35.0),
                child: Image.asset(
                  'assets/icons/icon_man.png',
                  height: 80.0,
                  width: 80.0,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 25.0, left: 10.0, bottom: 15.0, top: 35.0),
                child: Image.asset(
                  'assets/icons/icon_man.png',
                  height: 80.0,
                  width: 80.0,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 25.0, left: 10.0, bottom: 15.0, top: 35.0),
                child: Image.asset(
                  'assets/icons/icon_man.png',
                  height: 80.0,
                  width: 80.0,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 25.0, left: 10.0, bottom: 15.0, top: 35.0),
                child: Image.asset(
                  'assets/icons/icon_man.png',
                  height: 80.0,
                  width: 80.0,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 25.0, left: 10.0, bottom: 15.0, top: 35.0),
                child: Image.asset(
                  'assets/icons/icon_man.png',
                  height: 80.0,
                  width: 80.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15.0),
          width: size.width * 1,
          height: 100.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 0.5)
          ),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 15.0, left: 30.0),
                  child: Image.asset(
                    'assets/images/miguel.jpg',
                    width: size.width * 0.1,
                    height: size.width * 0.1,
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
            border: Border.all(color: Colors.black, width: 0.5)
          ),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 15.0, left: 30.0),
                  child: Image.asset(
                    'assets/images/sebas.jpg',
                    width: size.width * 0.1,
                    height: size.width * 0.1,
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
