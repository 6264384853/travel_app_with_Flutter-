import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travelappui/bottom_navigation_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void initState() {
    fetch_data();
    super.initState();
  }

  void fetch_data() async {
    FirebaseUser u = await _auth.currentUser();
    setState(() {
      _user = u;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            signInusingGoogle();
            },
          child: Text('Google Sign In'),

        ),
      ),
    );
  }


  void signInusingGoogle() async {
    try {
      final GoogleSignInAccount googleuser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleuser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      print("Signed in : " + user.providerId);

      // Firebase firestore saving  data


      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Navigation()));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              elevation: 40.0,
              title: Text("Error"),
              content: Text("${e.message}"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }
}
