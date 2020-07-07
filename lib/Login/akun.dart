import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth_google_signin/Login/authservice.dart';
import 'package:firebase_auth_google_signin/Login/login.dart';
import 'package:provider/provider.dart';

class Akun extends StatefulWidget {
  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> {
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
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.red,
                onPressed: () async {
                  FirebaseAuth.instance.signOut();
                  auth.googleSignIn.disconnect();
                  auth.googleSignIn.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Login()),
                      (Route<dynamic> route) => false);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                highlightElevation: 0,
                //borderSide: BorderSide(color: Colors.grey),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.exit_to_app, color: Colors.white),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Sign Out',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
