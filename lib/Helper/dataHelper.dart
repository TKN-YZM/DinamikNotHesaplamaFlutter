
import 'package:dinamic_note_code/Model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper{

  static List<Ders> tumDersler=[];

  static dersEkle(Ders ders){
    tumDersler.add(ders);
  }
  
  static double ortalamaBul(){
    double toplamNot=0;
    double toplamKredi=0;
    tumDersler.forEach((element) {
      toplamNot=toplamNot+(element.krediDegeri*element.harfDegeri);
      toplamKredi+=element.krediDegeri;
    });
    return toplamNot/toplamKredi;
  }

  static List<String> _tumDersHarfleri(){
    return ["AA","BA","BB","CB","CC","DC","DD","FD","FF"];
  }
  static double harfNotuCevir(String harf){
    switch(harf){
      case "AA":
      return 4;
      case "BA":
      return 3.5;
      case "BB":
      return 3.0;
      case "CB":
      return 2.5;
      case "CC":
      return 2;
      case "DC":
      return 1.5;
      case "DD":
      return 1;
      case "FD":
      return 0.5;
      case "FF":
      return 0.0;
      default:
      return 1;
    }
  }

  static List<DropdownMenuItem<double>> tumDersNotHarfleri(){
    return _tumDersHarfleri().map((e) => DropdownMenuItem(child: Text(e),value: harfNotuCevir(e),)).toList();
  }

  static List<int> _tumKredileri(){
    return List.generate(10, (index) => index+1).toList();
  }

  static List<DropdownMenuItem<double>> 
  
  tumDerslerinKredileri(){
    return _tumKredileri().map((e) => DropdownMenuItem
    (child: Text(e.toString()),value: e.toDouble(),)).toList();
  }



}