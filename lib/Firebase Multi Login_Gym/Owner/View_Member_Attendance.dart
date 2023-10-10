import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

class View_Member_Attendance extends StatefulWidget {
  @override
  State<View_Member_Attendance> createState() => _View_Member_AttendanceState();
}

class _View_Member_AttendanceState extends State<View_Member_Attendance> {
  CollectionReference users =
      FirebaseFirestore.instance.collection('Mark_Member_attendance');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("geeksforgeeks"),
      ),
      body: StreamBuilder(
        stream: users.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          var doc = users.doc('id').get();

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Column(
                children: [

                  Column(

                    children: [
                      Row(
                        children: [
                          Text("Date:"),
                          Text(document['Date']),
                        ],
                      ),

                      Row(
                        children: [
                          Text("Member Name:"),
                          Text(document['name']),
                        ],
                      ),
                    ],
                  ),
                  Divider(thickness: 2,),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Future getDoc() async {
    var orderref =
        FirebaseFirestore.instance.collection("Mark_Member_attendance");
    var docsanpshots = await orderref.get();
    docsanpshots.docs.forEach((doc) {
      if (doc.get('Date') == '${getCurrentDate()}') {
        print("current date");
      } else {}
    });
  }

  String getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }
}