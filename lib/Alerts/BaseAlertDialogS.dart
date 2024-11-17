
import 'package:flutter/material.dart';

class BaseAlertDialogS extends StatelessWidget {

  //When creating please recheck 'context' if there is an error!

  Color _color = Colors.white;


  String _content="";
  String _yes="";
  String _type="";


  BaseAlertDialogS({  String? content , String yes = "Yes",String? type }){

    this._content = content.toString();

    this._type = type.toString();
    this._yes = yes;

  }
AssetImage rtnImg(String valuee){
    print(valuee  +"ASD");
     if(valuee=="Ex")
       {

      return   AssetImage('assets/m_warn.png', );
       }else
         if(valuee=="Su")
     {
       return  AssetImage('assets/m_succ.png', );

     }else{

           return AssetImage('assets/m_ex.png' );
     }

}

rtn_img (codee)
{
  if(codee=='Ex')
    {

    }
else  if(codee==1)
  {

  }
}
Color rtn_clr (valuee)
{

  if(valuee=="Ex")
  {

    return   Color(0xFFFE0000);
  }else
  if(valuee=="Su")
  {
    return  Color(0xFF4DCE36);

  }else{

    return Color(0xFF007CC4);
  }


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

    image: rtnImg(_type.toString())  ,
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
                backgroundColor: rtn_clr(_type),
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