
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';



class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);
   final _fireStore = FirebaseFirestore.instance;
   final _auth = FirebaseAuth.instance;
  var uid = FirebaseAuth.instance.currentUser?.uid.toString();
  var email = FirebaseAuth.instance.currentUser?.email.toString();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
         children:<Widget> [
           SizedBox(height: 20,),

Card(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 ListTile(
                   leading:Image.asset("assets/images/ulusoy.png",width: 80,height: 150,),
                   title: Text('Ulusoy Turizm',style: TextStyle(fontSize: 18)),
                   subtitle: Text('Ankara Otogarı - İstanbul Esenler Otogarı',style: TextStyle(fontSize: 16)),

                 ),

                 Row(

                   children: <Widget>[
                     SizedBox(width:20,),
                     Text("Saat = 14:00",style: TextStyle(fontSize: 20)),
                     SizedBox(width: 10,),
                     Text("12.24.2022",style: TextStyle(fontSize: 20)),
                     SizedBox(width: 10,),

                     TextButton(
                       child: const Text('Rezervasyon Yap'),
                       onPressed: () {
                        
                         FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                           
                             'Güzergah': 'Ankara-İstanbul',
                             'Tarih': '12.26.2022 ',
                             'Saat': '19:25 ',
                             'Kullanici': '$email ',


                          });
                          
    var snackBar = SnackBar(content: Text('Rezervasyonunuz Yapılmıştır'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                           ;},
                     ),
                     const SizedBox(width: 8),


                   ],
                 ),
               ],
             ),
           ),
          
           SizedBox(height: 20,),
           Card(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 ListTile(
                   leading:Image.asset("assets/images/kamilkoc.png",width: 80,height: 150,),
                   title: Text('Kamil Koç',style: TextStyle(fontSize: 18)),
                   subtitle: Text('Konya Otogarı - İstanbul Esenler Otogarı',style: TextStyle(fontSize: 16)),

                 ),

                 Row(

                   children: <Widget>[
                     SizedBox(width:20,),
                     Text("Saat = 19:25",style: TextStyle(fontSize: 20)),
                     SizedBox(width: 10,),
                     Text("12.26.2022",style: TextStyle(fontSize: 20)),
                     SizedBox(width: 10,),

                     TextButton(
                       child: const Text('Rezervasyon Yap'),
                       onPressed: () {
                         FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                           'Kamil Koç': {
                             'Güzergah': 'Konya-İstanbul',
                             'Tarih': '12.26.2022 ',
                             'Saat': '19:25 ',
                             'Kullanici': '$email ',


                           }})
                           ;
                          
    var snackBar = SnackBar(content: Text('Rezervasyonunuz Yapılmıştır'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);;},
                     ),
                     const SizedBox(width: 8),


                   ],
                 ),
               ],
             ),
           ),
           SizedBox(height: 20,),
           Card(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 ListTile(
                   leading:Image.asset("assets/images/pamukkale.jpg",width: 80,height: 150,),
                   title: Text('Pamukkale Turizm',style: TextStyle(fontSize: 18)),
                   subtitle: Text('Manisa Salihli Otogarı - İstanbul Esenler Otogarı',style: TextStyle(fontSize: 16)),

                 ),

                 Row(

                   children: <Widget>[
                     SizedBox(width:20,),
                     Text("Saat = 13:15",style: TextStyle(fontSize: 20)),
                     SizedBox(width: 10,),
                     Text("12.28.2022",style: TextStyle(fontSize: 20)),
                     SizedBox(width: 10,),

                     TextButton(
                       child: const Text('Rezervasyon Yap'),
                       onPressed: () {
                         FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                         'Pamukkale Turizm': {
                           'Güzergah': 'Manisa-İstanbul',
                           'Tarih': '12.28.2022 ',
                           'Saat': '13:15 ',
                           'Kullanici': '$email ',


                         }})
                         ;
                          
    var snackBar = SnackBar(content: Text('Rezervasyonunuz Yapılmıştır'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);;},
                     ),
                     const SizedBox(width: 8),


                   ],
                 ),
               ],
             ),
           ),

         ],
      ),
    );
  }
}
