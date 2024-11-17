import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPVerifyDialog extends StatelessWidget {

  //When creating please recheck 'context' if there is an error!

  Color _color = Colors.white;

  String mobile_no="";
  String _content="";
  String _apiaccess="";
  String _yes="";
  String _no="";


  OTPVerifyDialog({String? mobile_no, String? content ,String? apiacces  }){
    this.mobile_no = mobile_no.toString();
    this._apiaccess = apiacces.toString();
    this._content = content.toString();
    this._apiaccess = _apiaccess.toString();


  }
  OutlineInputBorder borderr(){
return  OutlineInputBorder( //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color:Colors.black,
        width: 1,
      )
  );
}
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text('OTP Verification'),
      content:

      Column(

      children:[

Container(
  padding: const EdgeInsets.only(bottom: 10),
  child:  Text(_content),
),


      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 68,
            width: 50,
            child:  new TextField(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder:borderr(),
                focusedBorder:borderr(),

              ),
              onChanged: (value){

                if(value.length>0) {
                  FocusScope.of(context).nextFocus();
                }
              },
            ),
          ),  SizedBox(
            height: 68,
            width: 50,
            child:  new TextField(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder:borderr(),
                focusedBorder:borderr(),

              ),
            ),
          ),   SizedBox(
            height: 68,
            width: 50,
            child:  new TextField(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder:borderr(),
                focusedBorder:borderr(),

              ),
            ),
          ),   SizedBox(
            height: 68,
            width: 50,
            child:  new TextField(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                enabledBorder:borderr(),
                focusedBorder:borderr(),

              ),
            ),
          ),
        ],
      )   ,
      ],
      ),
      backgroundColor: this._color,
      shape:
      RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text(this._yes),

          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pop();
          },
        ),
        new ElevatedButton(
          child: Text(this._no),

          onPressed: () {

          },
        ),
      ],
    );
  }
}