import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelappui/home_screen.dart';

import '../bottom_navigation_screen.dart';
import '../profileListItem.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Navigation()));
                    },
                    child: Icon(Icons.home))
              ],
            ),
          ),
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: _user != null
                    ? CachedNetworkImage(
                        imageUrl: _user.photoUrl,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        width: 100,
                        height: 100,
                      )
                    : SpinKitFadingCircle(
                        color: Colors.red,
                        size: 50,
                      ),
              ),
              Positioned(
                bottom: 0,
                right: 1,
                child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                    child: Center(
                      child: Icon(
                        FontAwesomeIcons.pen,
                        color: Colors.black,
                        size: 15,
                      ),
                    )),
              )
            ],
          ),
          _user != null
              ? Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    _user.displayName,
                    style: TextStyle(
                        fontSize: 20, color: Colors.black, letterSpacing: 1.2),
                  ))
              : CircularProgressIndicator(),
          _user != null
              ? Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    _user.email,
                    style: TextStyle(
                        fontSize: 12, color: Colors.black, letterSpacing: 0.5),
                  ))
              : CircularProgressIndicator(),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: 230,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 12.0,
                ),
              ],
              color: Colors.orange,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Center(
                child: Text(
              "Upgrade to PRO",
              style: TextStyle(fontSize: 18.0),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                ProfileListItem(
                  icon: FontAwesomeIcons.userShield,
                  text: 'Privacy',
                ),
                ProfileListItem(
                  icon: FontAwesomeIcons.history,
                  text: 'Purchase History',
                ),
                ProfileListItem(
                  icon: FontAwesomeIcons.questionCircle,
                  text: 'Help \$ Support',
                ),
                ProfileListItem(
                  icon: FontAwesomeIcons.cog,
                  text: 'Settings',
                ),
                ProfileListItem(
                  icon: FontAwesomeIcons.userPlus,
                  text: 'Invite a Friend',
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Confirm"),
                          content: Text("Are you sure want to logout?"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          actions: [
                            FlatButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text("Logout"),
                              onPressed: () {
                                _auth.signOut();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ProfileListItem(
                    icon: FontAwesomeIcons.signOutAlt,
                    text: 'Logout',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
