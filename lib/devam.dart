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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,


            children: [
              Text("Üniversite hazırlık başta olmak üzere hedefine ulaşmak isteyen her lise öğrencisinin kendini takip edebilmek için kullanacağı sanal rehber uygulaması. Uygulama öncelikle öğrencinin mevcut durumunu analiz edecek ve hedefine ulaşması için ne yapması gerektiği konusunda yönlendirecek",style: TextStyle(fontSize: 13),textAlign: TextAlign.center,),
              SizedBox(
                width: 200,
                height: 50,
                child: RaisedButton(
                  color: Color(0xff6200ee),
                  onPressed: () {},
                  child: Text(
                    "DEVAM",
                    style: TextStyle(
                      fontSize: 19,color: Colors.white

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}