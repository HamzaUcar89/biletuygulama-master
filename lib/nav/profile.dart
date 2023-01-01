import 'package:biletuygulama/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatefulWidget {
   Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
var email = FirebaseAuth.instance.currentUser?.email.toString();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children:<Widget> [
        SizedBox(height: 250,),
        Text(email.toString(),style: TextStyle(fontSize: 24),),
        SizedBox(height: 30,),
        GestureDetector(child: Text("Çıkış Yap",style: TextStyle(fontSize: 24),),onTap: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()));
        },),


          ],
        ),
      ),
    );
  }
}