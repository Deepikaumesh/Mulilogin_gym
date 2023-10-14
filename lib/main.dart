import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Firebase Multi Login_Gym/Auth/loginn.dart';


var email_get;

var member_name;


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      // options: FirebaseOptions(
      //   apiKey: "",
      //   appId: "",
      //   messagingSenderId: "",
      //   projectId: "",
  //)
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:LoginPage(),
    );
  }
}
