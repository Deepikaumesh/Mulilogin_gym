import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class membervideo extends StatefulWidget {
  const membervideo({Key? key}) : super(key: key);

  @override
  State<membervideo> createState() => _membervideoState();
}

class _membervideoState extends State<membervideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Member"),
        actions: [
          IconButton(
            onPressed: () {
              //logout(context);
            },
            icon: Icon(
              Icons.add_alert_outlined,
            ),
          )
        ],
      ),
      drawer: Drawer(),


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
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {},
                child: Text("Lat Day")),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {},
                child: Text("Chest Day")),

            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {},
                child: Text("Arms Day")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {},
                child: Text("Shoulder day")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(350, 50))),
                onPressed: () {},
                child: Text("Leg Day")),

          ]),
        ),
      ),
    );
  }
}



