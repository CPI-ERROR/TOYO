import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toyo/presentation/screens/student/student_dashboard/chatwithtution.dart';
import 'package:toyo/presentation/screens/student/student_details/student_apply_form.dart';
import 'package:velocity_x/velocity_x.dart';

class TutionDetailsPage extends StatelessWidget {
  final String documentID;
  final String tutionName;

  TutionDetailsPage(this.documentID, this.tutionName);

  TextEditingController feedbackController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Give your feedback'),
            content: Form(
              key: _formKey,
              child: TextFormField(
                controller: feedbackController,
                decoration: InputDecoration(
                    hintText: "give your valuable feeback here"),
                // validator: (value) {
                //   if (value.length != 6) {
                //     return "";
                //   }
                //   return null;
                // },
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('done'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.pop(context);
                  }
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // String image = tution.image;
    String tutionID;

    return Scaffold(
      appBar: new AppBar(
        title: new Text(tutionName, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff403b58),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  _displayDialog(context);
                },
                child: Icon(Icons.more_vert),
              )),
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Tutions")
              .doc(documentID)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return new Text("No Data Available");
            }
            var document = snapshot.data;
            tutionID = document["TutionID"].toString();
            return new SingleChildScrollView(
              child: Column(
                children: [
                  Image.network("https://c.stocksy.com/a/jV3000/z9/13499.jpg"),
                  30.heightBox,
                  document["TutionName"]
                      .toString()
                      .text
                      .color(Color(0xff403b58))
                      .xl
                      .center
                      .bold
                      .make(),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: document["TutionDescription"]
                        .toString()
                        .text
                        .textStyle(context.captionStyle)
                        .color(Color(0xff403b58))
                        .center
                        .sm
                        .make(),
                  ),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child:
                        "Student of these grades can apply : ${document["TutionDescClasses"].toString()}"
                            .text
                            .textStyle(context.captionStyle)
                            .color(Color(0xff403b58))
                            .center
                            .sm
                            .make(),
                  ),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: "Subjects : ${document["TutionDescSub"].toString()}"
                        .text
                        .textStyle(context.captionStyle)
                        .color(Color(0xff403b58))
                        .center
                        .sm
                        .make(),
                  ),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: "Tution Fee : ${document["TutionFee"].toString()}"
                        .text
                        .textStyle(context.captionStyle)
                        .color(Color(0xff403b58))
                        .center
                        .sm
                        .make(),
                  ),
                  20.heightBox,
                  "Address"
                      .toString()
                      .text
                      .color(Color(0xff403b58))
                      .sm
                      .center
                      .bold
                      .make(),
                  5.heightBox,
                  document["TutionAddress"]
                      .toString()
                      .text
                      .textStyle(context.captionStyle)
                      .color(Color(0xff403b58))
                      .sm
                      .center
                      .make(),
                  20.heightBox,
                  "Acheivements"
                      .toString()
                      .text
                      .color(Color(0xff403b58))
                      .sm
                      .center
                      .bold
                      .make(),
                  5.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: document["TutionAcheivements"]
                        .toString()
                        .text
                        .textStyle(context.captionStyle)
                        .color(Color(0xff403b58))
                        .center
                        .sm
                        .make(),
                  ),
                  30.heightBox,
                  InkWell(
                    onTap: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatwithTution(
                                  document["TutionName"].toString()))),
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        "Chat with Tution",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff403b58),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
      bottomNavigationBar: Container(
        color: Color(0xfff5f5f5),
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: 100,
          height: 50,
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentsApplyForm(tutionID)));
            },
            child: Text(
              "Apply Now",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xff403b58),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ).p20(),
    );
  }
}
