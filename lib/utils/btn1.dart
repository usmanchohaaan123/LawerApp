import 'package:flutter/material.dart';

import '../Textstylee.dart';
import '../OtherStyle.dart';
final OtherStyle ani= new OtherStyle();
final ButtonStyle btnprimary = ElevatedButton.styleFrom(
  minimumSize: Size(200, 50)
  ,elevation:0
  ,backgroundColor:ani.btnclr
  ,foregroundColor: ani.btnfclr


  ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
);