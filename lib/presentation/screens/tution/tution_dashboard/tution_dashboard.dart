import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toyo/presentation/widgets/tution_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class TutionDashBoard extends StatefulWidget {
  @override
  _TutionDashBoardState createState() => _TutionDashBoardState();
}

class _TutionDashBoardState extends State<TutionDashBoard> {
  String currname;
  String currphonenumber;
  String documentID;

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> _getUserName() async {
    String uid = auth.currentUser.uid.toString();
    FirebaseFirestore.instance
        .collection('Tutions')
        .doc(uid)
        .get()
        .then((value) {
      setState(() {
        currname = value.data()['TutionName'].toString();
        currphonenumber = value.data()['MobileNumber'].toString();
        documentID = value.data()['TutionID'].toString();
      });
    });
  }

  @override
  void initState() {
    _getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String tutionID;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tution DashBoard", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff403b58),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: tutionDrawer(context, currname, currphonenumber),

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
                  10.heightBox
                ],
              ),
            );
          }),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [new Text("DashBoard")],
      //   ),
      // ),
    );
  }
}

// class TutionDetailsPage extends StatelessWidget {
//   final String documentID;
//   final String tutionName;

//   TutionDetailsPage(this.documentID, this.tutionName);

//   @override
//   Widget build(BuildContext context) {
//     // String image = tution.image;
//     String tutionID;

//     return Scaffold(
//       appBar: new AppBar(
//         title: new Text(tutionName, style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: Color(0xff403b58),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection("Tutions")
//               .doc(documentID)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return new Text("No Data Available");
//             }
//             var document = snapshot.data;
//             tutionID = document["TutionID"].toString();
//             return new SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Image.network("https://c.stocksy.com/a/jV3000/z9/13499.jpg"),
//                   30.heightBox,
//                   document["TutionName"]
//                       .toString()
//                       .text
//                       .color(Color(0xff403b58))
//                       .xl
//                       .center
//                       .bold
//                       .make(),
//                   20.heightBox,
//                   Padding(
//                     padding: const EdgeInsets.only(left: 16.0, right: 16.0),
//                     child: document["TutionDescription"]
//                         .toString()
//                         .text
//                         .textStyle(context.captionStyle)
//                         .color(Color(0xff403b58))
//                         .center
//                         .sm
//                         .make(),
//                   ),
//                   20.heightBox,
//                   Padding(
//                     padding: const EdgeInsets.only(left: 16.0, right: 16.0),
//                     child:
//                         "Student of these grades can apply : ${document["TutionDescClasses"].toString()}"
//                             .text
//                             .textStyle(context.captionStyle)
//                             .color(Color(0xff403b58))
//                             .center
//                             .sm
//                             .make(),
//                   ),
//                   20.heightBox,
//                   Padding(
//                     padding: const EdgeInsets.only(left: 16.0, right: 16.0),
//                     child: "Subjects : ${document["TutionDescSub"].toString()}"
//                         .text
//                         .textStyle(context.captionStyle)
//                         .color(Color(0xff403b58))
//                         .center
//                         .sm
//                         .make(),
//                   ),
//                   20.heightBox,
//                   Padding(
//                     padding: const EdgeInsets.only(left: 16.0, right: 16.0),
//                     child: "Tution Fee : ${document["TutionFee"].toString()}"
//                         .text
//                         .textStyle(context.captionStyle)
//                         .color(Color(0xff403b58))
//                         .center
//                         .sm
//                         .make(),
//                   ),
//                   20.heightBox,
//                   "Address"
//                       .toString()
//                       .text
//                       .color(Color(0xff403b58))
//                       .sm
//                       .center
//                       .bold
//                       .make(),
//                   5.heightBox,
//                   document["TutionAddress"]
//                       .toString()
//                       .text
//                       .textStyle(context.captionStyle)
//                       .color(Color(0xff403b58))
//                       .sm
//                       .center
//                       .make(),
//                   20.heightBox,
//                   "Acheivements"
//                       .toString()
//                       .text
//                       .color(Color(0xff403b58))
//                       .sm
//                       .center
//                       .bold
//                       .make(),
//                   5.heightBox,
//                   Padding(
//                     padding: const EdgeInsets.only(left: 12.0, right: 12.0),
//                     child: document["TutionAcheivements"]
//                         .toString()
//                         .text
//                         .textStyle(context.captionStyle)
//                         .color(Color(0xff403b58))
//                         .center
//                         .sm
//                         .make(),
//                   ),
//                   30.heightBox,
//                   InkWell(
//                     onTap: () => {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ChatwithTution(
//                                   document["TutionName"].toString()))),
//                     },
//                     child: AnimatedContainer(
//                       duration: Duration(seconds: 1),
//                       width: 150,
//                       height: 50,
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Chat with Tution",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                         color: Color(0xff403b58),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//       bottomNavigationBar: Container(
//         color: Color(0xfff5f5f5),
//         child: AnimatedContainer(
//           duration: Duration(seconds: 1),
//           width: 100,
//           height: 50,
//           alignment: Alignment.center,
//           child: GestureDetector(
//             onTap: () {
//               Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => StudentsApplyForm(tutionID)));
//             },
//             child: Text(
//               "Apply Now",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//           decoration: BoxDecoration(
//             color: Color(0xff403b58),
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ).p20(),
//     );
//   }
// }
