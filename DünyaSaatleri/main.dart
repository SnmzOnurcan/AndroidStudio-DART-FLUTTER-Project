import 'package:flutter/material.dart';
import 'pages/lokasyanSec.dart';
import 'pages/yukleniyor.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/lokasyon",
  routes: {
    "/":(context) => Yukleniyor(),
    "/lokasyon":(context) => LokasyanSec(),
    "/home":(context) => Home(),
  },
));
