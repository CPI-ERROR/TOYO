import 'package:flutter/material.dart';
import 'package:toyo/core/constants/strings.dart';
import 'package:toyo/data/net/firebase.dart';
import 'package:toyo/presentation/screens/tution/tution_dashboard/tution_dashboard.dart';
import 'package:toyo/presentation/widgets/button_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class TutionForm2 extends StatefulWidget {
  final String tutionname;
  final String address;
  final String pincode;
  final String emailid;
  final String phonenumber;
  TutionForm2(
    this.tutionname,
    this.address,
    this.pincode,
    this.emailid,
    this.phonenumber,
  );
  // TutionForm2(String tutionname, String address, String pincode,
  //     String phonenumber, String password);

  @override
  _TutionForm2State createState() => _TutionForm2State();
}

class _TutionForm2State extends State<TutionForm2> {
  bool valuefirst = false;
  bool valuesecond = false;
  // var _subjects = [
  //   "Maths"
  //       "Physics"
  //       "SST"
  //       "Hindi"
  //       "English"
  // ];
  // var _classes = [
  //   "Class 1-5"
  //       "Class 5-8"
  //       "Class 9,10"
  //       "partcilar Subject"
  // ];

  final classesdesccontroller = new TextEditingController();
  final subdesccontroller = new TextEditingController();
  final tutionfeecontroller = new TextEditingController();
  final acheivementcontroller = new TextEditingController();
  final desccontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Tution Registration",
          ),
          backgroundColor: Color(0xff403b58),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: new EdgeInsets.all(22.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),

                  TextFormField(
                    controller: desccontroller,
                    decoration: InputDecoration(
                      hintText: "about your tution",
                      labelText: "Description",
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    controller: classesdesccontroller,
                    decoration: InputDecoration(
                      hintText:
                          "PLease Enter the classes range of which teach in your tution",
                      labelText: "Description (Classes Range)",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Cannot be empty";
                      }
                      return null;
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    controller: subdesccontroller,
                    decoration: InputDecoration(
                      hintText:
                          "PLease Enter the subjects which are being taught in your tution",
                      labelText: "Description (Subjects)",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Cannot be empty";
                      }
                      return null;
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    controller: tutionfeecontroller,
                    decoration: InputDecoration(
                      hintText: "Please Enter tution fee (in digits)",
                      labelText: "Tution Fee",
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Cannot be empty";
                      }
                      return null;
                    },
                  ),

                  // AppDropdownInput(
                  //   hintText: "Subjects",
                  //   options: _subjects,
                  //   //value: subject,
                  //   onChanged: (String value) {
                  //     setState(() {
                  //       //gender = value;
                  //       // state.didChange(newValue);
                  //     });
                  //   },
                  //   getLabel: (String value) => value,
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  // AppDropdownInput(
                  //   hintText: "Classes",
                  //   options: _subjects,
                  //   //value: subject,
                  //   onChanged: (String value) {
                  //     setState(() {
                  //       //gender = value;
                  //       // state.didChange(newValue);
                  //     });
                  //   },
                  //   getLabel: (String value) => value,
                  // ),

                  TextFormField(
                    controller: acheivementcontroller,
                    decoration: InputDecoration(
                      hintText: "Acheivements of your tution",
                      labelText: "Acheivements",
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Text(
                    'Mode of Teaching',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: const Text('Online'),
                    value: this.valuefirst,
                    onChanged: (bool value) {
                      setState(() {
                        this.valuefirst = value;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Offline'),
                    value: this.valuesecond,
                    onChanged: (bool value) {
                      setState(() {
                        this.valuesecond = value;
                      });
                    },
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  GestureDetector(
                      onTap: () {
                        if (valuefirst == false && valuesecond == false) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: "Mark atleast one of online and offline"
                                  .text
                                  .make()));
                        } else {
                          int value = 1;
                          if (valuefirst == true && valuesecond == true) {
                            value = 2;
                          } else if (valuefirst == true) {
                            value = 0;
                          } else {
                            value = 1;
                          }
                          tutionSetup(
                              widget.tutionname.toString(),
                              widget.phonenumber.toString(),
                              widget.address.toString(),
                              widget.pincode.toString(),
                              widget.emailid.toString(),
                              subdesccontroller.text,
                              classesdesccontroller.text,
                              tutionfeecontroller.text,
                              desccontroller.text,
                              acheivementcontroller.text,
                              value);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TutionDashBoard()));
                        }
                      },
                      child: blueButton(
                          context: context,
                          label: "Next",
                          buttonWidth: MediaQuery.of(context).size.width / 2)),
                ],
              )),
        ),
      ),
    );
  }
}
