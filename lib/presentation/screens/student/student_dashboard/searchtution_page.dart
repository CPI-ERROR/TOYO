import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toyo/presentation/screens/student/student_dashboard/tutions_list.dart';
import 'package:toyo/presentation/widgets/student_drawer.dart';

class SearchTutionPage extends StatefulWidget {
  @override
  _SearchTutionPageState createState() => _SearchTutionPageState();
}

class _SearchTutionPageState extends State<SearchTutionPage> {
  TextEditingController _textFieldController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  String currname = "k";

  String currphonenumber = "891";

  Future<void> _getUserName() async {
    String uid = auth.currentUser.uid.toString();
    FirebaseFirestore.instance
        .collection('Students')
        .doc(uid)
        .get()
        .then((value) {
      setState(() {
        currname = value.data()['StudentName'].toString();
        currphonenumber = value.data()['MobileNumber'].toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserName();
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter PinCode'),
            content: Form(
              key: _formKey,
              child: TextFormField(
                controller: _textFieldController,
                decoration: InputDecoration(hintText: "eg - 800014"),
                validator: (value) {
                  if (value.length != 6) {
                    return "Please enter valid pincode";
                  }
                  return null;
                },
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Search'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TutionsList(_textFieldController.text);
                    }));
                  }
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff403b58),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text("TOYO", style: TextStyle(color: Colors.white)),
      ),
      drawer: studentDrawer(context, currname, currphonenumber),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Search Nearest Classes',
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
            color: Color(0xff403b58),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 45.0),
            child: ListTile(
              onTap: () {},
              title: Center(
                child: Text(
                  'By Your Location',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSansPro',
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
          ),
          Card(
            color: Color(0xff403b58),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 45.0),
            child: ListTile(
              onTap: () {
                _displayDialog(context);
              },
              title: Center(
                child: Text(
                  'By Pincode',
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
