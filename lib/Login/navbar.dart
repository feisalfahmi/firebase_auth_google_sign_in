import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_google_signin/Login/akun.dart';
import 'package:firebase_auth_google_signin/Login/authservice.dart';
import 'package:firebase_auth_google_signin/Login/homepage.dart';
import 'package:provider/provider.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentTab = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    return StreamBuilder<FirebaseUser>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          return Scaffold(
            body: PageView(
              controller: _pageController,
              children: <Widget>[
                HomePage(),
                Akun(),
              ],
              onPageChanged: (int index) {
                setState(() {
                  _currentTab = index;
                });
              },
            ),
            bottomNavigationBar: CupertinoTabBar(
              currentIndex: _currentTab,
              onTap: (int index) {
                setState(() {
                  _currentTab = index;
                });
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
              },
              backgroundColor: Colors.white,
              activeColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 32.0,
                  ),
                  title: Text("Home"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 32.0,
                  ),
                  title: Text("Profile"),
                ),
              ],
            ),
          );
        });
  }
}
