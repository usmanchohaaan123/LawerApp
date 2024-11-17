import 'dart:convert';

import 'package:flutter/material.dart';


class ElderlyAlertDialog extends StatefulWidget {

  //When creating please recheck 'context' if there is an error!

  Color _color = Colors.white;



  final String titlee;
  final  Map<String, dynamic> titlee2;


  ElderlyAlertDialog({super.key, required this.titlee, required this.titlee2 });

  @override
  State<ElderlyAlertDialog> createState() => _ElderlyAlertDialogState();

}
class _ElderlyAlertDialogState extends State<ElderlyAlertDialog> {

GlobalKey<FormState> formKey  = new GlobalKey<FormState>();
@override
void initState() {
  // TODO: implement initState


//
//   Customer  cs = new Customer();
//   cs.name = '';
//   cs.mobileNo = '';
//   cs.cnic = '';
// cs.isAdult=false;
//   Customer  cs1 = new Customer();
//   cs1.name = '';
//   cs1.mobileNo = '';
//   cs1.cnic = '';
//   cs1.isAdult=true;
//
//   ListSeats seats =  new ListSeats();
//   seats.seatCode = '10' ;
//   seats.customer =cs;
//    ListSeats seats1 =  new ListSeats();
//   seats1.seatCode = '100' ;
//
//   seats1.customer =cs1;


  super.initState();

}



  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      content: SingleChildScrollView(
        child:  show_heading(),
            //Your Widgets,
            //Your Widgets

      ),
      backgroundColor: Colors.white,
      shape:
      RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text('Proceed'),

          onPressed: () {

            // Navigator.of(context, rootNavigator: true)
            //     .pop();
          },
        ),

      ],
    );
  }

    Widget show_heading(){

    return

      Form(
        key: formKey,
        child:

        Column(
          children: [
      Row(
      children: [
      Expanded(   child: Image.asset('assets/instruction_1.jpg' ,),   )
      ],
      ),


          ],
        ),

    );
  }


  Widget _showBody(BuildContext context) {
    return   Container(

        padding: const EdgeInsets.all(16.0),
        child:   Form(
          key: formKey,
          child:   ListView(
            shrinkWrap: true,
            children: <Widget>[

              show_heading(),
              innerarea(),

            ],
          ),
        ));
  }

  Widget innerarea(){

    var list = Iterable<int>.generate(1).toList();
    return   Container(
        height: 320,
        padding: const   EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child:   Form(
          child:
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) =>

                _tripcarda('81S','Adult','650 Rs','D',context),



          ),
        ));


  }
  Widget _tripcarda(   namee , arr_time  ,dep_time, wa_time  , context) {
    return Container(
      padding:   const EdgeInsets.fromLTRB(0.0,0.0, 0.0, 20.0),
      child: Card (

        child: Column(

          children: <Widget>[


            Row(
              children: [
                Expanded(

                  child: Container(

                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(

                  child: Container(

                  ),
                ),
              ],
            )


          ],
        ),
      ),
    );
  }


}