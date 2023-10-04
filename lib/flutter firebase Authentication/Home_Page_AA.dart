
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_multilogin/flutter%20firebase%20Authentication/phone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appavailability/flutter_appavailability.dart';
import 'SignIn_Page.dart';










class Home_Page_a extends StatefulWidget {
  const Home_Page_a({Key? key}) : super(key: key);

  @override
  _Home_Page_aState createState() => _Home_Page_aState();
}

class _Home_Page_aState extends State<Home_Page_a> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home_Page"),
      actions: [
        TextButton(onPressed: ()async{

               await auth.signOut();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  Sign_In_page()), (Route<dynamic> route) => false);

        },
            child: Text("Log Out",style: TextStyle(color: Colors.white,fontSize: 19),)),
        SizedBox(width: 20,),
      ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 50,),
          // auth.currentUser!.emailVerified?SizedBox(height: 1,):
          //     Text("${auth.currentUser!.email!} not verified"),
          // SizedBox(
          //   height: 150,
          // ),

//          Text(auth.currentUser!.email!),
         // Center(child: Text(auth.currentUser!.emailVerified ? "email verified" : "email not verified")),

          Center(child: auth.currentUser!.emailVerified ?Text("Email Verified",
            style: TextStyle(color: Colors.green.shade900),) : Text("Email not verified")),




          auth.currentUser!.emailVerified
              ? SizedBox(
            height: 1,
          )
              : TextButton(
            onPressed: () {
              openEmailApp(context);

              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(
                    top: 40,
                    bottom:
                    MediaQuery.of(context).size.height - 400,
                    right: 40,
                    left: 40),
                duration: const Duration(minutes: 1),
                content: const Text("Please Relogin to continue"),
                action: SnackBarAction(
                  label: 'Ok',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Text("verify now!"),
          ),
SizedBox(height: 50,),

          Center(
            child: InkWell(
                onTap: (){

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (Buildcontext) => MyPhone()));
                },
                child: Text("Verify Mobile",style: TextStyle(fontSize: 15,color: Colors.orange,),)),
          ),
SizedBox(height: 30,),
          Center(
            child: InkWell(
                onTap: (){

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (Buildcontext) => Firebase_file_upload_Mainpage()));
                },
                child: Text("File Upload",style: TextStyle(fontSize: 15,color: Colors.teal,),)),
          ),

          SizedBox(height: 30,),
          Center(
            child: InkWell(
                onTap: (){

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (Buildcontext) => file_crud()));
                },
                child: Text("File Display",style: TextStyle(fontSize: 15,color: Colors.red.shade900,),)),
          ),

          SizedBox(height: 30,),
          Center(
            child: InkWell(
                onTap: (){

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (Buildcontext) => image_send_and_display()));
                },
                child: Text("image send display ",style: TextStyle(fontSize: 15,color: Colors.red.shade900,),)),
          ),
          SizedBox(height: 30,),

          Center(
            child: InkWell(
                onTap: (){

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (Buildcontext) => image_form()));
                },
                child: Text("firebase flutter data image crud full",style: TextStyle(fontSize: 15,color: Colors.red.shade900,),)),
          ),







        ],

      )

    );
  }


  void openEmailApp(BuildContext context) {
   try {

      AppAvailability.launchApp(
          Platform.isIOS ? "message://" : "com.google.android.gm")
          .then((_) {
        print("App Email launched!");
      }).catchError((err) {
        final snackBar = SnackBar(
          content: const Text("Error"),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
         ),
       );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print(err);
      });
    } catch (e) {
      final snackBar = SnackBar(
        content: const Text("Error"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
