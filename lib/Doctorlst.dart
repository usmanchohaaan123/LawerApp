
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_app/APIs/AppointAp.dart';
import 'package:hospital_app/APIs/DocApi.dart';
import 'package:hospital_app/APIs/SignUpR.dart';
import 'package:hospital_app/screens/home.dart';
import 'package:hospital_app/styles/colors.dart';
import 'package:hospital_app/utils/btn1.dart';
import 'package:masked_text/masked_text.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'APIServices.dart';
import 'APIs/LoginApi.dart';
import 'APIs/DoctorApi.dart';
import 'Dashboard.dart';

import 'package:http/http.dart' as http;
import 'Alerts/BaseAlertDialogS.dart';
import 'CreateAccount.dart';
import 'GItm/CButton.dart';
import 'Loading/loading_screen.dart';
import 'OtherStyle.dart';
import 'Textstylee.dart';
import 'main.dart';

class Doctorlst extends StatefulWidget {
  final String  meg;
  final String  details;


  Doctorlst({super.key,required this.meg,required this.details});

  //
  // final int   counter   ;
  //
  //
  //
  //
  //fkpat
  // Dashboard({super.key , required this.counter });

  @override
  State<Doctorlst> createState() => _DoctorlstState();

}

class _DoctorlstState extends State<Doctorlst> {

  OtherStyle otherStyle = new OtherStyle();
  MethodChannel platform = new MethodChannel('backgroundservice');

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String _email = '';
  final String _password = '';
  final String _errorMessage = '';
  bool checkBoxValue = false;
  bool _isLoading = false;
  bool _obscureText = true;
  final Textstylee ani = new Textstylee();
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  List<DoctorApi> schedules2 = [];


