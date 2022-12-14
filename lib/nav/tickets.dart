import 'package:biletuygulama/nav/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// firebase
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  /// form variable
  late String tarih;
  late String film;
  late String seans;
  late String salonno;
  late TextEditingController dayTextController;
  late TextEditingController placeTextController;
  late TextEditingController taskTextController;
  late TextEditingController timeTextController;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    dayTextController = TextEditingController();
    placeTextController = TextEditingController();
    taskTextController = TextEditingController();
    timeTextController = TextEditingController();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    dayTextController.dispose();
    placeTextController.dispose();
    taskTextController.dispose();
    timeTextController.dispose();
    super.dispose();
  }

  void logout() {
    _auth.signOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  // _auth.signOut();
                  // Navigator.pop(context);
                  logout();
                  //   getMessages();
                  //Implement logout functionality
                }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'etkinlik ekle',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.blue,
                  ),
                ),
              ),
              TextField(
                controller: dayTextController,
                onChanged: (value) {
                  tarih = value;
                },
                decoration: InputDecoration(
                  hintText: 'Tarih',
                  alignLabelWithHint: true,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: placeTextController,
                onChanged: (value) {
                  salonno = value;
                },
                decoration: InputDecoration(
                  hintText: 'Salon No',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: taskTextController,
                onChanged: (value) {
                  film = value;
                },
                decoration: InputDecoration(
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  hintText: 'Film İsmi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: timeTextController,
                onChanged: (value) {
                  seans = value;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Seans',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  // elevation: 5.0,
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Kaydet',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      _fireStore.collection('Müsteri').add({
                        'tarih': tarih,
                        'film': film,
                        'salonno': salonno,
                        'seans': seans,
                        'müsteri': loggedInUser.email,
                        'olusturmazamani': Timestamp.now(),
                      });
                      dayTextController.clear();
                      placeTextController.clear();
                      taskTextController.clear();
                      timeTextController.clear();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Todo_List',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TodoList()),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}