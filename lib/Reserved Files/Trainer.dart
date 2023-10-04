// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../Firebase Multi Login/login.dart';
//
// class Trainer extends StatefulWidget {
//   const Trainer({super.key});
//
//   @override
//   State<Trainer> createState() => _TrainerState();
// }
//
// class _TrainerState extends State<Trainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Trainer"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               logout(context);
//             },
//             icon: Icon(
//               Icons.logout,
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Future<void> logout(BuildContext context) async {
//     CircularProgressIndicator();
//     await FirebaseAuth.instance.signOut();
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => LoginPage(),
//       ),
//     );
//   }
// }
