import 'package:flutter/material.dart';
import 'package:untitled3/servisler/dunyaSaatleri.dart';
class LokasyanSec extends StatefulWidget {
  const LokasyanSec({super.key});

  @override
  State<LokasyanSec> createState() => _LokasyanSecState();
}

class _LokasyanSecState extends State<LokasyanSec> {
  List<DunyaSaatleri> yerler=[
    DunyaSaatleri(lokasyon: "Istanbul", bayrak: "assets/bayraklar/tr.png", arkPlan: "assets/sehirler/ist.png", urlLokasyon: "Europe/Istanbul"),
    DunyaSaatleri(lokasyon: "Berlin", bayrak: "assets/bayraklar/alm.png", arkPlan: "assets/sehirler/berlin.png", urlLokasyon: "Europe/Berlin"),
    DunyaSaatleri(lokasyon: "New York", bayrak: "assets/bayraklar/usa.png", arkPlan: "assets/sehirler/ny.png", urlLokasyon: "America/New_York"),
    DunyaSaatleri(lokasyon: "Tokyo", bayrak: "assets/bayraklar/japonya.png", arkPlan: "assets/sehirler/tokyo.png", urlLokasyon: "Asia/Tokyo"),
    DunyaSaatleri(lokasyon: "Sidney", bayrak: "assets/bayraklar/aus.png", arkPlan: "assets/sehirler/syd.png", urlLokasyon: "Australia/Sydney"),
  ];
  @override
  void guncelle(index) async{
    DunyaSaatleri ornek = yerler[index];
    await ornek.getData();
    Navigator.pop(context,{
      "lokasyon":ornek.lokasyon,
      "bayrak":ornek.bayrak,
      "arkaPlan":ornek.arkPlan,
      "zaman":ornek.zaman,
      "gunduzMu":ornek.gunduzMu,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LOKASYON SEÇ SAYFASI"),
      backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: yerler.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 1.0,
            horizontal: 4.0
          ),
          child: Card(
            child: ListTile(
              onTap: (){
                guncelle(index);
              },
              title: Center(child: Text(yerler[index].lokasyon.toString())),
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  "${yerler[index].bayrak.toString()}"
                ),
              ),
              trailing: CircleAvatar(
                backgroundImage: AssetImage(
                  "${yerler[index].arkPlan.toString()}"
                ),
              ),
            ),
          )
          );
        }
      ),
    );
  }
}
