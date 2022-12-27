

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Deger extends StatefulWidget {
  const Deger({super.key});

  @override
  State<Deger> createState() => _DegerState();
}
final _firestore = FirebaseFirestore.instance;
class _DegerState extends State<Deger> {
  var uid = FirebaseAuth.instance.currentUser?.uid.toString();
  @override
  Widget build(BuildContext context) {
    CollectionReference veriRef =_firestore.collection('Rezervasyon');
    var uidRef = veriRef.doc('$uid');
    
    return Scaffold(
      body: Column(
        children:<Widget> [
        
        StreamBuilder<DocumentSnapshot>(stream:uidRef.snapshots() ,
        builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
          if (!asyncSnapshot.hasData) {
                        return const Center(
                          child: Text("Loading..."),
                        );
                      }
                      return Container(width: 400,
                        child: Card(child:Column(children:<Widget> [
                          Image.asset("assets/images/otobüs.png",width: 250,height: 300,),
                          SizedBox(height: 25,),
                                    Text("Rezervasyon Bilgileriniz",style: TextStyle(fontSize: 26),),
SizedBox(height: 50,),
                          Text("${asyncSnapshot.data.data().toString()}",style: TextStyle(fontSize: 24),),
                          SizedBox(height: 50,),

                          ElevatedButton(onPressed:(){
                            var collection = FirebaseFirestore.instance.collection('Rezervasyon');
collection 
    .doc(uid)
    .delete();
                          } ,child: Text("Rezervasyonu Sil"),
                          style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
               
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 30))),
            
                          )
                        ],
                        
                         
                        )),
                      );
         } ,
        ),
        ],
      ),
    );
  }  
}