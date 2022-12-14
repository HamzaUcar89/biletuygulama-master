import 'package:biletuygulama/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String email = FirebaseAuth.instance.currentUser!.email.toString();
    var isim = FirebaseAuth.instance.currentUser?.uid.toString();
    var id = FirebaseFirestore.instance.collection("film").get();
    return Scaffold(
body: Center(
  child:   Column(
    children:<Widget> [
      SizedBox(height: 160,),
      Text("E-posta =",style: TextStyle(fontSize: 24),),
  Text(email,style: TextStyle(fontSize: 24),),
  Text(id.toString(),style: TextStyle(fontSize: 24),),

      SizedBox(height: 100,),
      GestureDetector(child: Container(child: Text("Çıkış Yap",style: TextStyle(fontSize: 24,color: Colors.white),),color: Colors.black),onTap: () {
        FirebaseAuth.instance.signOut();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Login()));

      },),

    ],
  ),
),
    );
  }
}
