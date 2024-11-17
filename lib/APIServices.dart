
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_app/APIs/LoginApi.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';
import 'package:http/http.dart' as http;


import 'APIs/APISlipType.dart';
import 'APIs/APiCounter.dart';
import 'APIs/DoctorApi.dart';
import 'APIs/ScheulelApi.dart';
import 'APIs/SignUpR.dart';
import 'Alerts/NoConAlertDialog.dart';
import 'Alerts/NoServerAccess.dart';

import 'Textstylee.dart';


class APIService {

  var client =http.Client();
  HttpClient httpClient = new HttpClient();

static String url = 'https://jsonplaceholder.typicode.com';
  //static String base_url = 'http://162.250.125.195:84/api';
 static String base_url = 'http://209.159.154.39:854/api';
static String base_urltst = 'http://209.159.154.39:854/api/';
  static Map<String,String> requestHeader = {'Content-Type' : 'application/json' };
  Textstylee stl  = new Textstylee();
APIService(){
  httpClient.badCertificateCallback= (X509Certificate cert,String host,int port)=>true;
}

  show_dialog_nointernet( context){

    print('sa');
    OverlayLoadingProgress.stop();
    var baseDialog = NoConAlertDialog(


    );
    showDialog(context: context, builder: (BuildContext context) => baseDialog) ;
  }
  show_dialog_noserverunaccessable( context){
    print('Open');
    OverlayLoadingProgress.stop();
    var baseDialog = NoServerAlertDialog(


    );

    showDialog(context: context, builder: (BuildContext context) => baseDialog) ;
  }

