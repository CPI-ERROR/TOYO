import 'package:flutter/material.dart';
import 'package:toyo/core/constants/strings.dart';
import 'package:toyo/presentation/screens/tution/registration/tutionform2.dart';
import 'package:toyo/presentation/widgets/button_widget.dart';

class TutionForm1 extends StatelessWidget {
  final String phonenumber;

  TutionForm1(this.phonenumber);

  final tutionnamecontroller = new TextEditingController();
  final addresscontroller = new TextEditingController();
  final pincodecontroller = new TextEditingController();
  final emailcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Tution Registration", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff403b58),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 24),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Text(Strings.teacherRegTitle),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: tutionnamecontroller,
                      decoration: InputDecoration(
                        hintText: "Enter Name",
                        labelText: "Your Coaching/Tution Name",
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
                        hintText: "Please Enter Your Full Address",
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
                        hintText: "Enter Your city PIN Code",
                        labelText: "PIN Code",
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
                    TextFormField(
                      controller: emailcontroller,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: "Enter Email ID",
                        labelText: "Email ID",
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
                    GestureDetector(
                        onTap: () {
                          // tutionSetup1(tutionnamecontroller.text,
                          //     addresscontroller.text, pincodecontroller.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TutionForm2(
                                        tutionnamecontroller.text,
                                        addresscontroller.text,
                                        pincodecontroller.text,
                                        emailcontroller.text,
                                        phonenumber.toString(),
                                      )));
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