  void registerNotification() async {
    //  1. Initialize the Firebase app
    //   await Firebase.initializeApp();
    //
    //   // 2. Instantiate Firebase Messaging
    //   _messaging = FirebaseMessaging.instance;
    //   _messaging = FirebaseMessaging.instance;
    //
    //   // 3. On iOS, this helps to take the user permissions
    //   NotificationSettings settings = await _messaging.requestPermission(
    //     alert: true,
    //     badge: true,
    //     provisional: false,
    //     sound: true,
    //   );


// You can can also directly ask the permission about its status.

    // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    //   print('User granted permission');
    //   // TODO: handle the received notifications
    // } else {
    //   print('User declined or has not accepted permission');
    // }
  }

load_data() async {

  List<DoctorApi>? api = await APIService().getDoctorst(widget.meg, context);
 if(api!=null)
   {
     setState(() {
       schedules2 =  api!;

     });
     print(api.length);
   }


}
  @override
  void initState() {

//
// print(widget.meg);
// //DocApi a1= new DocApi(id: '1',)
// schedules1.add( DocApi(img:"assets/doctor01.jpeg",
//   doctorName: 'Dr. Hafiz Muhammad Arif',
//     doctorTitle: 'Child specialist ',
//     reservedDate: 'Monday, Aug 29',
//     reservedTime: '11:00 - 12:00',
//     id:  '1',
//   FkSliptype:  '1',
//   FkService:  '5',
//   amount:'2000'
// ) ,
//
//
//  );
//
//     schedules1.add(    DocApi(
//         img: 'assets/doctor01.jpeg',
//         doctorName: 'Dr. Ayat Arif',
//         doctorTitle:   'Orthopedic specialist ',
//         reservedDate:  'Monday, Aug 29',
//         reservedTime:  '11:00 - 12:00',
//         id:   '5',
//       FkSliptype:  '8',
//       FkService:  '4',
//         amount:'2000'
//     )
//     );
//     schedules1.add(     DocApi(
//         img:   'assets/doctor01.jpeg',
//         doctorName : 'Dr. Anastasya Syahid',
//         doctorTitle:   'Dental Specialist',
//         reservedDate:  'Monday, Aug 29',
//         reservedTime:  '11:00 - 12:00',
//         id:   '2',
//       FkSliptype:  '3',
//       FkService:  '2',
//         amount:'2000'
//     ));
//     schedules1.add( DocApi(
//         img: 'assets/doctor02.png',
//   doctorName: 'Dr. Mauldya Imran',
//   doctorTitle: 'Skin Specialist',
//   reservedDate: 'Monday, Sep 29',
//   reservedTime: '11:00 - 12:00',
//     id:  '3',
//       FkSliptype:  '4',
//       FkService:  '3',
//         amount:'2000'
//     ));
//     schedules1.add( DocApi(
//   img: 'assets/doctor03.jpeg',
//   doctorName: 'Dr. Rihanna Garland',
//   doctorTitle: 'General Specialist',
//   reservedDate: 'Monday, Jul 29',
//   reservedTime: '11:00 - 12:00',
//   id :'4',
//       FkSliptype:  '6',
//       FkService:  '3',
//         amount:'2000'
//     ));


    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   PushNotification notification = PushNotification(
    //   PushNotification notification = PushNotification(
    //     title: message.notification?.title,
    //     body: message.notification?.body,
    //   );
    //   setState(() {
    //     _notificationInfo = notification;
    //     _totalNotifications++;
    //   });
    // });

    // // if(PermissioMa)
    //  startService();

    super.initState();
    load_data();


    //_totalNotifications = 0;
    // permission_manager();
  }


    TextEditingController te_username = new TextEditingController(text: "",);
    TextEditingController te_password = new TextEditingController(text: "");
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(



            backgroundColor: otherStyle.headerclr ,
            title: Column(
                children: <Widget>[
                  Text(  'Doctor List',style: TextStyle(color: otherStyle.headertxtclr)),
                  Text( widget.details,style: TextStyle(color: otherStyle.headertxtclr)),



                ]
            ),
            leading:   IconButton(
              icon:   Icon(Icons.arrow_back,color: otherStyle.headerbtnclr,),
              onPressed: ()async{
                 _sendDataBack(context);
              },
            ),
          ),
          body: Stack(
            children: <Widget>[

              Row(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: schedules2.length,
                      itemBuilder: (context, index) {
                        var _schedule = schedules2[index];
                        bool isLastElement = schedules2.length + 1 == index;
                        return Card(
                          margin: !isLastElement
                              ? EdgeInsets.only(bottom: 20)
                              : EdgeInsets.zero,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    // CircleAvatar(
                                    //   backgroundImage: AssetImage(_schedule.img.toString()),
                                    // ),
                                    // SizedBox(
                                    //   width: 10,
                                    // ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _schedule.name.toString(),
                                          style: TextStyle(
                                            color: Color(MyColors.header01),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          _schedule.descrp.toString(),
                                          style: TextStyle(
                                            color: Color(MyColors.grey02),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                DateTimeCard(valsf:_schedule.descrp2.toString()),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(otherStyle.btnclr)
                                            ,foregroundColor:MaterialStateProperty.all<Color>(otherStyle.btnfclr)
                                        ),
                                        child: Text('Book Now'),
                                        onPressed: () => {Booknow(index)},
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),

            ],
          )
      );
    }
  show_dialog(String valuee){

    var baseDialog = BaseAlertDialogS(

      content: valuee ,
      type: "Ex",
      yes: "Ok",
    );
    showDialog(context: context, builder: (BuildContext context) => baseDialog);

  }
void Booknow(index) async {

  final SharedPreferences prefs = await _prefs;
 String  fkPatient= await prefs.getString('fkPatient').toString();

  DoctorApi aa = schedules2[index];
AppointAp ap=new AppointAp();
ap.id=0;
ap.srNo=0;
ap.date= "2024-01-01";
ap.datetime= "2024-01-01";
ap.amount=int.parse(  aa.amount.toString());
ap.fkService=1;
ap.fkSliptype= int.parse(  aa.fkSliptype.toString())  ;
ap.fkDoctor= int.parse( aa.id.toString());
ap.fkPat= int.parse( fkPatient);
  ap.satus=0;
  ap.serviceName = "Consultant Fee";

 await APIService().PostAppoint(ap, context)
      .then((value) =>
  {



        if(value!.id==-1)
        {
          show_dialog(value!.cnic.toString()),

        }else{

          shoeSuccess(value),

        }




});
}
void shoeSuccess(SignUpR value){
  String mess =
      "You have successfully Book Appointment !"
      "You Appointment #" +value.isActive.toString()
 + "You Bill #" +value.id.toString();
  show_dialogA(mess);
}
  void _sendDataBack(BuildContext context) {
    String textToSendBack = "dsaddasd";
    print(textToSendBack);
    Navigator.of(context).pop(true);
  }
    permission_manager() async {
      // //![](../../../../../var/folders/0t/7vj1cgfx7wz44wcmymr5156c0000gn/T/simulator_screenshot_F61DAF35-48EC-4008-9812-8CEB69AD8544.png)
      // PermissionStatus storage1 =await Permission.location.request();
      // if(storage1.isGranted){![](../../../../../var/folders/0t/7vj1cgfx7wz44wcmymr5156c0000gn/T/simulator_screenshot_AEBB85DC-4ED4-4328-8234-26F18EAB1EBA.png)
      // }else{
      //   openAppSettings();
      //
      // }
    }
    Widget _showForgetPass() {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    this.setState(() {
                      checkBoxValue = !checkBoxValue;
                    });
                  },
                  child:
                  Row(
                      children: <Widget>[
                        Checkbox(
                          checkColor: Colors.black,
                          activeColor: otherStyle.lnk2clr,
                          value: checkBoxValue, onChanged: (bool? value) {
                          this.setState(() {
                            checkBoxValue = value!;
                          });
                        },

                        ),
                        Text('Remember Me', style: TextStyle(fontSize: 17.0),),
                      ]),),
                TextButton(
                  onPressed: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()));
                  },
                  child: Text('Forgot Password ?',
                    style: TextStyle(color: otherStyle.linkclr,),),
                ),
              ],
            ),
          )
      );
    }

    Widget _showEmailInput() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        child: TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,

          validator: (value) {
            if (value != null && value.length < 2) {
              return 'Enter Min 10 Character';
            } else {
              return null;
            }
          },
          controller: te_username,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'Username',

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),


            ),
            prefixIcon: Icon(
              Icons.person,
            ),


          ),

        ),
      );
    }

    save_pref(String username, String password,
        String patName, String fkPatient) async {
      final SharedPreferences prefs = await _prefs;
      await prefs.setString('cnic', username);
      await prefs.setString('password', password);
      await prefs.setString('patName', patName);
      await prefs.setString('fkPatient', fkPatient);
    }
    show_dialogA(String valuee) {
      var baseDialog = BaseAlertDialogS(

        content: valuee,
        type: "Su",
        yes: "Ok",
      );
      showDialog(
          context: context, builder: (BuildContext context) => baseDialog);
    }

    Widget _showPhonenput() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child:
        MaskedTextField(
          mask: "03## #######",
          controller: te_username,
          decoration: ani.Phonestylee('03XX XXXXXXX'),
          validator: (value) {
            if (value!.length < 12) {
              return 'Please Enter Valid Mobile No.';
            }
            return null;
          },
        ),


      );
    }

    Widget _showCNICInput() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
        child:

        MaskedTextField(

          mask: "#####-#######-#",
          decoration: ani.CnicStylee('CNIC XXXXX-XXXXXXX-X'),
          controller: te_username,

          keyboardType: TextInputType.number,
          validator: (value) {
            if (value!.length < 14) {
              return 'Please Enter Valid CNIC No.';
            }
            return null;
          },
          textInputAction: TextInputAction.next, // Moves focus to next.
        ),

      );
    }
    Widget _showGuestlogin(BuildContext context) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
          child: SizedBox(
            height: 40.0,

            child: ElevatedButton(
              onPressed: () async {
                final SharedPreferences prefs = await _prefs;
              },
              child: const Text('Login as Guest'),

            ),
          ));
    }
    convertFutureListToList(Future<List> lsttt) async {
      Future<List> _futureOfList = lsttt;
      List list = await _futureOfList;
    }
    Widget _showdoesacc(BuildContext context) {
      return Row(
        children: <Widget>[
          Text('Does not have account?',
            style: TextStyle(fontSize: 16, color: Colors.black),),
          TextButton(
            child: Text(
              'Sign up',
              style: TextStyle(fontSize: 25, color: otherStyle.lnk2clr),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateAccount(meg:"")));
              //   Future<ResendSMSRes?>   dfle =  APIService().TicketPDF("asdsad");
              //   dfle.then((value) => {
              //
              //     print(value),
              //   });
            },

          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      );
    }


    Widget _weclome(BuildContext context) {
      return

        Padding(padding: EdgeInsets.only(top: 20)
          , child:
          Row(
            children: <Widget>[
                Text(widget.details , style: TextStyle(fontSize: 25),)

            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        );
    }
    Widget _weclome2(BuildContext context) {
      return Row(
        children: <Widget>[
          const Text('e-Doctor Apointment ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)

        ],
        mainAxisAlignment: MainAxisAlignment.center,
      );
    }

    Widget _showPasswordInput() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
        child: TextFormField(
          maxLines: 1,
          key: formKey,
          obscureText: _obscureText,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          controller: te_password,
          validator: (value) {
            if (value != null && value.length < 4) {
              return 'Enter Min 7 Character';
            } else {
              return null;
            }
          },
          textInputAction: TextInputAction.next,
          decoration:
          InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Password',
            border: InputBorder.none,
            enabledBorder: ani.txtborder(),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                semanticLabel:
                _obscureText ? 'show password' : 'hide password',
              ),
            ),


          ),

        ),
      );
    }
    Widget formm() {
      return Form(child: ListView(

        children: [
          _showPhonenput(),
          _showPasswordInput(),
        ],
      ));
    }


    Widget _showBody(BuildContext context) {
      return
        SingleChildScrollView(

            child:


            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  _weclome(context),



                ],
              ),

            ));
    }


    Widget _showLogoe() {
      return Container(
        padding: EdgeInsets.only(top: 30, bottom: 30,),
        child: Image.asset('assets/docB1.jpg', width: 100, height: 100,),


      );

  }
}

class DateTimeCard extends StatelessWidget {
  final String valsf;
  const DateTimeCard({
    Key? key,required this.valsf
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.bg03),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Color(MyColors.primary),
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Days , Timing',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(MyColors.primary),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.access_alarm,
                color: Color(MyColors.primary),
                size: 17,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
               valsf,
                style: TextStyle(
                  color: Color(MyColors.primary),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}