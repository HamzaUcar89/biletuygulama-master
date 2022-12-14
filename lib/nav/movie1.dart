import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Sabrina extends StatefulWidget {
  const Sabrina({Key? key}) : super(key: key);

  @override
  State<Sabrina> createState() => _SabrinaState();
}

class _SabrinaState extends State<Sabrina> {
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
        child: Text("Fragamı izle"),)),
  GestureDetector(child: Card(color: Colors.amber,child: Text("Bilet Al"),)),
],),
SizedBox(height: 50,),
Text("Film Hakkında",style: TextStyle(color:Colors.yellow),),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 15,left: 15),
                child: Text("Genç Cadı Sabrina masalının bu uyarlaması, korku ve esrar ticareti yapan karanlık bir reşit olma hikayesidir. Yeniden tasarlanan köken öyküsünde Sabrina Spellman, kendisini, Hilda ve Zelda teyzeleri de dahil olmak üzere ailesini ve gün ışığı dünyasını tehdit eden kötü güçlere karşı dururken, ikili doğasını - yarı cadı, yarı ölümlü - uzlaştırmak için mücadele ediyor. insan yaşar. Kiernan Shipka (Mad Men), aynı adlı çizgi roman serisine dayanan dizinin baş rolünde oyuncu kadrosuna liderlik ediyor.",style: TextStyle(color: Colors.white),),
              )

            ],
          ),
        ),
      ),
    );
  }
}
