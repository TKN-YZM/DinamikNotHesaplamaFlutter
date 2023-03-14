
import 'package:flutter/material.dart';

import '../Helper/dataHelper.dart';
import '../constans/app_constants.dart';

class KrediDownWidget extends StatefulWidget {
  final Function onKrediDegeri;
  KrediDownWidget({required this.onKrediDegeri,Key? key}) : super(key: key);
  @override
  State<KrediDownWidget> createState() => _KrediDownWidgetState();
}

class _KrediDownWidgetState extends State<KrediDownWidget> {
  @override
  double secilenKrediDegeri=1;
  Widget build(BuildContext context) {
    return Container(
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade100,
        value: secilenKrediDegeri,
        onChanged: (deger){
          setState(() {
            secilenKrediDegeri=deger!;
            widget.onKrediDegeri(deger);
          });
        },
        items: DataHelper.tumDerslerinKredileri(),
        underline: Container(),
      ),
    );
  }
}