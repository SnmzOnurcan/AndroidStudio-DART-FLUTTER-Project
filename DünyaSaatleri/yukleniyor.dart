import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";
import "../servisler/dunyaSaatleri.dart";
class Yukleniyor extends StatefulWidget {
  const Yukleniyor({super.key});

  @override
  State<Yukleniyor> createState() => _YukleniyorState();
}

class _YukleniyorState extends State<Yukleniyor> {
  String saat="";
  void saatAyarla() async
  {
    DunyaSaatleri d1=DunyaSaatleri(
        lokasyon: "istanbul", bayrak: "bayrak",
        arkPlan: "arkaPlan", urlLokasyon: "Europe/Istanbul");
    await d1.getData();
    Navigator.pushReplacementNamed(context, "/home",
        arguments: {
          "lokasyon":d1.lokasyon,
          "bayrak":d1.bayrak,
          "arkaPlan":d1.arkPlan,
          "zaman":d1.zaman,
          "gunduzMu":d1.gunduzMu
        });
    setState(() {
      saat=d1.zaman;
    });
  }
  @override
  void initState()
  {
    super.initState();
    saatAyarla();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Center(
          child: SpinKitFadingCube(
            color:Colors.white,
            size:50.0,
          ),
        ),
      ),
    );
  }
}
