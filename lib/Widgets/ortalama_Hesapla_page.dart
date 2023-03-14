import 'package:dinamic_note_code/Helper/dataHelper.dart';
import 'package:dinamic_note_code/Model/ders.dart';
import 'package:dinamic_note_code/Widgets/dersListesi.dart';
import 'package:dinamic_note_code/Widgets/harf_dropdown_widget.dart';
import 'package:dinamic_note_code/Widgets/kredi_down_widget.dart';
import 'package:dinamic_note_code/Widgets/ortalama_goster.dart';
import 'package:dinamic_note_code/constans/app_constants.dart';
import 'package:flutter/material.dart';

class ortalamaHesapla extends StatefulWidget {
  ortalamaHesapla({Key? key}) : super(key: key);

  @override
  State<ortalamaHesapla> createState() => _ortalamaHesaplaState();
}

class _ortalamaHesaplaState extends State<ortalamaHesapla> {

  var formKey=GlobalKey<FormState>();
  double secilenHarfDegeri=4;
  double secilenKrediDegeri=1;
  String girilenDersAdi="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(child: Text(Sabitler.baslik,style: Sabitler.baslikFont,)),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
               Expanded(
                flex: 2,
                child: _buildForm(),),
               Expanded(
                child: OrtalamaGoster(dersSayisi: DataHelper.tumDersler.length,ortalama: DataHelper.ortalamaBul(),))],),
          Expanded(
            child: DersListesi(
              onElemanCikartildi: (index){
                setState(() {
                   DataHelper.tumDersler.removeAt(index);
                   debugPrint("Eleman Cikartidi ve İndexi: "+index.toString());
                });
               
              },
            )
          )
        ],
      ),
    );
  }
  
  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 8),child:_buildTextForm()),
          SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: HarfDropDowmWidget(
                onHarfSecildi: (deger){
                  secilenHarfDegeri=deger;
                },
              ),)),
              Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: KrediDownWidget(
                onKrediDegeri: (deger){
                  secilenKrediDegeri=deger;
                },
              ),)),
              IconButton(onPressed: (){_dersEkleveOrtalamHesapla();}, icon: Icon(Icons.arrow_forward_ios_outlined),
              color: Sabitler.anaRenk,
              iconSize: 30,), 
            ],
          )
        ],
      ),
    );
  }
  
  TextFormField _buildTextForm() {
    return TextFormField(
      onSaved: (deger){
        setState(() {
          girilenDersAdi=deger!;
        });
      },
      validator: (s){
        if(s!.length<=0){
          return "Ders Adını Giriniz";
        }
        else{
          return null;
        }
      },
      decoration: InputDecoration(
        hintText:  "Ders Adı",
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none //Bu sayede kenardaki karartılardan kurtulduk
        ),        
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3)
      ),
    );
  }
  
  
  
  
  void _dersEkleveOrtalamHesapla() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var eklenecekDers=Ders(ad: girilenDersAdi, harfDegeri: secilenHarfDegeri, krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      //print(DataHelper.tumDersler);
      setState(() {
        
      });
    }
  }
}