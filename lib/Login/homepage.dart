import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_google_signin/Login/authservice.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    //Check current user in this page
    FirebaseAuth.instance.onAuthStateChanged.listen((user) {
      if (user != null) {
        print('My Name ' + user.displayName);
      } else {
        print('Nothing People in this page');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    return StreamBuilder<FirebaseUser>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            FirebaseUser user = snapshot.data;
            if (user != null) {
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            user.photoUrl,
                          ),
                          radius: 60,
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(height: 20),
                        Text(user.displayName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                        Text(user.email,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            )),
                      ],
                    )),
                  ),
                ),
              );
            } else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
