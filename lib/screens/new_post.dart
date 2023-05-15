import "package:chirp_chat/screens/feed.dart";
import "package:flutter/material.dart";

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  bool close = false;

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
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      close = true;
                      if (close == true) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Feed()));
                      }
                    },
                  );
                },
                child: Container(
                    margin: const EdgeInsets.only(right: 30.0, top: 15.0),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ),
              Center(
                  child: Column(children: <Widget>[
                const SizedBox(
                  height: 20.0,
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
                        margin:
                            EdgeInsets.only(top: size.width * 0.03, left: 25.0),
                        // width: size.width * 0.4,
                        // height: 50.0,
                        child: const Text(
                          'Miguel Moreno',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
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
                        ),
                      )),
                ])
              ]))
            ],
          )),
    );
  }
}
