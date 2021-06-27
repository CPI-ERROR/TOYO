import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toyo/data/models/joinedtutionmodel.dart';
import 'package:toyo/data/net/firebase.dart';
import 'package:toyo/presentation/screens/student/student_dashboard/joined_tutions.dart';

class PaymentPage extends StatefulWidget {
  String studentID;
  String tutionID;
  PaymentPage(this.studentID, this.tutionID);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Pay Tution Fee',
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 30.0,
              color: Colors.black,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0.0, 3.0),
                  blurRadius: 4.0,
                  color: Color(0xff7e7474),
                ),
              ],
              // fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 55.0,
            width: 200.0,
          ),
          Card(
            color: Color(0xffff96ad),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 45.0),
            child: ListTile(
              onTap: () {
                studenttutionConnection(widget.studentID, widget.tutionID);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => JoinedTutions()));
              },
              title: Center(
                child: Text(
                  'Pay',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSansPro',
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
