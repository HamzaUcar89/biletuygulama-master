import 'package:biletuygulama/nav/movie1.dart';
import 'package:biletuygulama/nav/movie3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie2.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: new Center(

        child: new ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0,),
            child: Text("Popüler",style: TextStyle(fontSize: 22,color: Colors.amber)),
          ),

          GestureDetector(child:
          Image.asset("assets/images/movie6.jpg",width: 150),onTap:() {
        // Navigator.pushNamed(context, '/signup');
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => Ayla()));
  }

          ),

Padding(
  padding: const EdgeInsets.only(left: 20.0),
  child:   Text("Vizyondaki Diğer Filmler",style: TextStyle(fontSize: 22,color: Colors.amber)),
),
        SizedBox(height: 20),
        new Container(
        height: 300.0,
        child: new ListView(
        scrollDirection: Axis.horizontal,
  children: [
    GestureDetector(
        child: Image.asset("assets/images/movie3.jpg",width: 250),onTap:() {
      // Navigator.pushNamed(context, '/signup');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Sabrina()));
    }
),


    GestureDetector(child:
    Image.asset("assets/images/movie1.jpg",width: 150),onTap:() {
      // Navigator.pushNamed(context, '/signup');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Yabanci()));
    }

    ),

    Image.asset("assets/images/movie2.jpg",width: 250),


  ],
    ),
    ),
    ],
    ),)
    );
  }
}
