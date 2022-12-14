
import 'package:biletuygulama/nav/homepage.dart';
import 'package:biletuygulama/nav/profile.dart';
import 'package:biletuygulama/nav/tickets.dart';
import 'package:biletuygulama/nav/todo.dart';
import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';



class Nav extends StatefulWidget {
  Nav({Key ?key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        controller: _controller,
        children: <Widget>[
          Home(),
          HomePage(),
          ProfilePage(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(color: Colors.black
        ,
        controller: _controller,
        flat: true,
        useActiveColorByDefault: false,
        items: [
          RollingBottomBarItem(Icons.star, label: 'Etkinlikler', activeColor: Colors.white),

          RollingBottomBarItem(Icons.home, label: 'AnaSayfa', activeColor: Colors.white),
          RollingBottomBarItem(Icons.person, label: 'Profilim', activeColor: Colors.white),
        ],
        enableIconRotation: true,
        onTap: (index) {
          _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
}