import 'package:carapp/pallet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//google provider
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GoogleSignIn googleAuth = GoogleSignIn();

  void login() async {
    try {
      GoogleSignInAccount googleuser = googleAuth.currentUser;
      googleuser = await googleAuth.signIn();

      GoogleSignInAuthentication googleAuthUser =
          await googleuser.authentication;

      AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuthUser.accessToken,
          idToken: googleAuthUser.idToken);

      AuthResult authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);

      print(authResult.user.email);
    } catch (err) {
      print('error : ${err.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
            decoration: containerStyle(),
            child: Center(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: googleButton()))));
  }

  Widget googleButton() => RaisedButton(
      onPressed: () => login(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: Colors.red,
      child: Row(
        children: <Widget>[
          Icon(
            FontAwesomeIcons.google,
            color: Colors.white,
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Entrar com conta google',
              style: textButtonStyle(),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ));

  //Styles functions
  Decoration containerStyle() => BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Pallet.primaryColor,
              Colors.white,
            ]),
      );

  TextStyle textButtonStyle() =>
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
}
