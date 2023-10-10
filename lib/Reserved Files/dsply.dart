// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:intl/intl.dart';
//
// class Display extends StatefulWidget {
//   @override
//   State<Display> createState() => _DisplayState();
// }
//
// class _DisplayState extends State<Display> {
//   CollectionReference users = FirebaseFirestore.instance.collection('users');
//
// var current ;
// var notcurrent;
// @override
//   void initState() {
//     // TODO: implement initState
//   current =false;
//   notcurrent =false;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text("geeksforgeeks"),
//       ),
//       // body: StreamBuilder(
//       //
//       //   // stream: FirebaseFirestore.instance.collection('Mark_Member_attendance').snapshots(),
//       //   stream: users.snapshots(),
//       //
//       //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//       //
//       //     var doc = users.doc('id').get();
//       //
//       //
//       //     if (!snapshot.hasData) {
//       //
//       //       return Center(
//       //         child: CircularProgressIndicator(),
//       //       );
//       //
//       //     }
//       //
//       //     // return ListView(
//       //     //   children: snapshot.data!.docs.map((document) {
//       //     //     return Container(
//       //     //       child: Center(child: Text(document['Date'])),
//       //     //     );
//       //     //   }).toList(),
//       //     // );
//       //
//       //
//       //
//       //
//       //
//       //   },
//       // ),
//       body: Center(
//         child: Column(
//           children: [
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                    getDoc();
//
//                 });
//               },
//               child: Text("tst"),
//             ),
//
//       current == true ? Text("current") : Text("not current"),
//
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future getDoc() async {
//     var orderref =
//         FirebaseFirestore.instance.collection("Mark_Member_attendance");
//     var docsanpshots = await orderref.get();
//     docsanpshots.docs.forEach((doc) {
//       if (doc.get('Date') == '${getCurrentDate()}') {
//         print("current date");
//         current =true;
//
//       } else {
//         notcurrent =true;
//       }
//     });
//   }
//
//   String getCurrentDate() {
//     var date = DateTime.now().toString();
//
//     var dateParse = DateTime.parse(date);
//
//     var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
//     return formattedDate.toString();
//   }
//
//
// }
