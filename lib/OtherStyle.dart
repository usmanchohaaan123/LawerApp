import 'dart:ui';

import 'package:flutter/material.dart';

class OtherStyle {

  Color _headerclr =  Color(0xfffffffff);
  Color _headertxtclr =  Colors.black;
  Color _headerbtnclr =  Colors.black;
  bool centerTitle =true;
  Color _linkclr =  Colors.black;
  Color _btnbgclr =    Color(0xffffc42c);

  Color get btnbgclr => _btnbgclr;

  set btnbgclr(Color value) {
    _btnbgclr = value;
  }



  Color get linkclr => _linkclr;
  bool get cTitle => centerTitle;

  set linkclr(Color value) {
    _linkclr = value;
  }

  Color get headerbtnclr => _headerbtnclr;

  set headerbtnclr(Color value) {
    _headerbtnclr = value;
  }

  Color get headertxtclr => _headertxtclr;

  set headertxtclr(Color value) {
    _headertxtclr = value;
  }

  Color _bgcolor = Color(0xfff8f8f8);

  Color get headerclr => _headerclr;

  set headerclr(Color value) {
    _headerclr = value;
  }
  TextStyle btnstyle(){

    return TextStyle(fontSize: 20,fontWeight: FontWeight.bold);

  }
  Text getapptext(vals){
    return Text(vals,  style: TextStyle(fontWeight: FontWeight.bold),);

  }
  Widget open_st(){
    return  ChoiceChip(
      label: Text("Open",style: TextStyle(color: Colors.white),),
      labelStyle: TextStyle(color: Colors.white),
      selectedColor: Colors.red,
      backgroundColor: Colors.red,

      selected: true,
    );

  }

  Widget bill_st(titlee, Colr){
    return  ChoiceChip(
      label: Text(titlee.toString(),style: TextStyle(color: Colors.white),),
      labelStyle: TextStyle(color: Colors.white),
      selectedColor:Colr,
      backgroundColor: Colr,

      selected: true,
    );

  }
  Widget nodata(){
    return Container(
      child:
      Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                          'assets/empty-box.png',width:200,height:200
                      ),
                      Text('No Record Found')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

  }
  Widget close_st(){
    return  ChoiceChip(
      label: Text("Close"),
      labelStyle: TextStyle(color: Colors.white),
      selectedColor: Colors.green,
      backgroundColor: Colors.green,
      selected: true,
    );

  }
  Widget appBar(){

    return Container(
      decoration: BoxDecoration(
          color: Colors.green

      ),
    );
  }
  Color _btnclr =  Color(0xff168358);
  //Color(0xffffa900);
  Color _btnfclr =  Colors.white;
  Color _appbarc =   Color(0xff168358);

  Color get appbarc => _appbarc;

  set appbarc(Color value) {
    _appbarc = value;
  }

  Color get btnfclr => _btnfclr;

  set btnfclr(Color value) {
    _btnfclr = value;
  }

  Color _txtfclr =    Color(0xfff6f6f6);
  Color _lnk2clr =    Color(0xff3592E1);
  Color _lsttxtclr =    Color(0xffffffff);

  Color get lsttxtclr => _lsttxtclr;

  set lsttxtclr(Color value) {
    _lsttxtclr = value;
  }

  Color get lnk2clr => _lnk2clr;

  set lnk2clr(Color value) {
    _lnk2clr = value;
  }

  Color get txtfclr => _txtfclr;

  set txtfclr(Color value) {
    _txtfclr = value;
  }

  Color get bgcolor => _bgcolor;

  set bgcolor(Color value) {
    _bgcolor = value;
  }

  Color get btnclr => _btnclr;

  set btnclr(Color value) {
    _btnclr = value;
  }
}