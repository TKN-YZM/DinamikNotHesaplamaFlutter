import 'package:flutter/material.dart';

import '../Helper/dataHelper.dart';
import '../constans/app_constants.dart';

class HarfDropDowmWidget extends StatefulWidget {
  final Function onHarfSecildi;
  HarfDropDowmWidget({required this.onHarfSecildi,Key? key}) : super(key: key);

  @override
  State<HarfDropDowmWidget> createState() => _HarfDropDowmWidgetState();
}

class _HarfDropDowmWidgetState extends State<HarfDropDowmWidget> {
  @override
  double secilenHarfDegeri=4;
  Widget build(BuildContext context) {
     return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius
      ),
      child: DropdownButton<double>(
        alignment: Alignment.center,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade100,
        value: secilenHarfDegeri,
        onChanged: (deger){
          setState(() {
            secilenHarfDegeri=deger!;
            widget.onHarfSecildi(deger);
            //print(deger);
          });
        },
        items: DataHelper.tumDersNotHarfleri(),
        underline: Container(),
      ),
    );
  }
}