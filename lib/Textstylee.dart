import 'dart:io';

import 'package:flutter/material.dart';


class Textstylee extends StatefulWidget {
  Textstylee({super.key});



  @override
  State<Textstylee> createState() => _TextstyleeState();

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if(result!=null)
      {
        return true;
      }
      else{
        return false;
      }

    } on SocketException catch (_) {
      return false;
    }
  }


  Widget LoadingOverly(_isLoading){

    if(_isLoading) {
      return
        Opacity(
          opacity: 0.8,
          child: ModalBarrier(dismissible: false, color: Colors.white70),
        );
    }else{
      return Container(

      );

    }



  }
  Widget LoadingOverly1(_isLoading) {

    if(_isLoading) {
      return    Center(
          child:

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset('assets/lod_anim.gif' ,width: 140, height: 140,),

                ],
              ),


            ],

          )

      );
    }else{
      return Container(

      );

    }
  }


  InputDecoration inputStylee(valuee) {

    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: valuee,
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      enabledBorder:

      txtborder(),
      border: InputBorder.none,





    );


  }
  InputDecoration SourceStylee(valuee,icon) {

    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: valuee,
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      enabledBorder: txtborder(),

      border: InputBorder.none,


      prefixIcon:  GestureDetector(

        child: Icon(
          icon   ,

        ),
      ),


    );


  }
  InputDecoration PnameStylee(valuee,icon) {

    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: valuee,
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      enabledBorder: txtborder(),

      border: InputBorder.none,


      prefixIcon:  GestureDetector(

        child: Icon(
          icon   ,

        ),
      ),


    );


  }

  InputDecoration EmailStylee(valuee) {

    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: valuee,
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      enabledBorder: txtborder(),

      border: InputBorder.none,


      prefixIcon:  GestureDetector(

        child: Icon(
          Icons.email_outlined  ,

        ),
      ),


    );


  }

  InputDecoration LocationStylee(valuee) {

    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: valuee,
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      enabledBorder: txtborder(),

      border: InputBorder.none,


      prefixIcon:  GestureDetector(

        child: Icon(
          Icons.pin_drop_outlined  ,
          color: Colors.grey,

        ),
      ),


    );


  }

  InputDecoration FeedbackStylee(valuee) {

    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: valuee,
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      enabledBorder: txtborder(),

      border: InputBorder.none,




    );


  }

  OutlineInputBorder txtborder(){

    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),

        borderSide: BorderSide(
            color: Colors.grey.shade100,
            width: 3
        )
    );

  }
  OutlineInputBorder txtbordergreen(){

    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),

        borderSide: BorderSide(
            color: Colors.grey.shade100,
            width: 3
        )
    );

  }


  InputDecoration Phonestylee(valuee) {

    return InputDecoration(
      filled: true,
      fillColor: Colors.white,

      enabledBorder: txtborder(),
      hintText: valuee,
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: InputBorder.none,
      suffixIcon: GestureDetector(

        child: Icon(
          Icons.phone  ,
          color: Colors.grey,
        ),
      ),




    );


  }
//new style
  InputDecoration txts1logo(valuee,icons) {

    return  InputDecoration(
      filled: true,
      fillColor: Colors.white,

      enabledBorder: txtborder(),
      hintText: '+92 3XX YYYYYYY',

      border: InputBorder.none,

      suffixIcon: GestureDetector(
        onTap: () {



        },
        child: Icon(
          icons  ,
          color: Colors.grey,
        ),
      ),

    );


  }
  InputDecoration CnicStylee(valuee) {

    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: valuee,
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      enabledBorder: txtborder(),

      border: InputBorder.none,

      prefixIcon: GestureDetector(

        child: Icon(
          Icons.credit_card_outlined  ,

        ),
      ),




    );


  }


  InputBorder Iborder(){

    return  OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0)
    );

  }

  InputDecoration inputStylephone(valuee) {

    return InputDecoration(
      hintText: valuee,
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border:

      OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
      ),
      constraints: const BoxConstraints(maxHeight:45,maxWidth: 300,),
      filled: true, //<-- SEE HERE


    );


  }






}
class _TextstyleeState extends State<Textstylee> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[


          ],
        )
    );



  }

}