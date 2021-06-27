import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toyo/core/constants/emum.dart';
import 'package:toyo/presentation/screens/student/registration/studentregister.dart';
import 'package:toyo/presentation/screens/tution/tution_dashboard/tution_dashboard.dart';
import 'package:toyo/presentation/screens/tution/registration/tutionform1.dart';
import 'package:velocity_x/velocity_x.dart';

class TutionRegisterPage extends StatefulWidget {
  @override
  _TutionRegisterPageState createState() => _TutionRegisterPageState();
}

class _TutionRegisterPageState extends State<TutionRegisterPage> {
  bool changedbutton = false;

  final phoneController = TextEditingController();
  // final passwordController = TextEditingController();
  // final confirmpasswordController = TextEditingController();
  // final tutionnameController = TextEditingController();
  final otpController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  MobileVerificationState currentstate =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
  String verificationId;

  bool showLoading = false;
  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential?.user != null) {
        // tutionSetup(passwordController.text, phoneController.text);
        FirebaseAuth auth = FirebaseAuth.instance;
        String uid = auth.currentUser.uid.toString();
        final snapShot = await FirebaseFirestore.instance
            .collection('Tutions')
            .doc(uid)
            .get();

        if (snapShot == null || !snapShot.exists) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TutionForm1(phoneController.text)));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TutionDashBoard()));
        }
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  getMObilFormWidget(context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 80.0,
            ),
            Text(
              "TOYO",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff403b58),
              ),
            ),
            SizedBox(
              height: 7.0,
            ),
            Text(
              "Connecting student with tutions",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xff403b58),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              "Tution Login/Register",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff403b58),
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: Column(
                children: [
                  // TextFormField(
                  //   controller: tutionnameController,
                  //   decoration: InputDecoration(
                  //     hintText: "Name",
                  //     labelText: "Enter Tution Name",
                  //   ),
                  //   validator: (value) {
                  //     if (value.isEmpty) {
                  //       return "Please Enter tution name";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: "Enter Mobile Number",
                      labelText: "Mobile Number",
                    ),
                    validator: (value) {
                      if (value.length < 10) {
                        return "Please enter valid Mobile Number";
                      }
                      return null;
                    },
                  ),
                  // TextFormField(
                  //   controller: passwordController,
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     hintText: "Password",
                  //     labelText: "Enter Password",
                  //   ),
                  //   validator: (value) {
                  //     if (value.length < 6) {
                  //       return "Password length should be atleast 6";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // TextFormField(
                  //   controller: confirmpasswordController,
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     hintText: "Password",
                  //     labelText: "Confirm Password",
                  //   ),
                  //   validator: (value) {
                  //     if (value.isEmpty) {
                  //       return "Please enter your password";
                  //     } else if (passwordController.value !=
                  //         confirmpasswordController.value) {
                  //       return "Password is not matching";
                  //     }
                  //     return null;
                  //   },
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () async {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    showLoading = true;
                  });
                  await _auth.verifyPhoneNumber(
                    phoneNumber: phoneController.text,
                    verificationCompleted: (phoneAuthCredential) async {
                      setState(() {
                        showLoading = false;
                      });
                      // tutionSetup(
                      //     tutionnameController.text, passwordController.text);
                    },
                    verificationFailed: (verificationFailed) async {
                      setState(() {
                        showLoading = false;
                      });
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text(verificationFailed.message)));
                    },
                    codeSent: (verificationId, resendingToken) async {
                      setState(() {
                        showLoading = false;
                        currentstate =
                            MobileVerificationState.SHOW_OTP_FORM_STATE;
                        this.verificationId = verificationId;
                      });
                    },
                    codeAutoRetrievalTimeout: (verificationId) async {},
                  );
                }
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: changedbutton ? 50 : 250,
                height: 50,
                alignment: Alignment.center,
                child: changedbutton
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : Text(
                        "Enter",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                decoration: BoxDecoration(
                  color: Color(0xff403b58),
                  borderRadius: BorderRadius.circular(changedbutton ? 50 : 8),
                ),
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Text(
              "Are you a student? Enter here",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xff403b58),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentRegisterPage()),
                )
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: 250,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "Enter",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xff403b58),
                  borderRadius: BorderRadius.circular(changedbutton ? 50 : 8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        "OTP has been sent to ${phoneController.text}".text.xl.make(),
        SizedBox(
          height: 50,
        ),
        TextField(
          controller: otpController,
          decoration: InputDecoration(
            hintText: "Enter OTP",
          ),
        ),
        SizedBox(
          height: 16,
        ),
        FlatButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text("VERIFY"),
          color: Color(0xff403b58),
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var value1 = "";

    return Scaffold(
      key: _scaffoldKey,
      body: Container(
          color: context.canvasColor,
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : currentstate == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMObilFormWidget(context)
                  : getOtpFormWidget(context)),
    );
  }
}
