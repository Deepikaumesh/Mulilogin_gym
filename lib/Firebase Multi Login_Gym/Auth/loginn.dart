import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_multilogin/Firebase%20Multi%20Login_Gym/Auth/registerr.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../main.dart';
import '../Owner/Owner_Home_Page.dart';
import '../Trainer/Trainer_Add_Data.dart';
import '../Trainer/Trainer_HomePage.dart';
import '../member/Member_add_data.dart';
import '../member/Member_home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  var existinmessage;

  @override
  void initState() {
    existinmessage = '';

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.grey.shade400,
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 0.70,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isObscure3,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure3
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 15,
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                            onPressed: ()
                                //async
                                {
                              setState(() {
                                visible = true;
                              });

                              if (_formkey.currentState!.validate()) {
                                signIn(emailController.text,
                                    passwordController.text);
                                emailController.clear();
                                passwordController.clear();
                              }
                            },
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New User?',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 15),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()));
                                },
                                child: Text("Register Now"))
                          ],
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        // Visibility(
                        //     maintainSize: true,
                        //     maintainAnimation: true,
                        //     maintainState: true,
                        //     visible: visible,
                        //     child: Container(
                        //         child: CircularProgressIndicator(
                        //       color: Colors.white,
                        //     ))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('userdata')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        FirebaseFirestore.instance
            .collection('Trainer_Add_Data')
            .limit(1)
            .get()
            .then((snapshot) {
          //  FirebaseFirestore.instance.collection('image_tb').limit(1).get().then((snapshot) {

          if (documentSnapshot.get('role') == "Trainer" && snapshot.size == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Trainer(),
              ),
            );
          }

          if (documentSnapshot.get('role') == "Trainer" && snapshot.size == 0) {
            print("No collection");

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Trainer_add_Data(),
              ),
            );
          }
        });

        if (documentSnapshot.get('role') == "Owner") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Owner(),
            ),
          );
        }


        //
        // if (documentSnapshot.get('role') == "Member") {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => memberhome(),
        //     ),
        //   );
        // }

        var kk = await FirebaseFirestore.instance
            .collection('Member_Add_Data')
            .doc(email_get)
            .get();

        if (documentSnapshot.get('role') == "Member" && kk.exists) {
          existinmessage = "member $email_get is exist";
          print(existinmessage);

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => memberhome(),
              ));
        }
        if (documentSnapshot.get('role') == "Member" && !kk.exists) {
          existinmessage = "member $email_get is not exist";
          print(existinmessage);

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Member_add_data(),
              ));
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
        email_get = email;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
