import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  late User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
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
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            ///
            stream: _fireStore
                .collection('Müsteri')
                .orderBy('olusturmazamani', descending: false)
                .snapshots(),


            builder: (context, snapshot) {
              List<MessageBubble> todoWidgets = [];
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                );
              }
              final todoLists = snapshot.data!.docs;

              for (var todoList in todoLists) {
                final bakiye = (todoList.data() as dynamic)['bakiye'];

                final tarih= (todoList.data() as dynamic)['tarih'];
                final salonno = (todoList.data() as dynamic)['salonno'];

                final film = (todoList.data() as dynamic)['film'];

                final seans = (todoList.data() as dynamic)['seans'];

                final loggedIn = (todoList.data() as dynamic)['biletSahibi'];


                final currentUser = loggedInUser.email;


                final messageWidget = MessageBubble(
                  bakiye:'$bakiye',
                  tarih: '$tarih',
                  isLoggedIn: currentUser == loggedIn,
                  salonno: '$salonno',
                  film: '$film',
                  seans: '$seans',
                );

                todoWidgets.add(messageWidget);
              }

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(children: todoWidgets),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(

      {
        required this.bakiye,

        required this.isLoggedIn,
        required this.tarih,
        required this.film,
        required this.seans,
        required this.salonno
      });
  final String tarih;
  final String film;
  final String seans;
  final String salonno;
  final bool isLoggedIn;
   var bakiye;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(
            children: [
              Text('$film',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30.0, color: Colors.black)),
            ],
          ),
          Material(
              elevation: 5.0,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0)),
              color: Colors.lightBlueAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('$tarih',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('$salonno',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('$tarih',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          )),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}