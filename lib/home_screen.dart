import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelappui/Hotel_carausel.dart';
import 'package:travelappui/destination_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                "What would you like to find ?",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(30.0)),
                  margin: EdgeInsets.all(12),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.plane,
                      color: Colors.lightBlue,
                    ),
                    onPressed: () {
                      print("btn 1 presseed");
                    },
                  ),
                ),
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(30.0)),
                  margin: EdgeInsets.all(12),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.bed,
                      color: Colors.lightBlue,
                    ),
                    onPressed: () {
                      print("btn 2 presseed");
                    },
                  ),
                ),
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(30.0)),
                  margin: EdgeInsets.all(12),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.walking,
                      color: Colors.lightBlue,
                    ),
                    onPressed: () {
                      print("btn 3 presseed");
                    },
                  ),
                ),
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(30.0)),
                  margin: EdgeInsets.all(12),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.biking,
                      color: Colors.lightBlue,
                    ),
                    onPressed: () {
                      print("btn 4 presseed");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            DestinationCarousel(),
            SizedBox(
              height: 20.0,
            ),
            HotelCarausel(),
          ],
        ),
      ),
    );
  }
}
