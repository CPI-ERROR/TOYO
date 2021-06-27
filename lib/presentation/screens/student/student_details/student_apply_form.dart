import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toyo/data/net/firebase.dart';
import 'package:toyo/presentation/screens/student/student_dashboard/joined_tutions.dart';
import 'package:toyo/presentation/screens/student/student_dashboard/paymentpage.dart';
import 'package:toyo/presentation/widgets/button_widget.dart';

class StudentsApplyForm extends StatefulWidget {
  String tutionID;
  StudentsApplyForm(this.tutionID);

  @override
  _StudentsApplyFormState createState() => _StudentsApplyFormState();
}

class _StudentsApplyFormState extends State<StudentsApplyForm> {
  FirebaseAuth auth = FirebaseAuth.instance;

  String studentID;

  @override
  void initState() {
    super.initState();
    String uid = auth.currentUser.uid.toString();

    setState(() {
      studentID = uid;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application form", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff403b58),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 24),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Name",
                          labelText: "Your Name",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Cannot be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Please enter Your Full Address",
                          labelText: "Address",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Cannot be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: "Enter your PIN Code",
                          labelText: "PIN Code",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Cannot be empty";
                          } else if (value.length < 6) {
                            return "PIN COde Cannot be less than 10";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText:
                              "Enter the grade for which you want to apply",
                          labelText: "Your Grade",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Cannot be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      GestureDetector(
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentPage(
                                          studentID, widget.tutionID)));
                            }
                          },
                          child: blueButton(
                              context: context,
                              label: "Apply",
                              buttonWidth:
                                  MediaQuery.of(context).size.width / 2)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
