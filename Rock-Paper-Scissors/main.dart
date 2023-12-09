import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(MaterialApp(
  home: Oyun(),
));

class Oyun extends StatefulWidget {
  const Oyun({super.key});

  @override
  State<Oyun> createState() => _OyunState();
}

class _OyunState extends State<Oyun> {
  var random=Random();
  int bSayi=1;
  int kSayi=1;
  int sonuc=1;
  int kPuan=0;
  int bPuan=0;
  String bResim="assets/images/tas.png";
  String kResim="assets/images/tas.png";
  String yazi="";
  String secimYap(int sayi){
      String ifade="assets/images/soru.png";
      if(sayi==1){
        ifade="assets/images/tas.png";
      }
      else if(sayi==2){
        ifade="assets/images/makas.png";
      }
      else{
        ifade="assets/images/kagit.png";
      }
      return ifade;
  }
  void oyunBasla(){
    setState(() {
      bSayi=random.nextInt(3) + 1;
      bResim=secimYap(bSayi);
      kResim=secimYap(kSayi);

      if(kSayi==1)//1-taş, 2-kağıt, 3-makas
        {

          if(bSayi==1){
            yazi="Berabere";
            kPuan+=5;
            bPuan+=5;
          }

          if(bSayi==2){
            yazi="Taş Makası Kırar. Kazandın";
            kPuan+=10;

          }

          if(bSayi==3){
            yazi="Kağıt Taşı Sarar. Kaybettin";
            bPuan+=10;
          }

        }

      if(kSayi==2)//1-taş, 2-makas, 3 kağıt
          {

        if(bSayi==1){
          yazi="Taş Makası Kırar. Kaybettin";
          bPuan+=10;
        }

        if(bSayi==2){
          yazi="Berabere";
          kPuan+=5;
          bPuan+=5;
        }

        if(bSayi==3)
        {
          yazi="Makas kağıdı keser. Kazandın";
          kPuan+=10;
        }

      }

      if(kSayi==3)//1-taş, 2-kağıt, 3-makas
          {

        if(bSayi==3)
        {
          yazi="Berabere";
          kPuan+=5;
          bPuan+=5;
        }

        if(bSayi==2)
        {
          yazi="Makas Kağıdı keser. Kaybettin";
          bPuan+=10;
        }

        if(bSayi==1)
        {
          yazi="Kağıt Taşı Sarar. Kazandın";
          kPuan+=10;
        }
      }
      if(bPuan>=70){
        _showAlertDialog("Bilgisayar Kazandı");
      }
      if(kPuan>=70){
        _showAlertDialog("Kullanıcı Kazandı");
      }
    });
  }
  _showAlertDialog(String message) async{
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Oyun Bitti"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(message),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      bPuan=0;
                      kPuan=0;
                    });
                    Navigator.of(context).pop();
                  },
                      child: Text("Yeniden Oyna"))
                ],
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TAŞ KAĞIT MAKAS",style: TextStyle(fontWeight: FontWeight.bold),), centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [

              GestureDetector(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage("assets/images/tas.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),onTap: (){
                  setState(() {
                    kSayi=1;
                  });
                  print("You Select Rock");
              },
          ),

              GestureDetector(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage("assets/images/makas.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),onTap: (){
                  setState(() {
                    kSayi=2;
                  });
                  print("You Select Scissors");
              },
      ),

               GestureDetector(
                 child: Container(
                   width: 100.0,
                   height: 100.0,
                   decoration: BoxDecoration(
                     color: Colors.black,
                     image: DecorationImage(
                       image: AssetImage("assets/images/kagit.png"),
                       fit: BoxFit.fill,
                     ),
                   ),
                 ),onTap: (){
                   setState(() {
                     kSayi=3;
                   });
                   print("You Select Paper");
               },
           ),
            ],
          ),

          SizedBox(height: 20.0),

          ElevatedButton(onPressed: (){
            oyunBasla();
          },
          child: Text("OYUNA BAŞLA",
            style: TextStyle(
              color: Colors.black54,
              letterSpacing: 4.0,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
           ),
          ),

          Divider(
            height: 20.0,
            color: Colors.blue,
            thickness: 5.0,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

            Text("BİLGİSAYAR",
            style: TextStyle(
              color: Colors.black54,
              letterSpacing: 4.0,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
                ),
              ),
              SizedBox(width: 20.0),
              Text("KULLANICI",
                style: TextStyle(
                  color: Colors.black54,
                  letterSpacing: 4.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/robot.jpg",
              height: 100.0,
                width: 150.0,
              ),
              SizedBox(width: 25.0),
              Image.asset("assets/images/beykent.png",
                height: 100.0,
                width: 150.0,
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("$bResim",
                height: 100.0,
                width: 150.0,
              ),
              SizedBox(width: 10.0),
              Image.asset("$kResim",
                height: 100.0,
                width: 150.0,
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             Text("B Puan $bPuan",
             style: TextStyle(
               color: Colors.black54,
               letterSpacing: 4.0,
               fontWeight: FontWeight.bold,
               fontSize: 20.0,
             ),
             ),
              SizedBox(width: 20.0,),
              Text("K Puan $kPuan",
                style: TextStyle(
                  color: Colors.black54,
                  letterSpacing: 4.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Text("Oynanan Oyunda: $yazi",
            style: TextStyle(
              color: Colors.black54,
              letterSpacing: 4.0,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}