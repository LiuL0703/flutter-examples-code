import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home.dart';
import 'user.dart';

class GoogleSignInAndOut extends StatefulWidget {
  _GoogleSignInAndOutState createState() => _GoogleSignInAndOutState();
}

class _GoogleSignInAndOutState extends State<GoogleSignInAndOut> {
  String _username = "";
  Widget currentPage;
  Widget userPage;
  GoogleSignIn googleSignIn;
  
  @override
  void initState() { 
    super.initState();
    userPage = new Home(
      onSignin:(){
        _signin();
        print("Sigin");
      },
      onLogout: _logout,
      showLoading: false,
    );
  }
  
  Future<FirebaseUser> _signin() async{
    setState(() {
      userPage = new Home(onSignin: null, onLogout: _logout,showLoading: true);
    });
    FirebaseAuth _auth = FirebaseAuth.instance;
    try{
      googleSignIn = new GoogleSignIn();
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication gauth = 
          await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: gauth.accessToken,
        idToken: gauth.idToken,
      );
      FirebaseUser user = await _auth.signInWithCredential(credential);
    // FirebaseUser user = await _auth.signInWithGoogle(
    //   accessToken: gauth.accessToken,
    //   idToken: gauth.idToken,
    // );

      setState(() {
        _username = user.displayName;
        userPage = new User(
          onLogout: _logout,
          user: user
        );
      });
    } catch(e){
      print(e.toString());
    }
    return null;
  }

  void _logout() async{
    await googleSignIn.signOut();
    setState(() {
      userPage = new Home(
        onSignin: (){
          _signin();
          print('Sign');
        },
        onLogout: _logout,
        showLoading: false,
      );
    });
    print("Logged out");
  }
  @override
  Widget build(BuildContext context) {
    // return new Scaffold(
    //   appBar: new AppBar(
    //     title: new Text("Google Signin & LoggedOut"),
    //   ),
    //   body: new Container(
    //     child: userPage,
    //   ),
    // );
    new MaterialApp(
      home: userPage,
    );
  }
}