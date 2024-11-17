import 'package:flutter/material.dart';

class BaseAlertDialog extends StatelessWidget {

  //When creating please recheck 'context' if there is an error!

  Color _color = Colors.white;

  String _title="";
  String _content="";
  String _yes="";
  String _no="";


  BaseAlertDialog({String? title, String? content , String yes = "Yes", String no = "No"}){
    this._title = title.toString();
    this._content = content.toString();

    this._yes = yes;
    this._no = no;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(this._title),
      content: new Text(this._content),
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