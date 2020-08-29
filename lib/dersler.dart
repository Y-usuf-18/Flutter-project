import 'package:akilliRehber/main.dart';
import 'package:akilliRehber/models/siniflar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';


class DersListesi extends StatefulWidget{
  @override
  _DersListesiState createState() =>_DersListesiState();
}

class _DersListesiState extends State<DersListesi>{

  List<Sinif> tumSiniflar;
  @override void initState() {
    // TODO: implement initState
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
      title: 'Dersler',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Siniflar()),
            ),
          ),
          backgroundColor: Color(0xff6200ee),
          title: Text("AKILLI REHBER"),
          centerTitle: true,
        ),
        body: Column(

          children:[
            new Container(
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Türk Dili ve Edebiyatı',
                      style: TextStyle(fontSize: 28, height: 2 ,fontWeight: FontWeight.bold)),
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
                        shrinkWrap: true,
                        itemBuilder: (context, index) {

                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: CheckboxListTile(
                              value: true,
                              onChanged: (value) {},

                              title: Text(tumSiniflar[0].dersler[0].konular[index].toString(),style: TextStyle(
                                fontSize: 16,
                              ),
                              ),

                            ),
                          );


                        },
                        itemCount: tumSiniflar[0].dersler[0].konular.length,
                      );
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }



  Future<List> veriOku() async{
    var gelenJson = await DefaultAssetBundle.of(context).loadString("assets/data/mufredat.json");
    List<Sinif> sinifListesi = (json.decode(gelenJson) as List).map((mapYapisi) => Sinif.fromJson(mapYapisi)).toList();
      for ( int a=0; a<sinifListesi[0].dersler[0].konular.length; a++ ) {
        debugPrint("Ders: " + sinifListesi[0].dersler[0].konular[a].toString());
      }
    return sinifListesi;

  }
}


