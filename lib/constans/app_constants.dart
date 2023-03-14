import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class Sabitler{

  static const anaRenk=Colors.indigo;
  static  const String baslik = "Not Hesaplama";
  static final TextStyle baslikFont=GoogleFonts.quicksand(
    fontSize: 24,fontWeight: FontWeight.w900,color: anaRenk
  );
  static BorderRadius borderRadius=BorderRadius.circular(16);
  static final TextStyle dersSayisiStyle=GoogleFonts.quicksand(
    fontSize: 16,fontWeight: FontWeight.w600,color: anaRenk
  );
  static final TextStyle ortalamaTextStyle=GoogleFonts.quicksand(
    fontSize: 55,fontWeight: FontWeight.w700,color: anaRenk
  );
  
  static final dropDownPadding=EdgeInsets.symmetric(vertical: 8,horizontal: 16);
}