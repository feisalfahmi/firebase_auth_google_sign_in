import 'package:flutter/material.dart';
import 'package:firebase_auth_google_signin/Login/navbar.dart';
import 'package:firebase_auth_google_signin/Login/authservice.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            OutlineButton(
              splashColor: Colors.grey,
              onPressed: () {
                auth.signInWithGoogle().whenComplete(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Navbar();
                      },
                    ),
                  );
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              highlightElevation: 0,
              borderSide: BorderSide(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                        image: AssetImage("assets/google_logo.png"),
                        height: 35.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

// Widget _signInButton() {
//   AuthService auth = Provider.of<AuthService>(context);
//   return OutlineButton(
//     splashColor: Colors.grey,
//     onPressed: () {
//       auth.signInWithGoogle().whenComplete(() {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) {
//               return Navbar();
//             },
//           ),
//         );
//       });
//     },
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     highlightElevation: 0,
//     borderSide: BorderSide(color: Colors.grey),
//     child: Padding(
//       padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
//           Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: Text(
//               'Sign in with Google',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.grey,
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
