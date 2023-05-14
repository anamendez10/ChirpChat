import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chirp_chat/screens/new_post.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();

}

class _FeedState extends State<Feed> {
  bool addPost = false;
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 60.0,
                ),
                // Container(
                //   width: size.width * 0.8,
                //   height: 60.0,
                //   margin: const EdgeInsets.only(bottom: 15.0),
                //   padding: const EdgeInsets.all(10.0),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(20.0),
                //   ),
                //   child: TextFormField(
                //     decoration: const InputDecoration(
                //       hoverColor: Color.fromARGB(255, 198, 186, 186),
                //       isDense: true,
                //       hintText: 'Add a new comment',
                //       icon: Icon(CupertinoIcons.photo_fill)
                //     ),
                //   ),
                // ),
                Container(
                  width: size.width * 0.8,
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
                                top: size.width * 0.03,
                                left: size.width * 0.05),
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
                            margin: EdgeInsets.only(top: size.width * 0.06),
                            width: size.width * 0.4,
                            height: 50.0,
                            child: const Text(
                              'Miguel Moreno',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 30, right: 30.0, top: 10.0),
                        child: const Text(
                          'Virgen Satisimita Virgen Satisimita Virgen Satisimita Virgen Satisimita Virgen Satisimita Virgen Satisimita Virgen Satisimita',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Image.asset(
                        'assets/icons/flutter_logo.png',
                        width: 250.0,
                        height: 250.0,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 25.0, bottom: 18.0),
                        child: const Icon(CupertinoIcons.heart),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.black,),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewPost()));
      }),
    );
  }
}
