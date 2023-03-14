import 'package:dinamic_note_code/Widgets/ortalama_Hesapla_page.dart';
import 'package:dinamic_note_code/constans/app_constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:  "Not Islemleri",
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity),
      home: ortalamaHesapla(),
    );
  }
}
