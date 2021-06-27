import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toyo/presentation/screens/registerpage.dart';
import 'package:velocity_x/velocity_x.dart';

Widget tutionDrawer(
    BuildContext context, String currname, String currphonenumber) {
  return Drawer(
    child: new ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff403b58),
            ),
            accountName:
                new Text(currname, style: TextStyle(color: Colors.white)),
            accountEmail: new Text(currphonenumber,
                style: TextStyle(color: Colors.white)),
            currentAccountPicture: Image.network(
              "https://c.stocksy.com/a/jV3000/z9/13499.jpg",
            ).cornerRadius(50)),
        new ListTile(
          title: new Text("Edit Profile"),
          trailing: new Icon(Icons.edit_rounded),
          onTap: () => {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => StudentProfilePage()),
            // )
          }, //profile update k liye form dal denge
        ),
        new ListTile(
          title: new Text("Your Students"),
          trailing: new Icon(Icons.class__rounded),
          onTap: () => {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => JoinedTutions()),
            // )
          }, //students ki list dal denge
        ),
        new ListTile(
          title: new Text("Add faculties"),
          trailing: new Icon(Icons.cast_for_education),
          onTap: () => {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SearchTutionPage()),
            // )
          }, //faculties vala form add kr denge
        ),
        new ListTile(
          title: new Text("Messages"),
          trailing: new Icon(Icons.chat_bubble_rounded),
          onTap: () => {},
        ),
        Divider(),
        new ListTile(
          title: new Text("Close"),
          trailing: new Icon(Icons.clear),
          onTap: () => Navigator.of(context).pop(),
        ),
        new ListTile(
          title: new Text("Logout"),
          trailing: new Icon(Icons.logout),
          onTap: () async => {
            await FirebaseAuth.instance.signOut(),
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
                (route) => false)
          },
        ),
      ],
    ),
  );
}
