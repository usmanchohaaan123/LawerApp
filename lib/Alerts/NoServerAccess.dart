import 'package:flutter/material.dart';

class NoServerAlertDialog extends StatelessWidget {

  //When creating please recheck 'context' if there is an error!

  Color _color = Colors.white;


  String _content="";
  String _yes="";


  NoServerAlertDialog({  String? content  }){

    this._content = "Warning! Server not accessable please try again after some time .";

    this._yes = "Yes";

  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:  Colors.transparent,
      child:
      Padding(child:
      Container(
        height: 310,
        width: 400,

        decoration: BoxDecoration(

          image: DecorationImage(
            fit: BoxFit.cover,

            image: AssetImage('assets/m_warn.png' )  ,
            // image: NetworkImage('http://162.250.125.195/adv/'+(i+1).toString()+'.jpg'),),
          ),
        ),
        child : Column(
          children: [


            Expanded(child: Text(""), flex: 2,),
            Expanded(child:
            Container(
              width: 250,
              child:
              Text(
                _content,maxLines: 3,overflow: TextOverflow.fade,textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),flex: 2,),


            Expanded(
              flex: 1,
              child:
              ElevatedButton(
                child: new Text("OK"),
                style: ElevatedButton.styleFrom(
                  backgroundColor:       Color(0xFFFE0000),
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true)
                      .pop();
                },
              ),

            ),


          ],
        ),

      ) ,

        padding: EdgeInsets.all(3),
      ),

    );
  }
}