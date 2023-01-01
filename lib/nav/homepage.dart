
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

String a = "merhaba";
  // Initial Selected Value
  String dropdownvalue = 'Ankara';  
  String dropdownvalue2 = 'İstanbul';  
  var email = FirebaseAuth.instance.currentUser?.email.toString();
  var uid = FirebaseAuth.instance.currentUser?.uid.toString();

 
  // List of items in our dropdown menu
  var items = [   
    'İstanbul',
    'Konya',
    'Elazığ',
    'Ankara',
   
  ];
   var items2 = [   
    'İstanbul',
    'Konya',
    'Elazığ',
    'Ankara',
   
  ];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:<Widget> [
          SizedBox(height: 25,),
          Image.asset("assets/images/otobüs.png",width: 250,height: 250,),
          SizedBox(height: 60,),
         
    
    Row(
      
      
      
            children:<Widget> [
      
              
      
              SizedBox(width:60),
      
              
              Column(
                children: [
                  Text("Nereden",style: TextStyle(fontSize: 20),),
    SizedBox(height: 20,),
    
                  DropdownButton(
      
                     
      
                    // Initial Value
      
                    value: dropdownvalue,
      
                    
      
                     
      
                    // Down Arrow Icon
      
                    icon: const Icon(Icons.keyboard_arrow_down),   
      
                     
      
                    // Array list of items
      
                    items: items.map((String items) {
      
                      return DropdownMenuItem(
      
                        value: items,
      
                        child: Text(items),
      
                      );
      
                    }).toList(),
      
                    // After selecting the desired option,it will
      
                    // change button value to selected value
      
                    onChanged: (String? newValue) {
      
                      setState(() {
      
                        dropdownvalue = newValue!;
      
                      });
      
                    },
      
                  ),
                ],
              ),
      
      
      
              SizedBox(width:100),
      
              Column(
                children: [
                  Text("Nereye",style: TextStyle(fontSize: 20),),
    SizedBox(height: 20,),
                  DropdownButton(
      
                     
      
                    // Initial Value
      
                    value: dropdownvalue2,
      
                     
      
                    // Down Arrow Icon
      
                    icon: const Icon(Icons.keyboard_arrow_down),   
      
                     
      
                    // Array list of items
      
                    items: items2.map((String items2) {
      
                      return DropdownMenuItem(
      
                        value: items2,
      
                        child: Text(items2),
      
                      );
      
                    }).toList(),
      
                    // After selecting the desired option,it will
      
                    // change button value to selected value
      
                    onChanged: (String? newValue2) {
      
                      setState(() {
      
                        dropdownvalue2 = newValue2!;
      
                      });
      
                    },
      
                  ),
                ],
              ),
      
            ],
      
          ),
    SizedBox(height: 20,),
    
            
      if(dropdownvalue=="Ankara"&&dropdownvalue2=="İstanbul")...[
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
                       Text("12.17.2022",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
    
                       TextButton(
                         child: const Text('Rezervasyon Yap'),
                         onPressed: () {
                          
                           FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                             
                               'Güzergah': 'Ankara-İstanbul',
                               'Tarih': '12.17.2022 ',
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
      ],
    
      if(dropdownvalue=="Ankara"&&dropdownvalue2=="İstanbul")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/huzur.jpg",width: 80,height: 150,),
                     title: Text('Huzur Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('Ankara Otogarı - İstanbul Esenler Otogarı',style: TextStyle(fontSize: 16)),
    
                   ),
    
                   Row(
    
                     children: <Widget>[
                       SizedBox(width:20,),
                       Text("Saat = 17:35",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
                       Text("12.26.2022",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
    
                       TextButton(
                         child: const Text('Rezervasyon Yap'),
                         onPressed: () {
                          
                           FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                             
                               'Güzergah': 'Ankara-İstanbul',
                               'Tarih': '12.26.2022 ',
                               'Saat': '17:35 ',
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
      ],
    
    if(dropdownvalue=="Ankara"&&dropdownvalue2=="İstanbul")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/pamukkale.jpg",width: 80,height: 150,),
                     title: Text('Pamukkale Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('Ankara Otogarı - İstanbul Esenler Otogarı',style: TextStyle(fontSize: 16)),
    
                   ),
    
                   Row(
    
                     children: <Widget>[
                       SizedBox(width:20,),
                       Text("Saat = 14:00",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
                       Text("12.28.2022",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
    
                       TextButton(
                         child: const Text('Rezervasyon Yap'),
                         onPressed: () {
                          
                           FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                             
                               'Güzergah': 'Ankara-İstanbul',
                               'Tarih': '12.28.2022 ',
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
      ],
    
      if(dropdownvalue=="Ankara"&&dropdownvalue2=="Konya")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/kamilkoc.png",width: 80,height: 150,),
                     title: Text('Kamil Koç Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('Ankara Otogarı - Konya Otogarı',style: TextStyle(fontSize: 16)),
    
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
                             
                               'Güzergah': 'Ankara-Konya',
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
      ],
    
      if(dropdownvalue=="Ankara"&&dropdownvalue2=="Elazığ")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/ulusoy.png",width: 80,height: 150,),
                     title: Text('Ulusoy Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('Ankara Otogarı - Elazığ Otogarı',style: TextStyle(fontSize: 16)),
    
                   ),
    
                   Row(
    
                     children: <Widget>[
                       SizedBox(width:20,),
                       Text("Saat = 17:00",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
                       Text("12.24.2022",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
    
                       TextButton(
                         child: const Text('Rezervasyon Yap'),
                         onPressed: () {
                          
                           FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                             
                               'Güzergah': 'Ankara-Elazığ',
                               'Tarih': '12.26.2022 ',
                               'Saat': '17:25 ',
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
      ],
    
    if(dropdownvalue=="Elazığ"&&dropdownvalue2=="İstanbul")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/pamukkale.jpg",width: 80,height: 150,),
                     title: Text('Pamukkale Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('Elazığ Otogarı - İstanbul Esenler Otogarı',style: TextStyle(fontSize: 16)),
    
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
                             
                               'Güzergah': 'Elazığ-İstanbul',
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
      ],
    
    
    if(dropdownvalue=="Elazığ"&&dropdownvalue2=="Ankara")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/huzur.jpg",width: 80,height: 150,),
                     title: Text('Huzur Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('Elazığ Otogarı - Ankara Otogarı',style: TextStyle(fontSize: 16)),
    
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
                             
                               'Güzergah': 'Elazığ-Ankara',
                               'Tarih': '12.24.2022 ',
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
      ],
    if(dropdownvalue=="Elazığ"&&dropdownvalue2=="Konya")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/pamukkale.jpg",width: 80,height: 150,),
                     title: Text('Pamukkale Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('Elazığ Otogarı - Konya Otogarı',style: TextStyle(fontSize: 16)),
    
                   ),
    
                   Row(
    
                     children: <Widget>[
                       SizedBox(width:20,),
                       Text("Saat = 19:00",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
                       Text("12.24.2022",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
    
                       TextButton(
                         child: const Text('Rezervasyon Yap'),
                         onPressed: () {
                          
                           FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                             
                               'Güzergah': 'Elazığ-Konya',
                               'Tarih': '12.24.2022 ',
                               'Saat': '19:00 ',
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
      ],
    
if(dropdownvalue=="Elazığ"&&dropdownvalue2=="İstanbul")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/huzur.jpg",width: 80,height: 150,),
                     title: Text('Huzur Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('Elazığ Otogarı - İstanbul Otogarı',style: TextStyle(fontSize: 16)),
    
                   ),
    
                   Row(
    
                     children: <Widget>[
                       SizedBox(width:20,),
                       Text("Saat = 19:00",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
                       Text("12.30.2022",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
    
                       TextButton(
                         child: const Text('Rezervasyon Yap'),
                         onPressed: () {
                          
                           FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                             
                               'Güzergah': 'Elazığ-İstanbul',
                               'Tarih': '12.30.2022 ',
                               'Saat': '19:00 ',
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
      ],

    
      if(dropdownvalue=="Konya"&&dropdownvalue2=="İstanbul")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/huzur.jpg",width: 80,height: 150,),
                     title: Text('Huzur Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('Konya Otogarı - İstanbul Otogarı',style: TextStyle(fontSize: 16)),
    
                   ),
    
                   Row(
    
                     children: <Widget>[
                       SizedBox(width:20,),
                       Text("Saat = 06:00",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
                       Text("12.24.2022",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
    
                       TextButton(
                         child: const Text('Rezervasyon Yap'),
                         onPressed: () {
                          
                           FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                             
                               'Güzergah': 'Konya-İstanbul',
                               'Tarih': '12.24.2022 ',
                               'Saat': '06:00 ',
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
      ],
    
    
      if(dropdownvalue=="Konya"&&dropdownvalue2=="Elazığ")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/huzur.jpg",width: 80,height: 150,),
                     title: Text('Huzur Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('Konya Otogarı - Elazığ Otogarı',style: TextStyle(fontSize: 16)),
    
                   ),
    
                   Row(
    
                     children: <Widget>[
                       SizedBox(width:20,),
                       Text("Saat = 08:00",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
                       Text("12.26.2022",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
    
                       TextButton(
                         child: const Text('Rezervasyon Yap'),
                         onPressed: () {
                          
                           FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                             
                               'Güzergah': 'Konya-Elazığ',
                               'Tarih': '12.26.2022 ',
                               'Saat': '08:00 ',
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
      ],
    
    
      if(dropdownvalue=="Konya"&&dropdownvalue2=="Ankara")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/ulusoy.png",width: 80,height: 150,),
                     title: Text('Ulusoy Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('Konya Otogarı - Ankara Otogarı',style: TextStyle(fontSize: 16)),
    
                   ),
    
                   Row(
    
                     children: <Widget>[
                       SizedBox(width:20,),
                       Text("Saat = 09:00",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
                       Text("19.26.2022",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
    
                       TextButton(
                         child: const Text('Rezervasyon Yap'),
                         onPressed: () {
                          
                           FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                             
                               'Güzergah': 'Konya-Ankara',
                               'Tarih': '19.26.2022 ',
                               'Saat': '09:00 ',
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
      ],
    
    
    
      if(dropdownvalue=="İstanbul"&&dropdownvalue2=="Konya")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/pamukkale.jpg",width: 80,height: 150,),
                     title: Text('Pamukkale Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('İstanbul Otogarı - Konya Otogarı',style: TextStyle(fontSize: 16)),
    
                   ),
    
                   Row(
    
                     children: <Widget>[
                       SizedBox(width:20,),
                       Text("Saat = 18:00",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
                       Text("12.18.2022",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
    
                       TextButton(
                         child: const Text('Rezervasyon Yap'),
                         onPressed: () {
                          
                           FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                             
                               'Güzergah': 'İstanbul-Konya',
                               'Tarih': '12.18.2022 ',
                               'Saat': '18:00 ',
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
      ],


      if(dropdownvalue=="İstanbul"&&dropdownvalue2=="Ankara")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/kamilkoc.png",width: 80,height: 150,),
                     title: Text('Kamil Koç Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('İstanbul Otogarı - Ankara Otogarı',style: TextStyle(fontSize: 16)),
    
                   ),
    
                   Row(
    
                     children: <Widget>[
                       SizedBox(width:20,),
                       Text("Saat = 18:00",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
                       Text("12.18.2022",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
    
                       TextButton(
                         child: const Text('Rezervasyon Yap'),
                         onPressed: () {
                          
                           FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                             
                               'Güzergah': 'İstanbul-Ankara',
                               'Tarih': '12.18.2022 ',
                               'Saat': '18:00 ',
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
      ],


      if(dropdownvalue=="İstanbul"&&dropdownvalue2=="Elazığ")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/pamukkale.jpg",width: 80,height: 150,),
                     title: Text('Pamukkale Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('İstanbul Otogarı - Elazığ Otogarı',style: TextStyle(fontSize: 16)),
    
                   ),
    
                   Row(
    
                     children: <Widget>[
                       SizedBox(width:20,),
                       Text("Saat = 18:00",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
                       Text("12.18.2022",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
    
                       TextButton(
                         child: const Text('Rezervasyon Yap'),
                         onPressed: () {
                          
                           FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                             
                               'Güzergah': 'İstanbul-Elazığ',
                               'Tarih': '12.18.2022 ',
                               'Saat': '18:00 ',
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
      ],
    
    
      if(dropdownvalue=="İstanbul"&&dropdownvalue2=="Elazığ")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/kamilkoc.png",width: 80,height: 150,),
                     title: Text('Kamil Koç Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('İstanbul Otogarı - Elazığ Otogarı',style: TextStyle(fontSize: 16)),
    
                   ),
    
                   Row(
    
                     children: <Widget>[
                       SizedBox(width:20,),
                       Text("Saat = 17:00",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
                       Text("12.06.2022",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
    
                       TextButton(
                         child: const Text('Rezervasyon Yap'),
                         onPressed: () {
                          
                           FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                             
                               'Güzergah': 'İstanbul-Elazığ',
                               'Tarih': '12.06.2022 ',
                               'Saat': '17:00 ',
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
      ],
    
    
      if(dropdownvalue=="İstanbul"&&dropdownvalue2=="Ankara")...[
        Card(
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     leading:Image.asset("assets/images/pamukkale.jpg",width: 80,height: 150,),
                     title: Text('Pamukkale Turizm',style: TextStyle(fontSize: 18)),
                     subtitle: Text('İstanbul Otogarı - Ankara Otogarı',style: TextStyle(fontSize: 16)),
    
                   ),
    
                   Row(
    
                     children: <Widget>[
                       SizedBox(width:20,),
                       Text("Saat = 19:25",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
                       Text("12.09.2022",style: TextStyle(fontSize: 20)),
                       SizedBox(width: 10,),
    
                       TextButton(
                         child: const Text('Rezervasyon Yap'),
                         onPressed: () {
                          
                           FirebaseFirestore.instance.collection('Rezervasyon').doc(uid).set({
                             
                               'Güzergah': 'İstanbul-Ankara',
                               'Tarih': '12.09.2022 ',
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
      ],
      SizedBox(height: 120,),
    
        ],
      
      ),
    );
  }
}