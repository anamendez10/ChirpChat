import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';

class AddFriends extends StatefulWidget {
  const AddFriends({Key? key}) : super(key: key);

  @override
  State<AddFriends> createState() => _AddFriendsState();

}

class _AddFriendsState extends State<AddFriends> {
  bool added = true;
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
            Container(
              width: size.width * 0.8,
              height: 60.0,
              margin: const EdgeInsets.only(
                  top: 30.0, bottom: 15.0, left: 6.0, right: 6.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  hoverColor: Colors.white,
                  isDense: true,
                  hintText: 'Search friends',
                  icon: Icon(CupertinoIcons.search)
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              width: size.width * 0.8,
              height: 90.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    const SizedBox(height: 15.0),
                    Container(
                      margin: const EdgeInsets.only(top: 15.0, left: 30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(60.0),                      
                      child: Image.asset(
                        'assets/images/miguel.jpg',
                          width: 60.0,
                          height: 60.0,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 15.0),
                    Container(
                        margin: const EdgeInsets.only(left: 15.0),
                        child: Column(children: <Widget>[
                          Container(
                            margin:
                                const EdgeInsets.only(bottom: 5.0, top: 15.0),
                            child: const Text(
                              'Miguel Moreno',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ),
                        ]),
                      ),
                      const Spacer(flex: 2,),
                      GestureDetector(
                        onTap:() {
                          setState(() {
                            added = !added;
                          },
                          ); 
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 30.0, top: 15.0),
                          child: (added ? Icon(Icons.person_add_alt_outlined) : Icon(Icons.person_outline_sharp))
                        ),
                      ),
                  ]),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15.0),
              width: size.width * 0.8,
              height: 90.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    const SizedBox(height: 15.0),
                    Container(
                      margin: const EdgeInsets.only(top: 15.0, left: 30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(60.0),                      
                      child: Image.asset(
                        'assets/images/sebas.jpg',
                        width: 60.0,
                        height: 60.0,
                      ),
                    ),
                    ),
                    
                    const SizedBox(height: 15.0),
                    Container(
                        margin: const EdgeInsets.only(left: 15.0),
                        child: Column(children: <Widget>[
                          Container(
                            margin:
                                const EdgeInsets.only(bottom: 5.0, top: 15.0),
                            child: const Text(
                              'Sebastian Useche',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ),
                        ]),
                      ),
                      const Spacer(flex: 2,),
                      GestureDetector(
                        onTap:() {
                          setState(() {
                            added = !added;
                          },
                          ); 
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 30.0, top: 15.0),
                          child: (added ? Icon(Icons.person_add_alt_outlined) : Icon(Icons.person_outline_sharp))
                        ),
                      ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
