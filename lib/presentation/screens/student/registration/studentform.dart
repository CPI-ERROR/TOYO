import 'package:flutter/material.dart';
import 'package:toyo/core/constants/strings.dart';
import 'package:toyo/data/net/firebase.dart';
import 'package:toyo/presentation/screens/student/student_dashboard/joined_tutions.dart';
import 'package:toyo/presentation/widgets/button_widget.dart';

class StudentForm extends StatelessWidget {
  final String phonenumber;

  StudentForm(this.phonenumber);

  final studentnamecontroller = new TextEditingController();
  final addresscontroller = new TextEditingController();
  final pincodecontroller = new TextEditingController();
  final studentclasscontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff403b58),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 24),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Text("Student Registration"),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: studentnamecontroller,
                      decoration: InputDecoration(
                        hintText: "Enter Student's Name",
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
                      controller: studentclasscontroller,
                      decoration: InputDecoration(
                        hintText: "Please enter your class",
                        labelText: "Grade",
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
                      controller: addresscontroller,
                      decoration: InputDecoration(
                        hintText: "PLease Enter Your Full Address",
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
                      controller: pincodecontroller,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "PIN Code",
                        labelText: "Enter PIN Code",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Cannot be empty";
                        } else if (value.length < 6) {
                          return "PIN Code Cannot be less than 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    GestureDetector(
                        onTap: () {
                          studentSetup(
                              studentnamecontroller.text,
                              phonenumber.toString(),
                              addresscontroller.text,
                              pincodecontroller.text,
                              studentclasscontroller.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JoinedTutions()));
                        },
                        child: blueButton(
                            context: context,
                            label: "Next",
                            buttonWidth:
                                MediaQuery.of(context).size.width / 2)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
