import 'package:dinamic_note_code/constans/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGoster({required this.dersSayisi,required this.ortalama,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dersSayisi>0? "$dersSayisi Ders Girildi":"Ders Secinizi",
          style: Sabitler.dersSayisiStyle,
        ),
        Text(ortalama>=0? "${ortalama.toStringAsFixed(2)}":"0.0",style: Sabitler.ortalamaTextStyle,),
        Text("Ortalama",style:Sabitler.dersSayisiStyle)
      ],
    );
  }
}