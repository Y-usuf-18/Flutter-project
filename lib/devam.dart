import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(DevamButton());
}

class DevamButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Devam Butonu",
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("AKILLI REHBER"),
          ),
          backgroundColor: Color(0xff6200ee),
        ),
        body: Center(
          child: SizedBox(
            width: 200,
            height: 50,
            child: RaisedButton(
              onPressed: () {},
              child: Text(
                "DEVAM",
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}