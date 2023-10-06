import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'dsply.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var current;

  var notcurrent;

  var sized;

  var markedtoday='';
  var notmarked='';

  var temp;

  @override
  void initState() {
    current = true;
    notcurrent = false;
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
            Text("Mark Yor Attendance"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(getCurrentDate(),
                    style: TextStyle(fontSize: 18, color: Colors.cyan)),
                TextButton(
                  onPressed: () {
                    setState(() {
                      FirebaseFirestore.instance
                          .collection('Mark_Member_attendance')
                          .add({
                        'email': email_get,
                        'name': "Deepika",
                        'Date': getCurrentDate(),
                        'status': "marked",
                      });

                      FirebaseFirestore.instance
                          .collection('Mark_Member_attendance')
                          .limit(1)
                          .get()
                          .then((snapshot) {
                        if (snapshot.size == 1 &&
                            snapshot.metadata.toString() == 'marked') {
                          print("No collection");
                        }
                      });

                      final snackBar = SnackBar(
                        content: Text('Attendance marked'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      //   }

                      //  });
                    });
                  },
                  child: Text("mark"),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Display()));
                },
                child: Text("display")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(getCurrentDate(),
                    style: TextStyle(fontSize: 20, color: Colors.pink)),
                TextButton(
                  onPressed: () {
                    setState(() {
                      FirebaseFirestore.instance
                          .collection('Mark_Member_attendance')
                          .limit(1)
                          .get()
                          .then((snapshot) async {
                        sized = snapshot.size;

                        if (snapshot.size == 0) {
                          print("No collection");

                          FirebaseFirestore.instance
                              .collection('Mark_Member_attendance')
                              .add({
                            'email': email_get,
                            'name': "Deepika",
                            'Date': getCurrentDate(),
                          });
                        }
                        if (snapshot.size > 0) {
                          var orderref = FirebaseFirestore.instance
                              .collection("Mark_Member_attendance");
                          var docsanpshots = await orderref.get();
                          docsanpshots.docs.forEach((doc) {
                            if (doc.get('Date') == '${getCurrentDate()}') {
                              print("current date");
                              current = false;
                            } else {
                              current = true;
                            }
                          });
                          setState(() {
                            markedtoday = "attendance already marked today";
                            notmarked = "Successfully marked";
                          });



                          print("attendance already marked today");


                        }
                        if (snapshot.size > 0) {
                          var orderref = FirebaseFirestore.instance
                              .collection("Mark_Member_attendance");
                          var docsanpshots = await orderref.get();
                          docsanpshots.docs.forEach((doc) {
                            if (doc.get('Date') != '${getCurrentDate()}') {
                              FirebaseFirestore.instance
                                  .collection('Mark_Member_attendance')
                                  .add({
                                'email': email_get,
                                'name': "Deepika",
                                'Date': getCurrentDate(),
                                'status': "marked",
                              });


                            } else {

                            }
                          });






                        }
                      });
                    });
                  },
                  child: Text("Press here to Mark"),
                ),
              ],
            ),


            current == true
                ? Text("${notmarked}")
                : Text("${markedtoday}"),


            Text("${temp}"),

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

  Future getDoc() async {
    var orderref =
        FirebaseFirestore.instance.collection("Mark_Member_attendance");
    var docsanpshots = await orderref.get();
    docsanpshots.docs.forEach((doc) {
      if (sized > 0 && doc.get('Date') == '${getCurrentDate()}') {
        print("current date");
        current = true;
      } else {
        notcurrent = true;
      }
    });
  }
}
