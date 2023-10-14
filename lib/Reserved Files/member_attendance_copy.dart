// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../../main.dart';
//
// final Color darkBlue = Color.fromARGB(255, 18, 32, 47);
//
// class MyWidget extends StatefulWidget {
//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }
//
// class _MyWidgetState extends State<MyWidget> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 100,
//             ),
//             Text(
//               greetingMessage(),
//               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Text("Mark Yor Attendance"),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(getCurrentDate(),
//                     style: TextStyle(fontSize: 18, color: Colors.cyan)),
//                 TextButton(
//                     onPressed: () {
//                       setState(() {
//                         FirebaseFirestore.instance
//                             .collection('Mark_Member_attendance')
//                             .limit(1)
//                             .get()
//                             .then((snapshot) {
//                           if (snapshot.size == 1  && snapshot.metadata != getCurrentDate) {
//                             print("No collection");
//
//                             FirebaseFirestore.instance
//                                 .collection('Mark_Member_attendance')
//                                 .add({
//                               'text': email_get,
//                               'name': "Deepika",
//                               'Date': getCurrentDate()
//                             });
//
//
//                             final snackBar = SnackBar(
//                               content: Text('Attendance marked'),
//                               action: SnackBarAction(
//                                 label: 'Undo',
//                                 onPressed: () {
//                                   // Some code to undo the change.
//                                 },
//                               ),
//                             );
//
//                             // Find the ScaffoldMessenger in the widget tree
//                             // and use it to show a SnackBar.
//                             ScaffoldMessenger.of(context)
//                                 .showSnackBar(snackBar);
//
//                           } else {
//
//                             final snackBar = SnackBar(
//                               content: Text('Already exist'),
//                               action: SnackBarAction(
//                                 label: 'Undo',
//                                 onPressed: () {
//                                   // Some code to undo the change.
//                                 },
//                               ),
//                             );
//
//                             // Find the ScaffoldMessenger in the widget tree
//                             // and use it to show a SnackBar.
//                             ScaffoldMessenger.of(context)
//                                 .showSnackBar(snackBar);
//                           }
//                         });
//                       });
//                     },
//                     child: Text(
//                       "Mark",
//                     )),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   String greetingMessage() {
//     var timeNow = DateTime.now().hour;
//
//     if (timeNow <= 11.59) {
//       return 'Good Morning';
//     } else if (timeNow > 12 && timeNow <= 16) {
//       return 'Good Afternoon';
//     } else if (timeNow > 16 && timeNow < 20) {
//       return 'Good Evening';
//     } else {
//       return 'Good Night';
//     }
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
// }
