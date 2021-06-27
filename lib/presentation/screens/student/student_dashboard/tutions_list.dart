import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:toyo/presentation/screens/student/student_dashboard/tution_details.dart';
import 'package:toyo/presentation/widgets/student_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class TutionsList extends StatefulWidget {
  String studentpincode;
  TutionsList(this.studentpincode);

  @override
  _TutionsListState createState() => _TutionsListState();
}

class _TutionsListState extends State<TutionsList> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title:
            new Text("TOYO - Tutions", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff403b58),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: studentDrawer(context, currname, currphonenumber),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Tutions")
            .where('Pincode', isEqualTo: widget.studentpincode)
            // .orderBy('TutionName')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: Center(
              child:
                  new Text("TOYO Tutions are not available at this location"),
            )
                //CircularProgressIndicator(),
                );
          }
          return ListView(
            children: snapshot.data.docs.map((document) {
              return Container(
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TutionDetailsPage(
                            document["TutionID"].toString(),
                            document["TutionName"].toString()),
                      )),
                  child: VxBox(
                      child: Row(
                    children: [
                      Hero(
                        tag: Key(document["TutionID"].toString()),
                        child: Image.network(
                          "https://c.stocksy.com/a/jV3000/z9/13499.jpg",
                        )
                            .box
                            .rounded
                            .p8
                            .color(Color(0xfff5f5f5))
                            .make()
                            .p16()
                            .w40(context),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          document["TutionName"]
                              .toString()
                              .toString()
                              .text
                              .lg
                              .color(Color(0xff403b58))
                              .bold
                              .make(),
                          document["TutionAddress"]
                              .toString()
                              .text
                              .textStyle(context.captionStyle)
                              .color(Color(0xff403b58))
                              .make(),
                          10.heightBox,
                          // document["TutionDescSub"]
                          //     .toString()
                          //     .text
                          //     .textStyle(context.captionStyle)
                          //     .color(Color(0xff403b58))
                          //     .make(),
                          // 10.heightBox,
                          (document["TutionTeachingMode"] == 1)
                              ? "Offline"
                                  .toString()
                                  .text
                                  .textStyle(context.captionStyle)
                                  .color(Color(0xff403b58))
                                  .make()
                              : "Online"
                                  .toString()
                                  .text
                                  .textStyle(context.captionStyle)
                                  .color(Color(0xff403b58))
                                  .make(),
                        ],
                      ))
                    ],
                  )).color(Colors.white).roundedLg.square(140).make().py8(),
                ),
              );
            }).toList(),
          );
        },
      ),

      // StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('Tutions').snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }

      //     return ListView(
      //       children: snapshot.data.docs.map((document) {
      //         return Container(
      //           child: InkWell(
      //             onTap: () => Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => TutionDetailsPage(
      //                       document["TutionID"].toString(),
      //                       document["TutionName"].toString()),
      //                 )),
      //             child: VxBox(
      //                 child: Row(
      //               children: [
      //                 Hero(
      //                   tag: Key(document["TutionID"].toString()),
      //                   child: Image.network(
      //                     "https://c.stocksy.com/a/jV3000/z9/13499.jpg",
      //                   )
      //                       .box
      //                       .rounded
      //                       .p8
      //                       .color(Color(0xfff5f5f5))
      //                       .make()
      //                       .p16()
      //                       .w40(context),
      //                 ),
      //                 Expanded(
      //                     child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     document["TutionName"]
      //                         .toString()
      //                         .toString()
      //                         .text
      //                         .lg
      //                         .color(Color(0xff403b58))
      //                         .bold
      //                         .make(),
      //                     document["TutionAddress"]
      //                         .toString()
      //                         .text
      //                         .textStyle(context.captionStyle)
      //                         .color(Color(0xff403b58))
      //                         .make(),
      //                     10.heightBox,
      //                     document["TutionTeachingMode"]
      //                         .toString()
      //                         .text
      //                         .textStyle(context.captionStyle)
      //                         .color(Color(0xff403b58))
      //                         .make(),
      //                   ],
      //                 ))
      //               ],
      //             )).color(Colors.white).roundedLg.square(140).make().py8(),
      //           ),
      //         );
      //       }).toList(),
      //     );
      //   },
      // ),
    );
  }
}
