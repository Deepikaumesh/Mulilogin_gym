import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../main.dart';
import '../Auth/loginn.dart';
import '../../Reserved Files/Member_Mark_Attendance_Page.dart';
import '../../Reserved Files/member_attendance.dart';
import '../../Reserved Files/Member_Mark_Attendance_Page_Test.dart';
import 'Member_Mark_Attendance_Page_Test2.dart';


class memberhome extends StatefulWidget {
  const memberhome({Key? key}) : super(key: key);

  @override
  State<memberhome> createState() => _memberhomeState();
}

class _memberhomeState extends State<memberhome> {

  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 1),
        () => 'Data Loaded',
  );

  @override
  void initState() {
    setState(() {
      member_name;
      member_Image;
    });
    getDoc_name();

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,



        title: FutureBuilder<String>(
          future: _calculation, // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = <Widget>[
                Text("${member_name}",style: TextStyle(fontSize: 20,color: Colors.white),),
            CircleAvatar(
                            backgroundColor: Colors.transparent,
                              radius: 20,
                              backgroundImage: NetworkImage(member_Image)),
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                SizedBox(),

              ];
            } else {
              children = const <Widget>[


              ];
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: children,

            );
          },
        ),

      ),
      drawer: Drawer(

      ),
      
      
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 00,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 200))),
                onPressed: () {},
                child: Text("WELCOME")),
            SizedBox(
              height: 60,
            ),




            // ElevatedButton(
            //     style: ButtonStyle(
            //         foregroundColor: MaterialStateProperty.all(Colors.white),
            //         backgroundColor: MaterialStateProperty.all(Colors.black),
            //         minimumSize: MaterialStateProperty.all(Size(350, 50))),
            //     onPressed: () {
            //       Navigator.push(context, MaterialPageRoute(builder: (context)=>Member_Mark_Attendance_Test2()));
            //     },
            //     child: Text("Create Profile")), SizedBox(
            //   height: 60,
            // ),


            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Member_Mark_Attendance_Test2()));
                },
                child: Text("Mark Attndance")),
            SizedBox(
              height: 60,
            ),

            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {},
                child: Text("Physical Details")),

            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {},
                child: Text("Workout")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {},
                child: Text("Diet Plans")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {},
                child: Text("Contact trainer")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {},
                child: Text("Product Buying")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {
                  var timeNow = DateTime.now().hour;
                  print(timeNow);
                },
                child: Text("Fee Payment")),





          ]),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  Future getDoc_name() async {
    var a = await FirebaseFirestore.instance
        .collection('Member_Add_Data')
        .doc(email_get)
        .get();
    if (a.exists) {


      member_name = a.get('name');
      member_Image = a.get('image');
      print(member_name);


      return a;
    }
    if (!a.exists) {
      print('Not exists');

      return null;
    }
  }








}




