import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Hosgeldiniz(),
  ));
}



class Hosgeldiniz extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hosgeldiniz",
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
              SizedBox(

                width: 340,
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Üniversite hazırlık başta olmak üzere hedefine ulaşmak isteyen her lise öğrencisinin kendini takip edebilmek için kullanacağı sanal rehber uygulaması. Uygulama öncelikle öğrencinin mevcut durumunu analiz edecek ve hedefine ulaşması için ne yapması gerektiği konusunda yönlendirecek.",style: TextStyle(fontSize: 20, height: 1.5, fontStyle: FontStyle.italic), textAlign: TextAlign.center,),
                ),

              ),

            SizedBox(
            width: 200,
            height: 80,
            child: RaisedButton(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color:Color(0xff6200ee))

              ),
              color: Color(0xff6200ee),

              textColor: Colors.white,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Grade()),
              ),
              child: Container(

                padding: const EdgeInsets.all(10.0),
              child: Row(

                children: <Widget>[

                Text(
                "DEVAM",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
                  Icon(Icons.skip_next, size: 40),
            ],
              ),
            ),
          ),),
          ],
          ),
        ),
      ),
    );
  }
}

class Grade extends StatelessWidget { // Bütün Classları İngilizce isimlendiriyoruz.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sınıf Seçimi',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color(0xff6200ee),
          title: Text("AKILLI REHBER"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround ,
          children: [
            GestureDetector(
              onTap: (){},
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Bir sınıf seçiniz:',
                      style: TextStyle(fontSize: 26, height: 5 ,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Column(

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 200,
                    height: 72,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color:Color(0xff6200ee)),

                      ),
                      color: Color(0xff6200ee),
                      textColor: Colors.white,
                      onPressed: () {},
                      child: Text(
                        "9.SINIF",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 200,
                    height: 72,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color:Color(0xff6200ee)),

                      ),
                      color: Color(0xff6200ee),
                      textColor: Colors.white,
                      onPressed: () {},
                      child: Text(
                        "10.SINIF",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 200,
                    height: 72,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color:Color(0xff6200ee)),

                      ),
                      color: Color(0xff6200ee),
                      textColor: Colors.white,
                      onPressed: () {},
                      child: Text(
                        "11.SINIF",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 200,
                    height: 72,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color:Color(0xff6200ee)),

                      ),
                      color: Color(0xff6200ee),
                      textColor: Colors.white,
                      onPressed: () {},
                      child: Text(
                        "12.SINIF",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 200,
                    height: 72,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color:Color(0xff6200ee)),

                      ),
                      color: Color(0xff6200ee),
                      textColor: Colors.white,
                      onPressed: () {},
                      child: Text(
                        "YKS HAZIRLIK",
                        style: TextStyle(
                          fontSize: 24,
                        ),
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
