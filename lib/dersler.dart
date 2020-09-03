import 'package:akilliRehber/globals.dart';
import 'package:akilliRehber/konular.dart';
import 'package:akilliRehber/models/siniflar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';



class DersListesi extends StatefulWidget{
  final Sinif sinifadi;
  final Dersler dersadi;
  final String adisoyadi;
  final Konular konuadi;
  DersListesi({this.sinifadi,this.adisoyadi, this.konuadi, this.dersadi});



  @override
  _DersListesiState createState() =>_DersListesiState();
}
class _DersListesiState extends State<DersListesi>{




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
    int doluCheckboxlar =widget.dersadi.konular.where((durum) => durum.durum == true).length;
    int tumCheckboxlar =widget.dersadi.konular.length;
    double yuzde = double.parse((doluCheckboxlar/tumCheckboxlar).toStringAsFixed(2));
    if( yuzde == double.infinity ){
      yuzde =0;
    } else yuzde = double.parse((doluCheckboxlar/tumCheckboxlar).toStringAsFixed(2));
    debugPrint("$yuzde" );



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dersler',
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
                decoration: const BoxDecoration(
                  border: Border(

                    bottom: BorderSide(width: 1.0, color: Colors.black26),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text( nameSurname, style: TextStyle(fontSize: 24, height: 2 ,fontWeight: FontWeight.w500), textAlign: TextAlign.left,),

                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text( widget.sinifadi.sinif, style: TextStyle(fontSize: 18, height: 2 ,fontWeight: FontWeight.w400), textAlign: TextAlign.left,),

                            ],
                          ),
                        ],
                      ),
                      new Column(

                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[


                              new CircularPercentIndicator(

                                radius: 100.0,
                                lineWidth: 10.0,
                                animation: true,
                                percent: yuzde,
                                center: new Text(
                                  yuzde.toString()+"%",
                                  style:
                                  new TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0),
                                  textAlign: TextAlign.left,
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Color(0xff6200ee),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
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

                            int a =widget.sinifadi.dersler[index].konular.where((durum) => durum.durum == true).length;
                            int b =widget.sinifadi.dersler[index].konular.length;
                            debugPrint("$a" );
                            debugPrint("$b" );

                            double c = double.parse((a/b).toStringAsFixed(2));
                            if( c == double.infinity ){
                              c =0;
                            } else c = double.parse((a/b).toStringAsFixed(2));
                            debugPrint("$c" );

                            return ListTile(

                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: <Widget>[
                                  Text(widget.sinifadi.dersler[index].ders.toString(),style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  ),
                                  new LinearPercentIndicator(
                                    animation: true,
                                    width: 100.0,
                                    lineHeight: 8.0,
                                    percent: c,
                                    progressColor: Color(0xff6200ee),
                                  )
                                ],
                              ),

                              onTap: () {
                                Navigator.push(context,
                                    new MaterialPageRoute(builder: (context) => KonuListesi(dersadi: widget.sinifadi.dersler[index],))
                                );
                              },
                            );


                          },
                          itemCount: widget.sinifadi.dersler.length,
                        );
                      }else{
                        return Center(child: CircularProgressIndicator(),);
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Future<List> veriOku() async{
    var gelenJson = await DefaultAssetBundle.of(context).loadString("assets/data/mufredat.json");
    List<Sinif> sinifListesi = (json.decode(gelenJson) as List).map((mapYapisi) => Sinif.fromJson(mapYapisi)).toList();
      for ( int a=0; a<sinifListesi[0].dersler.length; a++ ) {
        debugPrint("Ders: " + sinifListesi[0].dersler[0].ders.toString());
      }
    return sinifListesi;

  }

}


