import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Ayla extends StatefulWidget {
  const Ayla({Key? key}) : super(key: key);

  @override
  State<Ayla> createState() => _AylaState();
}

class _AylaState extends State<Ayla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children:<Widget> [
              Image.asset("assets/images/movie3.jpg",width: 300,height: 500,),
Row(children:<Widget> [SizedBox(width:120),
  GestureDetector(                  onTap: () async {
    var weburl = "https://www.youtube.com/watch?v=2Q6ZOnrRLpU";
    try {
      bool launched =
      await launch(weburl, forceSafariVC: false);
      if (!launched) {
        await launch(weburl, forceSafariVC: false);
      }
    } catch (e) {
      print('webSite problem: ${e.toString()}');
      await launch(weburl, forceSafariVC: false);
    }
  },
      child: Card(color: Colors.amber,
        child: Text("Bilet Al"),)),
  GestureDetector(child: Card(color: Colors.amber,child: Text("Fragmanı İzle"),)),
],),
SizedBox(height: 50,),
Text("Film Hakkında",style: TextStyle(color:Colors.red),)

            ],
          ),
        ),
      ),
    );
  }
}
