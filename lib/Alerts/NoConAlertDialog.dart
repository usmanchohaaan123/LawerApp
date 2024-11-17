import 'package:flutter/material.dart';

class NoConAlertDialog extends StatelessWidget {

  //When creating please recheck 'context' if there is an error!

  Color _color = Colors.white;


  String _content="";
  String _yes="";


  NoConAlertDialog({  String? content  }){

    this._content = "Warning! your phone is not connected to any internet or internet response is bad.";

    this._yes = "Yes";

  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      content:
      Wrap(
          children: [

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/exclamation.png'),

        ],  ),
        Text(this._content),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
              ElevatedButton(
              child: new Text("OK"),

              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pop();
              },
            ),
    ],
            ),
      ],
      ),



      backgroundColor: this._color,
      shape:
      RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),

    );
  }
}