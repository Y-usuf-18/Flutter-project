import 'package:akilliRehber/models/siniflar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'dart:convert';
import 'package:akilliRehber/dersler.dart';
import 'package:akilliRehber/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());

}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings){
        return null;
      },
      title: 'Hoşgeldiniz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      home: SplashScreen.navigate(
        name: 'assets/splash.flr',
        next: Hosgeldiniz(),
        startAnimation: '1',
        until: () => Future.delayed(Duration(seconds: 3)),
        backgroundColor: Color(0xff6200ee),
      ),
    );
  }
}

class CallHome extends StatefulWidget {
  @override
  _CallHomeState createState() => _CallHomeState();
}
class _CallHomeState extends State<CallHome> {
  @override
  Widget build(BuildContext context) {
    return Hosgeldiniz();
  }
}

class Hosgeldiniz extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hosgeldiniz",
      debugShowCheckedModeBanner: false,
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
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Profil()),
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
                  Icon(Icons.navigate_next, size: 40,),
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

class Profil extends StatefulWidget{

  @override
  _ProfilState createState() =>_ProfilState();
}
class _ProfilState extends State<Profil>{
  final myController = TextEditingController();
  SharedPreferences mySharedPreferences;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((sf){
      mySharedPreferences=sf;
    });
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Oluştur',
      home: Theme(
        data: ThemeData(
          primaryColor: Color(0xff6200ee),
          accentColor: Color(0xff6200ee),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text("AKILLI REHBER"),
            centerTitle: true,
          ),
          body: Padding(padding: EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('İsiminizi Giriniz:',
                            style: TextStyle(fontSize: 28, height: 2, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        labelText: "İsim Soyisim",
                        prefixIcon: Icon(Icons.person,color: Color(0xff6200ee),),
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),

                        ),

                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      maxLength: 25,
                      maxLengthEnforced: true,
                      controller: myController,
                      validator: (String girilenVeri) {
                        if(girilenVeri.length<6){
                          return "Lütfen adınızı ve soyadınızı girin";
                        }else return null;
                      },
                      onSaved:(String deger){
                        nameSurname = deger;
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                          width: 210,
                          child: RaisedButton(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color:Color(0xff6200ee)),

                            ),
                            color: Color(0xff6200ee),
                            textColor: Colors.white,
                            onPressed: _girisBilgileriniOnayla,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("DEVAM ET",style: TextStyle(fontSize: 20)),
                                Icon(Icons.navigate_next, size: 30,)
                              ],

                          ),),
                  ),
                  )
                ],

              ),
            ),
            ),
          ),
      ),
      );
  }
  void _girisBilgileriniOnayla(){
    if(formKey.currentState.validate()){
      formKey.currentState.save();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Siniflar()),
      );
    }
  }

}

class Siniflar extends StatefulWidget{


  @override
  _SiniflarState createState() =>_SiniflarState();
}
class _SiniflarState extends State<Siniflar>{

  Future<List> veriOku() async{
    var gelenJson = await DefaultAssetBundle.of(context).loadString("assets/data/mufredat.json");
    List<Sinif> sinifListesi = (json.decode(gelenJson) as List).map((mapYapisi) => Sinif.fromJson(mapYapisi)).toList();
    return sinifListesi;

  }
  List<Sinif> tumSiniflar;
  @override void initState() {
    super.initState();
    veriOku().then((gelenSiniflar){
      setState(() {
        tumSiniflar = gelenSiniflar;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sınıf Seçimi',
      home: Scaffold(
        appBar: AppBar(

          backgroundColor: Color(0xff6200ee),
          title: Text("AKILLI REHBER"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(

            children:[
              new Container(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Bir sınıf seçiniz:',
                        style: TextStyle(fontSize: 28, height: 3, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              new Container(
                alignment: Alignment.center,
                child: FutureBuilder(
                    future: veriOku(),
                    builder:(context, sonuc){

                          if(sonuc.hasData){
                            tumSiniflar = sonuc.data;
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                                child: RaisedButton(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(color:Color(0xff6200ee)),

                                  ),
                                  color: Color(0xff6200ee),
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.push(context,
                                    new MaterialPageRoute(builder: (context) => DersListesi(sinifadi: tumSiniflar[index],))
                                    );
                                  },
                                    child: Text(tumSiniflar[index].sinif,style: TextStyle(
                                      fontSize: 24,
                                    ),
                                    ),
                                  ),
                              );
                            },
                            itemCount: tumSiniflar.length,
                            );
                          }else{
                            return Center(child: CircularProgressIndicator(),);
                          }
    }),
    ),
              const SizedBox(height: 50),

            ],
          ),
        ),
    ),
    );
    }
}
