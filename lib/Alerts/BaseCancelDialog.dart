import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BaseAlertDialogS.dart';


class BaseCancelDialog extends StatefulWidget {

  //When creating please recheck 'context' if there is an error!

  final Color _color = Colors.white;




  BaseCancelDialog({super.key,   });

  @override
  State<BaseCancelDialog> createState() => _BaseCancelDialogState();

}
class _BaseCancelDialogState extends State<BaseCancelDialog> {

  String api_key= '';
  String sides= 'A';
  String e_voucher= '';

  GlobalKey<FormState> formKey  = new GlobalKey<FormState>();

  void loginStatus() async  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    //  prefs.setString('member_name', member_name);
    // await prefs.setString('email_address', email_address);

    // Iterable l = json.decode(widget.title2);
    // List<ListSeats> posts = List<ListSeats>.from(l.map((model)=> ListSeats.fromJson(model)));
    //
    // List<PassengerDetails> pdetail =[];
    //
    //
    // for(var dataa in posts)
    // {
    //   if(posts.length>1)
    //     dataa.isSelected=false;
    //   PassengerDetails passengerDetails = new PassengerDetails();
    //   passengerDetails.baseFare = int.parse( dataa.baseFare.toString());
    //   passengerDetails.cnic =  int.parse(dataa.customer!.cnic.toString());
    //   passengerDetails.baseFare =  dataa.baseFare;
    //   passengerDetails.isValid =  false;
    //   passengerDetails.name =  dataa.customer!.name;
    //   passengerDetails.seatFrom =  dataa.seatFrom;
    //   passengerDetails.seatTo =  dataa.seatTo;
    //   passengerDetails.seatType =  dataa.seatType;
    //   passengerDetails.pType =  'Adult';
    //
    //   pdetail.add(passengerDetails);
    // }

    setState(() {
      // listseat  = posts;
      // mvoucherAPI!.apiAccessKey =  prefs.getString('api_access_key').toString();
      // mvoucherAPI!.departureDate =  widget.title['departure_date'];
      // mvoucherAPI!.classCode =  widget.title['class_code'];
      // mvoucherAPI!.fromCode =  widget.title['from_code'];
      // mvoucherAPI!.toCode =  widget.title['to_code'];
      // mvoucherAPI!.trainCode =  widget.title['train_code'];
      // listpdetail  = pdetail;

    });



  }

  @override
  void initState() {



    // TODO: implement initState

    super.initState();
    loginStatus();




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
          child: new Text('Close'),

          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pop(context);


          },
        ),

      ],
    );
  }
  show_dialog(String valuee){

    var baseDialog = BaseAlertDialogS(

      content: valuee ,

      yes: "Ok",
    );
    showDialog(context: context, builder: (BuildContext context) => baseDialog);

  }
  Widget show_heading() {
    if (sides == 'A') {
      return

        Form(
          key: formKey,
          child:

          Column(
            children: [


              ShowSingleRow()
            ],
          ),

        );
    }else{
      return    Column(
        children: [


            ],
      );
    }
  }

  Widget ShowSingleRow( ){

    return Container(
      color:  Colors.white38,
      padding: EdgeInsets.only(top: 10),
      child:


      Column(
        children: <Widget>[

          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 10),
                child:    Text('Choose Cancellation Option',   ),   ),
            ],
          ),
          Row(
            children: [
              Expanded(

                child: Container(
                  child:      new ElevatedButton(
                    child: new Text('Nomral Cancellation of Ticket'),

                    onPressed: () {
                      String value = "Normal";
                      Navigator.of(context, rootNavigator: true)
                          .pop(value);


                    },
                  ),
                ),
              ),
            ],
          ),


          Row(
            children: [
              Expanded(

                child: Container(
                  child:      new ElevatedButton(
                    child: new Text('Cancel due to train cancellation'),

                    onPressed: () {
                      String value = "Train Cancel";
                      Navigator.of(context, rootNavigator: true)
                          .pop(value);


                    },
                  ),
                ),
              ),
            ],
          ),
   Row(
            children: [
              Expanded(

                child:myWidget(),
              ),
            ],
          ),

        ]
        ,
      ),
    );

  }
  BoxDecoration myBoxDecorationbg() {
    return BoxDecoration(
      color: Colors.grey,
      border:  Border(
        bottom: BorderSide(  color: Colors.black12,   width: 3.0,  ),
      ),
      //
    );
  }
  Widget myWidget() {
    return Container(
      margin: const EdgeInsets.all(10.0),

      decoration: myBoxDecorationbg(), //       <--- BoxDecoration here
      child: Text(
        "Choose button 'Cancel due to train cancellation' ",
        style: TextStyle(fontSize: 18.0),
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

                _tripcarda('81S','Adult','650 Rs'),



          ),
        ));


  }
  Widget _tripcarda(   namee , arr_time  ,dep_time , ) {
    return Container(
      padding:   const EdgeInsets.fromLTRB(0.0,0.0, 0.0, 20.0),
      child: Card (

        child: Column(

          children: <Widget>[


            Row(
              children: [
                Expanded(

                  child: Container(
                    child:  Text(namee),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(

                  child: Container(
                    child:  Text(arr_time),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(

                  child: Container(
                    child: Text(dep_time),
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