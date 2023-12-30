import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled3/pages/lokasyanSec.dart';
import 'package:http/http.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map m={};
  @override

  void initState(){
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
 m=m.isNotEmpty ? m:ModalRoute.of(context)!.settings.arguments as Map;
 print(m);
 Color bgColor=m["gunduzMu"] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                m["gunduzMu"]==true?"assets/zaman/gunduz.png":"assets/zaman/gece.png"),
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(onPressed: ()async{
                  dynamic sonuc=await Navigator.pushNamed(context, "/lokasyon");
                  setState(() {
                    m={
                      "zaman": sonuc["zaman"],
                      "lokasyon":sonuc["lokasyon"],
                      "gunduzMu":sonuc["gunduzMu"],
                      "bayrak":sonuc["bayrak"],
                    };
                  });
                },
                    icon: Icon(Icons.location_on,
                      size: 50.0,
                      color: Colors.blue,)),
                SizedBox(height: 30.0,),
                Text("Konumu Düzenle",style: TextStyle(
                    fontSize: 20.0, letterSpacing: 3.0
                ),),
                SizedBox(height: 20.0,),
                Text(m["lokasyon"],
                  style: TextStyle(fontSize: 30.0,color: Colors.red,
                      letterSpacing: 4.0),),
                SizedBox(height: 30.0,),
                Text(m["zaman"],
                  style: TextStyle(fontSize: 50.0,color: Colors.black),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
