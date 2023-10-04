// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import '../Firebase Multi Login/login.dart';
//
// class Owner extends StatefulWidget {
//   const Owner({super.key});
//
//   @override
//   State<Owner> createState() => _OwnerState();
// }
//
// class _OwnerState extends State<Owner> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Owner"),
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
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(height: 100,),
//
//
//             TextButton(onPressed: (){
//              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Dropdown_Button_formfield()));
//             }, child: Text("check"))
//
//           ],
//         ),
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
