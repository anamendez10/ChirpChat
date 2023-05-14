import "package:flutter/material.dart";

class NewPost extends StatelessWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    Size size = mediaQuery.size;

    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          // color: Colors.black,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background2.png"),
                fit: BoxFit.cover),
          ),
          child: Center(
              child: Column(children: <Widget>[
            const SizedBox(
              height: 20.0,
            ),
            Container(
              child: const Icon(Icons.close, color: Colors.white,)
            ),
            Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: size.width * 0.03, left: size.width * 0.05),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60.0),
                      child: Image.asset(
                        'assets/images/miguel.jpg',
                        width: size.width * 0.1,
                        height: size.width * 0.1,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.width * 0.03, left: 25.0),
                    // width: size.width * 0.4,
                    // height: 50.0,
                    child: const Text(
                      'Miguel Moreno',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: TextFormField(
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        hintText: 'What are you thinking?',
                        
                        // Added this
                      ),
                )
              ),
            ])
          ]))),
    );
  }
}
