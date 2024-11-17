

import 'package:flutter/material.dart';

class RestrictDialog extends StatelessWidget {

  //When creating please recheck 'context' if there is an error!

  Color _color = Colors.white;

  String _title="";
  String _content="";
  String _yes="";
  String _no="";


  RestrictDialog({ String? content , String yes = "Sign In", String no = "Sign Up"}){

    this._content = content.toString();

    this._yes = "Sign in ";
    this._no = no;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      content: new Text(this._content),
      backgroundColor: this._color,
      shape:
      RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text(this._yes),

          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pop("SI");
          },
        ),
        new ElevatedButton(
          child: Text(this._no),

          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .pop("SU");
          },
        ),
      ],
    );
  }
}