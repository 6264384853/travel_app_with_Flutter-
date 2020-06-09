import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final  text;
  final bool hasNavigation;

  ProfileListItem({Key key, this.icon, this.text, this.hasNavigation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(

        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10 ),
        width: 380,
        padding: EdgeInsets.only(left: 25,top: 12,right: 8,bottom: 12),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              this.icon,
              size: 25,
              color: Colors.white,
            ),
            Center(
                child: Text('${this.text}',style: TextStyle(
                  fontSize: 17,
                  color: Colors.white
                ),)
            ),
            Icon(Icons.chevron_right,size: 30,color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
