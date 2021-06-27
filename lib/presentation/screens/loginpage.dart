import 'package:flutter/material.dart';
import 'package:toyo/presentation/screens/registerpage.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phonenumber = new TextEditingController();

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
                height: 40.0,
              ),
              Image.asset("assets/images/login.png"),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome To TOYO",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff403b58),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: phonenumber,
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
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     hintText: "Enter Password",
                    //     labelText: "Password",
                    //   ),
                    //   validator: (value) {
                    //     if (value.isEmpty) {
                    //       return "Please enter your password";
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
                onTap: () => {
                  if (_formKey.currentState.validate())
                    {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => ),
                      // )
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
                          "login",
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
                "haven't Registered? Register here",
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
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  )
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: 250,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Register",
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
      ),
    );
  }
}
