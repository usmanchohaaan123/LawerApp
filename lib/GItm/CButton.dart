import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../OtherStyle.dart';

class CButton extends StatefulWidget {
  final String  txt;
  final GestureTapCallback onPressed;

  CButton({required this.onPressed, required this.txt});

  @override
  _CButtonState createState() => _CButtonState();
}


class _CButtonState extends State<CButton> {

  late Color _color;
  OtherStyle otherStyle= new OtherStyle();
  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(otherStyle.btnclr),
         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),

    )),),
      onPressed: (){

        widget.onPressed();
      }, child:    Text(widget.txt, style: TextStyle(color: Colors.black),),
    );
  }
}