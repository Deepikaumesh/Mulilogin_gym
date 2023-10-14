import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

class Member_Mark_Attendance_Test2 extends StatefulWidget {
  const Member_Mark_Attendance_Test2({Key? key}) : super(key: key);

  @override
  _Member_Mark_Attendance_Test2State createState() =>
      _Member_Mark_Attendance_Test2State();
}

class _Member_Mark_Attendance_Test2State
    extends State<Member_Mark_Attendance_Test2> {
  CollectionReference users =
      FirebaseFirestore.instance.collection('Mark_Member_attendance');





  String timeStamp24HR =DateTime.now().toString();

  var customId;

  var existinmessage;

  var select_color;

  @override
  void initState() {
    customId = email_get + getCurrentDate();
    existinmessage = '';
    select_color = Colors.yellow;
    getDoc();
    member_name;
    member_Image;
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Date:" + getCurrentDate(),style: TextStyle(fontSize: 18.0)),
                Text("Time:" + DateFormat.jm().format(DateTime.parse(timeStamp24HR)), style: TextStyle(fontSize: 18.0),)
              ],
            ),
            SizedBox(
              height: 50,
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
                      setState(() {
                        Mark_attendance();
                      });
                    },
                    child: Text("Tap here to mark"))
              ],
            ),
            SizedBox(
              height: 50,
            ),

            Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(existinmessage,
                    style: TextStyle(color: select_color, fontSize: 20))),
            Padding(
              padding: EdgeInsets.all(20),
              child:  Image.asset("assets/attendance (1).png",height: 300,),
            ),


            Spacer(),
            Text(
              '${email_get}',
              style: TextStyle(fontSize: 25),
            ),





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

  String getCurrentTime() {
    var time = DateTime.now().toString();

    var dateParse = DateTime.parse(time);

    var formattetime = "${dateParse.hour}-${dateParse.minute}";
    return formattetime.toString();
  }

  Mark_attendance() {

    DocumentReference<Map<String, dynamic>> users = FirebaseFirestore.instance
        .collection('Mark_Member_attendance')
        // .doc("${email_get}" + "${getCurrentDate()}");
        .doc(customId);
    var myjsonobj = {
      'Name':member_name,
      'Email': email_get,
      'Date': getCurrentDate(),
      'image':member_Image,
    };
    users
        .set(myjsonobj)
        .then((value) => print("user with customid added"))
        .catchError((error) => print("failed to add user: $error"));
  }

  Future getDoc() async {
    var a = await FirebaseFirestore.instance
        .collection('Mark_Member_attendance')
        .doc(customId)
        .get();
    if (a.exists) {
      print('Exists');
      existinmessage = "Attendance Already Marked Today!";
      select_color = Colors.red;
      return a;
    }
    if (!a.exists) {
      print('Not exists');
      existinmessage = "Attendance Marked Successfully!";
      select_color = Colors.teal;
      return null;
    }
  }
}
