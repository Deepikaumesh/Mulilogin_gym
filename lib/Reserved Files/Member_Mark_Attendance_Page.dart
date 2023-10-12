import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Member_Mark_Attendance extends StatefulWidget {
  const Member_Mark_Attendance({Key? key}) : super(key: key);

  @override
  _Member_Mark_AttendanceState createState() => _Member_Mark_AttendanceState();
}

class _Member_Mark_AttendanceState extends State<Member_Mark_Attendance> {
  var temp;
  var email_temp;
  var current;
  var markedtoday = '';
  var notmarked = '';

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
                      setState(() {
                        FirebaseFirestore.instance
                            .collection('Mark_Member_attendance')
                            .limit(1)
                            .get()
                            .then((snapshot) async {


                          if (snapshot.size == 0) {
                            print("No collection");

                            FirebaseFirestore.instance
                                .collection('Mark_Member_attendance')
                                .add({
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

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }

                          if (snapshot.size > 0 ) {
                            var orderref = FirebaseFirestore.instance
                                .collection("Mark_Member_attendance");
                            var docsanpshots = await orderref.get();
                            docsanpshots.docs.forEach((doc) {
                              setState(() {

                                if(doc.get('Date') == '${getCurrentDate()}' && email_temp == email_get){

                                  setState(() {
                                    print("current date");
                                    current = false;
                                    markedtoday =
                                    "Attendance already marked today";
                                  });

                                }



                              // if (doc.get('Date') == '${getCurrentDate()}' && email_temp == email_get ) {
                              //   setState(() {
                              //     print("current date");
                              //     current = false;
                              //     markedtoday =
                              //         "Attendance already marked today";
                              //   });
                           //   }
                               else {
                                setState(() {
                                  if( snapshot.size > 0 && email_temp != email_get){
                                    print("mark");
                                    current = true;
                                    notmarked = "Successfully marked";
                                    FirebaseFirestore.instance
                                        .collection('Mark_Member_attendance')
                                        .add({
                                      'email': email_get,
                                      'name': "Deepika",
                                      'Date': getCurrentDate(),
                                    });

                                  }




                               }
                             );
                             }
    });

                               // if(snapshot.size > 0 &&  email_temp != email_get){
                               //   FirebaseFirestore.instance
                               //             .collection('Mark_Member_attendance')
                               //             .add({
                               //           'email': email_get,
                               //           'name': "Deepika",
                               //           'Date': getCurrentDate(),
                               //         });
                               //
                               //
                               // }

                            }
                          );
                          }

                          // if (snapshot.size > 0 && temp != getCurrentDate()&& email_temp == email_get) {
                          //   FirebaseFirestore.instance
                          //       .collection('Mark_Member_attendance')
                          //       .add({
                          //     'email': email_get,
                          //     'name': "Deepika",
                          //     'Date': getCurrentDate(),
                          //   });
                          //   print("added another user current date");
                          // }
                        });
                      });
                    },
                    child: Text("Tap here to mark"))
              ],
            ),
            SizedBox(
              height: 50,
            ),


            current == true ? Text("${notmarked}",style: TextStyle(fontSize: 20,color: Colors.teal),) : Text("${markedtoday}!",style: TextStyle(fontSize: 20,color: Colors.red),),
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
}
