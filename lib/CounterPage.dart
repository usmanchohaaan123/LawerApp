import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/tabs/ScheduleTab.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'APIServices.dart';
import 'APIs/APiCounter.dart';
import 'OtherStyle.dart';

class CounterPage extends StatefulWidget {


  final int c1;
  final int c2;

  const CounterPage({super.key,required this.c1,required this.c2});
 // const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  int currentc = 0;
  int  yourc= 0;
  int  diff= 0;
  OtherStyle otherStyle= new OtherStyle();



  void reload_Data() async {


print("reload_Data");
    APiCounter? api = await APIService().gatcounter(widget.c1.toString(), context);
     if(api!=null)
       {
     this.setState(() {
       currentc= api!.csr!;
       yourc= api!.ysr!;
       diff= api!.ysr! -api!.csr!;
     });


       }
  }
  @override
  void initState() {
    super.initState();
    reload_Data();
  }
  @override
  Widget build(BuildContext context) {
    reload_Data();
    return Scaffold(
      appBar: AppBar(



        backgroundColor: otherStyle.headerclr ,
        title: Column(
            children: <Widget>[
              Text(
                  'Counter',style: TextStyle(color: otherStyle.headertxtclr)),



            ]
        ),
        leading:   IconButton(
          icon:   Icon(Icons.arrow_back,color: otherStyle.headerbtnclr,),
          onPressed: ()async{
            _sendDataBack(context);
          },
        ),
      ),
      body: Padding(
        padding:
        const EdgeInsets.only(top: 30.0, left: 20, right: 20, bottom: 30),
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  Column(children: [
                    const Text(
                      'Current Appiontment',
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      currentc.toString(),
                      style: const TextStyle(
                          fontSize: 100, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                      Text(
                      'Your Turn-' + yourc.toString() ,
                      style:
                      TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Left-' +( diff).toString() ,
                      style:
                      TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                    ),
                  ]),
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleTab( )));

                },
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                child: const Text(
                  'Back',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ))
          ],
        ),
      ),
    );
  }

  void _sendDataBack(BuildContext context) {

    Navigator.of(context).pop(true);
  }
}