import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:toyo/data/models/joinedtutionmodel.dart';
import 'package:toyo/data/services/joinedtutionservices.dart';
import 'package:toyo/presentation/screens/student/student_dashboard/searchtution_page.dart';
import 'package:toyo/presentation/screens/student/student_dashboard/tution_details.dart';
import 'package:toyo/presentation/widgets/student_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class JoinedTutions extends StatefulWidget {
  @override
  _JoinedTutionsState createState() => _JoinedTutionsState();
}

class _JoinedTutionsState extends State<JoinedTutions> {
  FirebaseAuth auth = FirebaseAuth.instance;

  String uid;
  String currname = "kapil";
  String currphonenumber = "891";
  String studentID;

  Future<void> _getUserName() async {
    uid = auth.currentUser.uid.toString();
    FirebaseFirestore.instance
        .collection('Students')
        .doc(uid)
        .get()
        .then((value) {
      setState(() {
        studentID = uid;
        currname = value.data()['StudentName'].toString();
        currphonenumber = value.data()['MobileNumber'].toString();
      });
    });
  }

  @override
  void initState() {
    // items = JoinedTutionServices.getJoinedTutionList();
    super.initState();
    _getUserName();
  }

  JoinedTutionServices get service => GetIt.I<JoinedTutionServices>();
  List<JoinedTution> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: new Text(
          "Your Tutions",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff403b58),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: studentDrawer(context, currname, currphonenumber),
      body: (items.length == 0)
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "You haven't joined any tutions yet from TOYO"
                        .text
                        .xl
                        .center
                        .make()
                        .centered(),
                    30.heightBox,
                    InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchTutionPage()),
                        )
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Join Tutions",
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
              ),
            )
          : Column(children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  String image = items[index].image.toString();
                  return InkWell(
                    onTap: () {},
                    // onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) =>
                    //      //     (tution: items[index]),      isme receipt dal denge uske tution ki fee payment or qr code vali
                    //     )),
                    child: VxBox(
                        child: Row(
                      children: [
                        Hero(
                          tag: Key(items[index].tution_id.toString()),
                          child: Image.network(
                            image,
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
                            items[index]
                                .tution_name
                                .text
                                .lg
                                .color(Color(0xff403b58))
                                .bold
                                .make(),
                            items[index]
                                .tution_address
                                .text
                                .textStyle(context.captionStyle)
                                .color(Color(0xff403b58))
                                .make(),
                            10.heightBox,
                            items[index]
                                .tution_mode_of_teaching
                                .text
                                .textStyle(context.captionStyle)
                                .color(Color(0xff403b58))
                                .make(),
                          ],
                        ))
                      ],
                    )).color(Colors.white).roundedLg.square(140).make().py8(),
                  );
                },
              ),
              30.heightBox,
              InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchTutionPage()),
                  )
                },
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: 200,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Join More Tutions",
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
            ]),

      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance
      //       .collection("Students")
      //       .where('StudentID', isEqualTo: studentID)
      //       // .orderBy('TutionName')
      //       .snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(
      //           child: Center(
      //         child: new Text(
      //             "You haven't joined any tutions yet form TOYO, Join any tution from our app and get 5% discount. kyuki, Padhega India tabhi to aage badhega India"),
      //       )
      //           //CircularProgressIndicator(),
      //           );
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
      //                     (document["TutionTeachingMode"] == 1)
      //                         ? "Offline"
      //                             .toString()
      //                             .text
      //                             .textStyle(context.captionStyle)
      //                             .color(Color(0xff403b58))
      //                             .make()
      //                         : "Online"
      //                             .toString()
      //                             .text
      //                             .textStyle(context.captionStyle)
      //                             .color(Color(0xff403b58))
      //                             .make(),
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
