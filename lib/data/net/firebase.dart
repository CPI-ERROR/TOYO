import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> tutionSetup(
    String tutionName,
    String mobile,
    String tutionaddress,
    String pincode,
    String emailid,
    String tutiondescsub,
    String tutiondescclasses,
    String tutionFee,
    String desc,
    String acheivements,
    int tutionteachingmode) async {
  CollectionReference tutions =
      FirebaseFirestore.instance.collection('Tutions');

  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  print("tutionsetup => firebase run hua");

  tutions.doc(uid).set({
    'TutionName': tutionName,
    'MobileNumber': mobile,
    'TutionID': uid,
    'TutionAddress': tutionaddress,
    'Pincode': pincode,
    'EmailID': emailid,
    'TutionDescClasses': tutiondescclasses,
    'TutionDescSub': tutiondescsub,
    'TutionFee': tutionFee,
    'TutionTeachingMode': tutionteachingmode,
    'TutionDescription': desc,
    'TutionAcheivements': acheivements
  });
  return;
}

Future<void> studentSetup(
  String studentName,
  String mobile,
  String studentaddress,
  String pincode,
  String studentclass,
) async {
  CollectionReference students =
      FirebaseFirestore.instance.collection('Students');

  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  print("studentsetup => firebase run hua");

  students.doc(uid).set({
    'StudentName': studentName,
    'MobileNumber': mobile,
    'StudentID': uid,
    'StudentAddress': studentaddress,
    'Pincode': pincode,
    'StudentClass': studentclass,
    'JoinedTutionID': [],
  });
  return;
}

Future<void> studenttutionConnection(String studentID, String tutionID) async {
  CollectionReference studenttution =
      FirebaseFirestore.instance.collection('Students');

  print("studenttutionconnection => firebase run hua");

  studenttution.doc(studentID).update({
    'JoinedTutionID': FieldValue.arrayUnion([tutionID])
  });
  return;
}
