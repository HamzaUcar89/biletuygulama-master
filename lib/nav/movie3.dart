import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Yabanci extends StatefulWidget {
  const Yabanci({Key? key}) : super(key: key);

  @override
  State<Yabanci> createState() => _YabanciState();
}

class _YabanciState extends State<Yabanci> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children:<Widget> [
              Image.asset("assets/images/movie1.jpg",width: 300,height: 500,),
              Row(children:<Widget> [SizedBox(width:120),

                GestureDetector(                  onTap: () async {
                  var weburl = "https://www.youtube.com/watch?v=dr_cDTJ70h8&t=2s";
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
              ],),
              SizedBox(height: 50,),
              Text("Film Hakkında",style: TextStyle(color:Colors.red),),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 15,left: 15),
                child: Text("Travmatik bir yılın ardından, birinci nesil Kızılderili-Amerikalı bir genç okuldaki durumunu iyileştirmek ister, ancak arkadaşları, ailesi ve duyguları onun için kolay değildir.",style: TextStyle(color: Colors.red),),
              )

            ],
          ),
        ),
      ),
    );
  }
}
