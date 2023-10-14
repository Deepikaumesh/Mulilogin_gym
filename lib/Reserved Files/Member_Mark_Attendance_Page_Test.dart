import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Member_Mark_Attendance_Test extends StatefulWidget {
  const Member_Mark_Attendance_Test({Key? key}) : super(key: key);

  @override
  _Member_Mark_Attendance_TestState createState() =>
      _Member_Mark_Attendance_TestState();
}

class _Member_Mark_Attendance_TestState
    extends State<Member_Mark_Attendance_Test> {
  var temp;
  var email_temp;
  var current;
  var markedtoday = '';
  var notmarked = '';
  var check;
  var query;
  List test = [];
  var allDocs;
  var docId;
  var collection ;

  @override
  void initState() {
    current = true;
    temp = markedtoday;
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('${email_get}'),
            SizedBox(
              height: 100,
            ),
            Text(
              greetingMessage(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 280,
              color: Colors.cyan,
              child: Center(
                child: Text(
                  "Mark Your Attendance",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(getCurrentDate(),
                    style: TextStyle(fontSize: 18, color: Colors.red.shade900)),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red.shade900),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 20))),
                    onPressed: () async {
                      var orderref = FirebaseFirestore.instance
                          .collection("Mark_Member_attendance");
                      var docsanpshots = await orderref.get();
                      docsanpshots.docs.forEach((doc) {
                        temp = doc.get('Date');
                        email_temp = doc.get('email');
                      });

                      FirebaseFirestore.instance
                          .collection('Mark_Member_attendance')
                          .get()
                          .then(
                        (value) {
                          value.docs.forEach((result) {
                            print(result.data()['email']);
                            query = result.data()['email'];


                        //    email_temp =result.data().values.where((email_get) => true);




                          });
                        },
                      );

                      //  setState(() {

                      // FirebaseFirestore.instance.collection('Mark_Member_attendance').get().then(
                      //       (value) {
                      //     value.docs.forEach((result) {
                      //
                      //       print(result.data()['email']);
                      //
                      //       test = result.data()['email'];
                      //
                      //       query = FirebaseFirestore. instance. collection('users') . where('email', isEqualTo: result.data()['email']);
                      //
                      //       FirebaseFirestore.instance
                      //           .collection('Mark_Member_attendance')
                      //           .limit(1)
                      //           .get()
                      //           .then((snapshot) async {
                      //         if (snapshot.size == 0) {
                      //           setState(() {
                      //             empty_collection();
                      //           });
                      //         }
                      //
                      //       if (snapshot.size > 0 &&
                      //            email_temp == email_get &&
                      //           //result.data()['email'] == email_get &&
                      //           temp == '${getCurrentDate()}')
                      //
                      //
                      //
                      //
                      //       {
                      //         setState(() {
                      //           existing_collection();
                      //         });
                      //       }
                      //
                      //       if (snapshot.size > 0 &&
                      //           email_temp != email_get &&
                      //           temp == '${getCurrentDate()}') {
                      //         setState(() {
                      //           add_new_member();
                      //         });
                      //       }
                      //
                      //       });
                      //
                      //
                      //
                      //
                      //
                      //
                      //
                      //     });
                      // },);

                      FirebaseFirestore.instance
                          .collection('Mark_Member_attendance')
                          .limit(1)
                          .get()
                          .then((snapshot) async {
                        if (snapshot.size == 0) {
                          setState(() {
                            empty_collection();
                          });
                        }



                        if (snapshot.size > 0 &&
                            email_temp == email_get &&


                            // result.data()['email']  == email_get &&
                            temp == '${getCurrentDate()}') {
                          setState(() {
                            existing_collection();
                          });
                        }

                        if (snapshot.size > 0 &&
                            email_temp != email_get &&
                            temp == '${getCurrentDate()}') {
                          setState(() {
                            add_new_member();
                          });
                        }
                      });

                      //});
                    },
                    child: Text("Tap here to mark"))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    FirebaseFirestore.instance
                        .collection('Mark_Member_attendance')
                        .get()
                        .then(
                      (value) {
                        value.docs.forEach((result) {
                             print(result.data()['email']);

                             print(result.data().values.where((email_get) => true));


                          // print(query);
                          // print("jj");
                          // debugPrint("j");
                        });
                      },
                    );
                  });


                  // print(email_temp);
                  // print(email_get);
                },
                child: Text("Check")),


            TextButton(onPressed: ()async{
              setState(()async {
                collection=   FirebaseFirestore.instance.collection("Mark_Member_attendance").get(docId);

                allDocs = await collection.get();
                docId = allDocs.docs.first.id;

                print(collection.toString());

              });

              //print(docId);
            }, child: Text("Doc check")),
          ],
        ),
      ),
    );
  }

  String greetingMessage() {
    var timeNow = DateTime.now().hour;

    if (timeNow <= 11.59) {
      return 'Good Morning';
    } else if (timeNow > 12 && timeNow <= 16) {
      return 'Good Afternoon';
    } else if (timeNow > 16 && timeNow < 20) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }

  empty_collection() {
    FirebaseFirestore.instance
        .collection('Mark_Member_attendance')
        .limit(1)
        .get()
        .then((snapshot) async {
      print("No collection");

      FirebaseFirestore.instance.collection('Mark_Member_attendance').add({
        'email': email_get,
        'name': "Deepika",
        'Date': getCurrentDate(),
      });

      final snackBar = SnackBar(
        content: Text('Attendance Marked Successfully First member'),
        action: SnackBarAction(
          label: 'ok',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  existing_collection() {
    FirebaseFirestore.instance
        .collection('Mark_Member_attendance')
        .limit(1)
        .get()
        .then((snapshot) async {
      var orderref =
          FirebaseFirestore.instance.collection("Mark_Member_attendance");

      var docsanpshots = await orderref.get();

      docsanpshots.docs.forEach((doc) {
        setState(() {
          //  if (snapshot.size > 0 && email_temp == email_get && doc.get('Date') == '${getCurrentDate()}') {
          setState(() {
            print("current date");
            final snackBar = SnackBar(
              content: Text('Attendance already marked today'),
              action: SnackBarAction(
                label: 'ok',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        }
            //}
            );
      });
    });
  }

  add_new_member() {
    FirebaseFirestore.instance
        .collection('Mark_Member_attendance')
        .limit(1)
        .get()
        .then((snapshot) async {
      print("No collection");

      FirebaseFirestore.instance.collection('Mark_Member_attendance').add({
        'email': email_get,
        'name': "Deepika",
        'Date': getCurrentDate(),
      });

      final snackBar = SnackBar(
        content: Text('Attendance Marked Successfully'),
        action: SnackBarAction(
          label: 'ok',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
