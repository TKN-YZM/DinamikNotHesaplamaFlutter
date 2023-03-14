import 'package:dinamic_note_code/Helper/dataHelper.dart';
import 'package:dinamic_note_code/constans/app_constants.dart';
import "package:flutter/material.dart";

import '../Model/ders.dart';

class DersListesi extends StatelessWidget {
  final  Function onElemanCikartildi;
  const DersListesi({required this.onElemanCikartildi, Key? key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
    List<Ders> tumListe=DataHelper.tumDersler;

    return tumListe.length>0? ListView.builder(itemCount: tumListe.length,itemBuilder: (contex,index){
      return Dismissible(
        key: UniqueKey(),
        direction:  DismissDirection.startToEnd,
        onDismissed: (a){
           onElemanCikartildi(index);
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            child: ListTile(
              title: Text(tumListe[index].ad),
              leading: CircleAvatar(
                backgroundColor: Sabitler.anaRenk.shade100,
                child: Text((tumListe[index].harfDegeri*tumListe[index].krediDegeri).toStringAsFixed(1)),
              ),
              subtitle: Text("Kredi Degeri: ${tumListe[index].krediDegeri}  Not Degeri: ${tumListe[index].harfDegeri}"),
            )
          ),
        ),
      );
    }):Center(child: Container(child: Text("Lütfen Ders Ekleyin",style: Sabitler.baslikFont,)),);
  }
}