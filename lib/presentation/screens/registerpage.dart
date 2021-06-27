import 'package:flutter/material.dart';
import 'package:toyo/presentation/screens/loginpage.dart';
import 'package:toyo/presentation/screens/student/registration/studentregister.dart';
import 'package:toyo/presentation/screens/tution/registration/tutionregister.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool changedbutton = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Image.asset("assets/images/login.png"), //yaha pr logo aayega
              SizedBox(
                height: 70.0,
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
                height: 8.0,
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
                height: 90.0,
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
                    //"Register as Student",
                    "Enter as Student",
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
                height: 50.0,
              ),
              InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TutionRegisterPage()),
                  )
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: 250,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    //"Register your Tution",
                    "Enter as Tution",
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
              // SizedBox(
              //   height: 0.0,
              // ),
              // Text(
              //   "already Registered? Login here",
              //   style: TextStyle(
              //     fontSize: 15,
              //     fontWeight: FontWeight.bold,
              //     color: Color(0xff403b58),
              //   ),
              // ),
              // SizedBox(
              //   height: 10.0,
              // ),
              // InkWell(
              //   onTap: () => {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => LoginPage()),
              //     )
              //   },
              //   child: AnimatedContainer(
              //     duration: Duration(seconds: 1),
              //     width: 250,
              //     height: 50,
              //     alignment: Alignment.center,
              //     child: Text(
              //       "Login",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 18,
              //       ),
              //     ),
              //     decoration: BoxDecoration(
              //       color: Color(0xff403b58),
              //       borderRadius: BorderRadius.circular(changedbutton ? 50 : 8),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
