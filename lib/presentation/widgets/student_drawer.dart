import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toyo/presentation/screens/chatwithtoyo.dart';
import 'package:toyo/presentation/screens/loginpage.dart';
import 'package:toyo/presentation/screens/registerpage.dart';
import 'package:toyo/presentation/screens/student/student_dashboard/joined_tutions.dart';
import 'package:toyo/presentation/screens/student/student_dashboard/searchtution_page.dart';
import 'package:toyo/presentation/screens/student/student_details/Student_profile_page_update.dart';
import 'package:velocity_x/velocity_x.dart';

Widget studentDrawer(
    BuildContext context, String currname, String currphonenumber) {
  return Drawer(
    child: new ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff403b58),
            ),
            accountName: new Text(
              currname,
              style: TextStyle(color: Colors.white),
            ),
            accountEmail: new Text(currphonenumber,
                style: TextStyle(color: Colors.white)),
            currentAccountPicture: Image.network(
              "https://media-exp1.licdn.com/dms/image/C4D03AQFCPQhDr6JYkA/profile-displayphoto-shrink_800_800/0/1615564092893?e=1627516800&v=beta&t=lPoIo7M54sPj1FzLk1ed5NgPfMXWRwxYk-tmVxw4wGc",
            ).cornerRadius(50)),
        new ListTile(
          title: new Text("Edit Profile"),
          trailing: new Icon(Icons.edit_rounded),
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentProfilePage()),
            )
          },
        ),
        new ListTile(
          title: new Text("Your Classes"),
          trailing: new Icon(Icons.class__rounded),
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JoinedTutions()),
            )
          },
        ),
        new ListTile(
          title: new Text("Join More Tutions"),
          trailing: new Icon(Icons.cast_for_education),
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchTutionPage()),
            )
          },
        ),
        new ListTile(
          title: new Text("Chat Support"),
          trailing: new Icon(Icons.chat_bubble_rounded),
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatwithToyo()),
            )
          },
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
