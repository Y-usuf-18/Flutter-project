import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6200ee),
          title: Center(
            child: Text("AKILLI REHBER"),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround ,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 71, top: 10),
                  child: Text(
                    "Sınıfınızı Seçiniz",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "9.SINIF",
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "10.SINIF",
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "11.SINIF",
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "12.SINIF",
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "YKS HAZIRLIK",
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
