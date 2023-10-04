import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:image_picker/image_picker.dart';

import 'Member_add_data.dart';
import 'Member_home_page.dart';



class Member_add_data extends StatefulWidget {
  const Member_add_data({Key? key}) : super(key: key);

  @override
  _Member_add_DataState createState() => _Member_add_DataState();
}

class _Member_add_DataState extends State<Member_add_data> {
  String dropdownValue = 'Male';
  var _image;
  final picker = ImagePicker();


  TextEditingController _name=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController age=TextEditingController();
  TextEditingController gender=TextEditingController();
  TextEditingController address=TextEditingController();

  late bool status;

  late String message;

  File? get filePath => null;

  get ref => null;

  @override
  void initState() {


    status = false;
    message = "";

    super.initState();
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future choose_image_gallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this._image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future choose_image_camera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this._image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green.shade50,

      appBar: AppBar(
        title: Text('Details'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height : 240,
            //
            //   child:  Image.asset('assets/images/c8.avif'),),
            Container(
              // margin: EdgeInsets.all(30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                // border:Border.all(width:2,color: Colors.green.shade600),
                // borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              // height: MediaQuery.of(context).size.height,
              // width: double.infinity,
              child: Form(
                key: formkey,
                child: Column(

                  children: [
                    SizedBox(height: 30,),
                    TextFormField(
                      controller: _name,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter a Name";
                        }
                        return null;
                      },
                      onSaved: (name) {},
                      obscureText: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.grey.shade900),
                        ),
                        label: Text("Name"),
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            // color: Colors.grey[400],
                            color: Colors.grey.shade500,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade500,
                            )),
                      ),
                    ),
                    SizedBox(height: 30,),
                    TextFormField(
                      controller: phone,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter  Phone Number";
                        }
                        return null;
                      },
                      onSaved: (phone) {},
                      obscureText: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.grey.shade900),
                        ),
                        label: Text("phone"),
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            // color: Colors.grey[400],
                            color: Colors.grey.shade500,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade500,
                            )),
                      ),
                    ),
                    SizedBox(height: 30,),



                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade900),
                        ),
                        enabledBorder: OutlineInputBorder(
                          //<-- SEE HERE
                          // borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                        // focusedBorder: OutlineInputBorder(
                        //   //<-- SEE HERE
                        //   borderSide: BorderSide(color: Colors.black, width: 2),
                        // ),
                        filled: true,
                        //fillColor: Colors.greenAccent,
                      ),
                      dropdownColor: Colors.white,
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['Male', 'Female']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 20),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 30,),
                    TextFormField(
                      controller: address,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter  Address";
                        }
                        return null;
                      },
                      onSaved: (name) {},
                      obscureText: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: Colors.grey.shade900),
                        ),
                        label: Text("Adress"),
                        labelStyle: TextStyle(color: Colors.black),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            // color: Colors.grey[400],
                            color: Colors.grey.shade500,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade500,
                            )),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Choose Image",
                          style: GoogleFonts.hindVadodara(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.photo_outlined,
                            size: 35,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            choose_image_gallery();
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            size: 35,
                            color: Colors.black87,
                          ),
                          onPressed: () {
                            choose_image_camera();
                          },
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                          height: 100,
                          width: 200,
                          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),  color: Colors.grey,
                          //),

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: _image != null
                                ? Image.file(
                              _image,
                              fit: BoxFit.cover,
                            )
                                : Center(
                                child: Text(
                                  "No image selected",
                                  style: GoogleFonts.hindVadodara(
                                      fontSize: 13, color: Colors.red.shade900),
                                )),
                          )),
                    ),
                    SizedBox(height: 20,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 17,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            setState(()  {

                              uploadimage();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Member_add_data(),
                                ),
                              );


                            });
                          }
                        },
                        child: Text(
                          'CONTINUE',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),

                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black45,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),onPressed: (){
                   //   Navigator.push(context, MaterialPageRoute(builder: (context)=>view_image()));

                    }, child: Text("View Images")),

                    // Text(
                    //   status ? message : message,
                    //   style: GoogleFonts.lato(
                    //       fontSize: 12,
                    //       color: Colors.red.shade900,
                    //       fontWeight: FontWeight.bold),
                    // ),



                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black45,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Member_add_data()));

                    }, child: Text("gO tO hOME")),

                  ],
                ),

                //],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> uploadimage()  async {

    // print(_image);

    String fileName = _image.path.split('/').last;

    var snapshot = await FirebaseStorage.instance.ref().child('My_images/$fileName').putFile(_image);

    var url = await snapshot.ref.getDownloadURL();

    var image_url = url.toString();

    Map<String, dynamic> demodata = {
      "image": image_url,
      "name"  :_name.text,
      "phone"  :phone.text,
      "gender"  :dropdownValue,
      "address"  :address.text,
      "age" :age.text,
    };

    CollectionReference collectionreference =
    FirebaseFirestore.instance.collection('image_tb');
    collectionreference.add(demodata)
        .whenComplete(() {
      Fluttertoast.showToast(
        msg: "Inserted successfully",
        // // toastLength: Toast.LENGTH_SHORT,
        // backgroundColor: Colors.teal,
        // textColor: Colors.white
      );
    });

  }

}

