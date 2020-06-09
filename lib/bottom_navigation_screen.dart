import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'bottom_navigation/account.dart';
import 'bottom_navigation/pizza.dart';
import 'home_screen.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currenttab = 0;
  var page = [
    HomeScreen(),
    PizzaScreen(),
    AccountScreen(),
  ];

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;

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
        body: page[_currenttab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currenttab,
          onTap: (int value) {
            setState(() {
              _currenttab = value;
            });
          },
          elevation: 20.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_pizza), title: Text("Pizza")),
            BottomNavigationBarItem(
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: _user != null
                      ? CachedNetworkImage(
                          width: 30,
                          height: 30,
                          imageUrl: _user.photoUrl,
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        )
                      : SpinKitFadingCircle(
                          color: Colors.red,
                          size: 50,
                        ),
                ),
                title: Text("Account"))
          ],
        ));
  }
}