  start_loading(context){

    OverlayLoadingProgress.start(context,widget:
    Center(
        child:

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Image.asset('assets/lod_anim.gif' ,width: 250, height: 250,),

              ],
            ),


          ],

        )

    ),);

  }
  stop_loading(context){

  OverlayLoadingProgress.stop();
  }

  Future<LoginApi?> Login( mobile_no, password,context) async {
    APIService().start_loading(context);
    final uri = Uri.parse(base_url+'/Login');
try{
    print(uri);
    bool isOnline = await stl.hasNetwork();
    print(isOnline);
    if( isOnline) {
      final headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body = {

        'loginName': mobile_no,


        'password': password,

      };


      String jsonBody = json.encode(body);
      print(jsonBody);

      final encoding = Encoding.getByName('utf-8');

      http.Response response = await http.post(
        uri,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
       stop_loading(context);
        // If the server did return a 200 OK response,
        // then parse the JSON.

        print(response.statusCode);
        return LoginApi.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.

        show_dialog_noserverunaccessable(context);
      }
    }else{
      show_dialog_nointernet(context);

    }

  }catch(Exception)
  {
  show_dialog_nointernet(context);
  }
  }
  Future<SignUpR?> PostAppoint(appoint,context) async {
    APIService().start_loading(context);
    final uri = Uri.parse(base_url+'/Appoint');

    try{
      print(uri);
      bool isOnline = await stl.hasNetwork();
      print(isOnline);
      if( isOnline) {
        final headers = {'Content-Type': 'application/json'};

        String jsonBody = json.encode(appoint);
        print(jsonBody);

        final encoding = Encoding.getByName('utf-8');

        http.Response response = await http.post(
          uri,
          headers: headers,
          body: jsonBody,
          encoding: encoding,
        );

        if (response.statusCode == 200) {
          stop_loading(context);
          // If the server did return a 200 OK response,
          // then parse the JSON.
          String vall   =  response.body.toString();



          print(response.body);
          return SignUpR.fromJson(jsonDecode(response.body));

        } else {

          // If the server did not return a 200 OK response,
          // then throw an exception.

          show_dialog_noserverunaccessable(context);
        }
      }else{
        show_dialog_nointernet(context);

      }

    }catch(Exception)
    {
      show_dialog_nointernet(context);
    }


  }

  Future<SignUpR?> Signup(full_name,email_id, mobile_no , cnic  ,password,context) async {
    APIService().start_loading(context);
    final uri = Uri.parse(base_url+'/CreateAccount');
  //  mobile_no = mobile_no.toString().substring(2,mobile_no.toString().length);
    try{
      print(uri);
      bool isOnline = await stl.hasNetwork();
      print(isOnline);
      //    if( isOnline)
      //{
      final headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body    = {
        'name': full_name,
        'member_email': email_id,
        'mobileNo': mobile_no,
        'loginName': mobile_no,
        'cnic': cnic,
        'password': password,
        'isActive':1
      };

      print(body);
      String jsonBody = json.encode(body);

      // final clientt = Dio();
      HttpClientRequest request = await httpClient.postUrl(uri);
      request.headers.set('Content-Type', 'application/json');
      request.add(utf8.encode(jsonBody));
      HttpClientResponse response =  await request.close();
      final encoding = Encoding.getByName('utf-8');

      // http.Response response = await http.post(
      //   uri,
      //   headers: headers,
      //   body: jsonBody,
      //   encoding: encoding,
      // );
      print('statusCode');
      print(response.statusCode);
      String reply = await response.transform(utf8.decoder).join();
      print(reply);
      // print('Body');
      // print(response.body);
      if (response.statusCode == 200) {
        stop_loading(context);
        // If the server did return a 200 OK response,
        // then parse the JSON.
        print(response.statusCode);

        return SignUpR.fromJson(jsonDecode(reply));
      } else {

        // If the server did not return a 200 OK response,
        // then throw an exception.

        show_dialog_noserverunaccessable(context);
      }
      //   }else{
      //     show_dialog_nointernet(context);
      //
      //   }

    }catch(Exception)
    {
      show_dialog_nointernet(context);
    }



  }


  Future<SignUpR?> BookAppontment(full_name,email_id, mobile_no , cnic  ,password,context) async {
    APIService().start_loading(context);
    final uri = Uri.parse(base_url+'/CreateAccount');
    //  mobile_no = mobile_no.toString().substring(2,mobile_no.toString().length);
    try{
      print(uri);
      bool isOnline = await stl.hasNetwork();
      print(isOnline);
      //    if( isOnline)
      //{
      final headers = {'Content-Type': 'application/json'};
      Map<String, dynamic> body    = {
        'name': full_name,
        'member_email': email_id,
        'mobileNo': mobile_no,
        'loginName': mobile_no,
        'cnic': cnic,
        'password': password,
        'isActive':1
      };

      print(body);
      String jsonBody = json.encode(body);

      // final clientt = Dio();
      HttpClientRequest request = await httpClient.postUrl(uri);
      request.headers.set('Content-Type', 'application/json');
      request.add(utf8.encode(jsonBody));
      HttpClientResponse response =  await request.close();
      final encoding = Encoding.getByName('utf-8');

      // http.Response response = await http.post(
      //   uri,
      //   headers: headers,
      //   body: jsonBody,
      //   encoding: encoding,
      // );
      print('statusCode');
      print(response.statusCode);
      String reply = await response.transform(utf8.decoder).join();
      print(reply);
      // print('Body');
      // print(response.body);
      if (response.statusCode == 200) {
        stop_loading(context);
        // If the server did return a 200 OK response,
        // then parse the JSON.
        print(response.statusCode);

        return SignUpR.fromJson(jsonDecode(reply));
      } else {

        // If the server did not return a 200 OK response,
        // then throw an exception.

        show_dialog_noserverunaccessable(context);
      }
      //   }else{
      //     show_dialog_nointernet(context);
      //
      //   }

    }catch(Exception)
    {
      show_dialog_nointernet(context);
    }



  }
  // Future<ScheulelApi?> get_pat_schedule( fk_cust,context ) async {
  //   APIService().start_loading(context);
  //   final uri = Uri.parse(base_url+'/misc/get_pat_schedule/' +fk_cust.toString();
  //
  //   try{
  //     print(uri);
  //     bool isOnline = await stl.hasNetwork();
  //     print(isOnline);
  //     if( isOnline) {
  //
  //       final headers = {'Content-Type': 'application/json'};
  //
  //       final encoding = Encoding.getByName('utf-8');
  //
  //       http.Response response = await http.get(
  //         uri,
  //         headers: headers,
  //       );
  //       print(response.statusCode);
  //       if (response.statusCode == 200) {
  //         stop_loading(context);
  //         // If the server did return a 200 OK response,
  //         // then parse the JSON.
  //         print(response.statusCode);
  //         return ScheulelApi.fromJson(jsonDecode(response.body));
  //       } else {
  //
  //         // If the server did not return a 200 OK response,
  //         // then throw an exception.
  //         show_dialog_noserverunaccessable(context);
  //       }
  //     }else{
  //       show_dialog_nointernet(context);
  //
  //     }
  //
  //   }catch(Exception)
  //   {
  //     show_dialog_nointernet(context);
  //   }
  //
  //
  //
  // }

  Future<List<ScheulelApi>?> get_pat_schedule(  fk_cust, context ) async {
    APIService().start_loading(context);
    final uri = Uri.parse(base_url+'/misc/get_pat_schedule/' +fk_cust.toString());

        try{
      print(uri);
      bool isOnline = await stl.hasNetwork();
      print(isOnline);
      if( isOnline) {

        final headers = {'Content-Type': 'application/json'};




        http.Response response = await http.get(
          uri,
          headers: headers,

        );
        if (response.statusCode == 200) {
          stop_loading(context);
          // If the server did return a 200 OK response,
          // then parse the JSON.
          print(response.body);
          List jsonResponse = json.decode(response.body);
          return jsonResponse.map((job) => new ScheulelApi.fromJson(job)).toList();
          //return ConnListApi.fromJson(jsonDecode(response.body));
        } else {

          // If the server did not return a 200 OK response,
          // then throw an exception.

          show_dialog_noserverunaccessable(context);
        }
      }else{
        show_dialog_nointernet(context);

      }

    }catch(Exception)
    {
      print(Exception);
      show_dialog_nointernet(context);
    }


  }
  Future<List<APISlipType>?> SlipTypes(   context ) async {
    APIService().start_loading(context);
    final uri = Uri.parse(base_url+'/SlipTypes');

    try{
      print(uri);
      bool isOnline = await stl.hasNetwork();
      print(isOnline);
      if( isOnline) {

        final headers = {'Content-Type': 'application/json'};




        http.Response response = await http.get(
          uri,
          headers: headers,

        );
        if (response.statusCode == 200) {
          stop_loading(context);
          // If the server did return a 200 OK response,
          // then parse the JSON.
          print(response.body);
          List jsonResponse = json.decode(response.body);
          return jsonResponse.map((job) => new APISlipType.fromJson(job)).toList();
          //return ConnListApi.fromJson(jsonDecode(response.body));
        } else {

          // If the server did not return a 200 OK response,
          // then throw an exception.

          show_dialog_noserverunaccessable(context);
        }
      }else{
        show_dialog_nointernet(context);

      }

    }catch(Exception)
    {
      print(Exception);
      show_dialog_nointernet(context);
    }


  }
  Future<APiCounter?> gatcounter(  fk_cust, context ) async {
    APIService().start_loading(context);
    final uri = Uri.parse(base_url+'/misc/get_scalee/' +fk_cust.toString());

    try{
      print(uri);
      bool isOnline = await stl.hasNetwork();
      print(isOnline);
      if( isOnline) {

        final headers = {'Content-Type': 'application/json'};




        http.Response response = await http.get(
          uri,
          headers: headers,

        );
        if (response.statusCode == 200) {
          stop_loading(context);
          // If the server did return a 200 OK response,
          // then parse the JSON.
          print(response.body);
          return APiCounter.fromJson(json.decode(response.body));
            //  return jsonResponse.map((job) => new ScheulelApi.fromJson(job)).toList();
          //return ConnListApi.fromJson(jsonDecode(response.body));
        } else {

          // If the server did not return a 200 OK response,
          // then throw an exception.

          show_dialog_noserverunaccessable(context);
        }
      }else{
        show_dialog_nointernet(context);

      }

    }catch(Exception)
    {
      show_dialog_nointernet(context);
    }


  }
  Future<DoctorApi?> updateStatus(  fk_cust,status, context ) async {
    APIService().start_loading(context);
    final uri = Uri.parse(base_url+'/misc/updateStatus/' +fk_cust.toString() +'/'+status.toString());

    try{
      print(uri);
      bool isOnline = await stl.hasNetwork();
      print(isOnline);
      if( isOnline) {

        final headers = {'Content-Type': 'application/json'};




        http.Response response = await http.get(
          uri,
          headers: headers,

        );
        if (response.statusCode == 200) {
          stop_loading(context);
          // If the server did return a 200 OK response,
          // then parse the JSON.
          print(response.body);
          return DoctorApi.fromJson(json.decode(response.body));
          //  return jsonResponse.map((job) => new ScheulelApi.fromJson(job)).toList();
          //return ConnListApi.fromJson(jsonDecode(response.body));
        } else {

          // If the server did not return a 200 OK response,
          // then throw an exception.

          show_dialog_noserverunaccessable(context);
        }
      }else{
        show_dialog_nointernet(context);

      }

    }catch(Exception)
    {
      show_dialog_nointernet(context);
    }


  }

  Future<List<DoctorApi>?> getDoctorst(  fk_cust, context ) async {
    APIService().start_loading(context);
    final uri = Uri.parse(base_url+'/misc/getDoctorst/' +fk_cust.toString());

    try{
      print(uri);
      bool isOnline = await stl.hasNetwork();
      print(isOnline);
      if( isOnline) {

        final headers = {'Content-Type': 'application/json'};




        http.Response response = await http.get(
          uri,
          headers: headers,

        );
        if (response.statusCode == 200) {
          stop_loading(context);
          // If the server did return a 200 OK response,
          // then parse the JSON.
          print(response.body);
          List jsonResponse = json.decode(response.body);
          return jsonResponse.map((job) => new DoctorApi.fromJson(job)).toList();
          //return ConnListApi.fromJson(jsonDecode(response.body));
        } else {

          // If the server did not return a 200 OK response,
          // then throw an exception.

          show_dialog_noserverunaccessable(context);
        }
      }else{
        show_dialog_nointernet(context);

      }

    }catch(Exception)
    {
      show_dialog_nointernet(context);
    }


  }

//
//
//
  }

