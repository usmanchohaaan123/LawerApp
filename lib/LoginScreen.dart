
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_app/screens/home.dart';
import 'package:hospital_app/utils/btn1.dart';
import 'package:masked_text/masked_text.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'APIServices.dart';
import 'APIs/LoginApi.dart';
import 'Dashboard.dart';

import 'package:http/http.dart' as http;
import 'Alerts/BaseAlertDialogS.dart';
import 'CreateAccount.dart';
import 'GItm/CButton.dart';
import 'Loading/loading_screen.dart';
import 'OtherStyle.dart';
import 'Textstylee.dart';
import 'assets.dart';
import 'main.dart';

class LoginScreen extends StatefulWidget {
final String meg;

  const LoginScreen({super.key,required this.meg});

  //
  // final int   counter   ;
  //
  //
  //
  //
  //
  // Dashboard({super.key , required this.counter });

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  OtherStyle otherStyle= new OtherStyle();
  MethodChannel platform = new MethodChannel('backgroundservice');

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
   final String _email='';
 final String _password='';
  final String _errorMessage='';
    String selType='Client';
    double width = 200.0;
    double height = 30.0;
    double loginAlign = -1;
    double signInAlign = 1;
  double xAlign=0;
  Color loginColor=Colors.black;
  Color signInColor=Colors.black;
  Color selectedColor =Colors.yellow;
  Color normalColor =Colors.black;
   bool checkBoxValue=false;
  bool _isLoading = false;
    bool _obscureText = true;
  final Textstylee ani= new Textstylee();
GlobalKey<FormState> formKey  = new GlobalKey<FormState>();

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


   @override
  void initState() {

     // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
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
    Future.delayed(Duration.zero, () {
      this.checkForInitialMessage();
    });







    //_totalNotifications = 0;
   // permission_manager();
  }
  checkForInitialMessage() async {
    // await Firebase.initializeApp();
    // RemoteMessage? initialMessage =
    // await FirebaseMessaging.instance.getInitialMessage();
    //
    // if (initialMessage != null) {
    //   PushNotification notification = PushNotification(
    //     title: initialMessage.notification?.title,
    //     body: initialMessage.notification?.body,
    //   );
    //   setState(() {
    //     _notificationInfo = notification;
    //     _totalNotifications++;F
    //   });
    // }

    if(widget.meg!="")
      show_dialog(widget. meg);
  }
   TextEditingController te_username = new TextEditingController(text: "",);
   TextEditingController te_password = new TextEditingController( text: "" );
   @override
  Widget build(BuildContext context) {


     return Scaffold(

         body: Stack(
           children: <Widget>[
             _showBody(context),

           ],
         )
     );



   }


  permission_manager () async {

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
      child:   Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
            onTap: () {

              this.setState(() {
                checkBoxValue= !checkBoxValue;
              });

      },
        child:
        Row(
        children: <Widget>[
        Checkbox(
              checkColor: Colors.black,
              activeColor:  otherStyle.lnk2clr ,
              value: checkBoxValue, onChanged: (bool? value) {
                this.setState(() {
                  checkBoxValue= value!;
                });
        },

            ),
            Text('Remember Me',style: TextStyle(fontSize: 17.0), ),
]),),
            TextButton(
              onPressed: () {
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()));
              },
              child:   Text('Forgot Password ?',style: TextStyle(color:otherStyle.linkclr ,),),
            ),
          ],
        ),
      )
    );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child:   TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,

        validator: (value){
          if(value!=null  && value.length<2 )
          {
            return 'Enter Min 10 Character';
          }else{
            return null;
          }

        },
controller: te_username,
        textInputAction: TextInputAction.next,
        decoration:   InputDecoration(
          hintText: 'Username',

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),


          ),
prefixIcon:   Icon(
               Icons.person  ,
),


        ),

      ),
    );
  }

  save_pref (   String username ,String password ,
      String patName ,String fkPatient )async{

    final SharedPreferences prefs = await _prefs;
    await prefs.setString('cnic', username);
    await prefs.setString('password', password);
    await prefs.setString('patName', patName);
    await prefs.setString('fkPatient', fkPatient);


  }
   show_dialog(String valuee){

     var baseDialog = BaseAlertDialogS(

       content: valuee ,
type: "Ex",
       yes: "Ok",
     );
     showDialog(context: context, builder: (BuildContext context) => baseDialog);

   }
//
//   Widget _showPrimaryButton(BuildContext context) {
//     return   Padding(
//         padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
//         child: SizedBox (
//           height: 40.0,
//
//           child:
//           CButton(onPressed: ()async{
//
//
//
//               print(te_username.text.toString());
//               print(te_username.text.toString());
//
//               //readJson(te_username.text.replaceAll("-", "").toString(),te_password.text.toString(),deviceId);
// //MapScreen
//          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
//             },txt: 'Login', )
// //           ElevatedButton(
// //             style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(otherStyle.btnclr)),
// // //             onPressed: () {
// // //
// // //               print(te_username.text.toString());
// // //               print(te_username.text.toString());
// // //    readJson(te_username.text.replaceAll("-", "").toString(),te_password.text.toString());
// // // //MapScreen
// // //            //    Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
// // //             },
// //             child: const Text('Login'),
// //
// //           ),
//         ));
//
//
//   }
  Widget _showPrimaryButton(BuildContext context) {
    return   Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: Center (


          child: ElevatedButton(
            style:btnprimary,

            onPressed: () {

              print(te_username.text.toString());
              //   Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'TRee')));
               if(te_username.text.length<2 || te_password.text.length<3)
               {
                 show_dialog('Please Enter Valid Username / Password');

               }else {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Home(  )));
              //
 //
 //                //#region Login
 //                 Future<LoginApi?> _selectedItems = APIService().Login(
 //                     te_username.text.toString().replaceAll(" ", ""), te_password.text.toString(),context);
 //                 _selectedItems.then((value) {
 //                   String hZonesString = value!.typeName.toString();
 //
 //                   if (value.id == 0) {
 //                     show_dialog(hZonesString);
 //                   } else {
 //
 //                     print(value!.toJson());
 //                    save_pref(value!.loginName.toString(),value!.password.toString(),
 //                        value!.patName.toString(),value!.fkPatient.toString()
 //                     //     ,value.employeeNumber,value.journalistCardNumber,value.voucherOwner,value.deviceTokenNumber
 //                          );
 //                     //
 //
 //
 //                     Navigator.push(context, MaterialPageRoute(builder: (context) => Home(  )));
 //
 //
 //
 //
 //                   }
 //                 }
 // //#endregion

               //);
              }
            },
            child: const Text('Log in' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

          ),
        ));
  }

  Widget _showPrimaryButtonE(BuildContext context) {
    return   Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: SizedBox (
            height: 40.0,

            child:
            CButton(onPressed: () {
    }

        , txt: '',)));


  }
  Widget _showPrimaryButton1(BuildContext context) {
    return   Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: SizedBox (
          height: 40.0,

          child: ElevatedButton(
            onPressed: () async {
              try {

                // Configure socket transports must be specified
//                 IO.Socket     socket = IO.io(
//                 "ws://162.250.125.195", <String, dynamic>{
//                   "transports": ["websocket"],
//                   "autoConnect": false,
//                 });
//                 socket.connect();
// print(socket.connected);
//                 // Connect to websocket
//                 socket.emit("jsajdsajdasjd","ksadkjsakjdsadk");
// socket.onConnect((datss)=> print('connected'));
//                 // Handle socket events


              } catch (e) {
                print(e.toString());
              }

           //    Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
            },
            child: const Text('Login'),

          ),
        ));


  }
  Widget _showPhonenput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child:
      MaskedTextField(
        mask: "#### #######",
        controller: te_username,
        decoration:  ani.Phonestylee('XXXX XXXXXXX'),
        validator: (value) {
          if (value!.length<12) {
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
        decoration:  ani.CnicStylee('CNIC XXXXX-XXXXXXX-X'),
        controller: te_username,

        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.length<14) {
            return 'Please Enter Valid CNIC No.';
          }
          return null;
        },
        textInputAction: TextInputAction.next, // Moves focus to next.
      ),

    );

  }
   Widget _showGuestlogin(BuildContext context) {
     return   Padding(
         padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
         child: SizedBox(
           height: 40.0,

           child: ElevatedButton(
             onPressed: () async{

               final SharedPreferences prefs = await _prefs;







             },
             child: const Text('Login as Guest'),

           ),
         ));
   }
     convertFutureListToList(  Future<List> lsttt) async {
     Future<List> _futureOfList = lsttt;
     List list = await _futureOfList ;

   }
  Widget _showdoesacc(BuildContext context) {
    return  Row(
      children: <Widget>[
          Text('Does not have account?',  style: TextStyle(fontSize: 16,color: Colors.black ),),
        TextButton(
          child:   Text(
            'Sign up',
            style: TextStyle(fontSize: 25,color: otherStyle.lnk2clr ),
          ),
          onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccount(meg:selType)));
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
        ,child:
      Row(
      children: <Widget>[
        const Text('Welcome to ' , style: TextStyle(fontSize: 25),)

      ],
      mainAxisAlignment: MainAxisAlignment.center,
    ),
    );

  }
  Widget _weclome2(BuildContext context) {
    return  Row(
      children: <Widget>[
        const Text('e-Lawyer Apointment ' , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)

      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );

  }

  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
      child:   TextFormField(
        maxLines: 1,
        key: formKey,
        obscureText: _obscureText,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        controller: te_password,
        validator: (value){
          if(value!=null  && value.length<4 )
          {
            return 'Enter Min 7 Character';
          }else{
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


        )     ,

      ),
    );
  }
  Widget formm (){

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
          autovalidateMode:  AutovalidateMode.onUserInteraction,
          child:   ListView(
            shrinkWrap: true,
            children: <Widget>[
              _weclome(context),
              _weclome2(context),
              tbutton(),
              _showLogoe(),
              _showPhonenput(),
              _showPasswordInput(),
              _showForgetPass(),
              _showPrimaryButton(context),



              _showdoesacc(context),
            ],
          ),

        ));
  }
Widget tbutton(){
     return Center(
       child: Container(
         width: width,
         height: height,
         decoration: BoxDecoration(
           color: Colors.yellow,
           borderRadius: BorderRadius.all(
             Radius.circular(50.0),
           ),
         ),
         child: Stack(
           children: [
             AnimatedAlign(
               alignment: Alignment(xAlign, 0),
               duration: Duration(milliseconds: 300),
               child: Container(
                 width: width * 0.5,
                 height: height,
                 decoration: BoxDecoration(
                   color: Colors.lightGreen,
                   borderRadius: BorderRadius.all(
                     Radius.circular(50.0),
                   ),
                 ),
               ),
             ),
             GestureDetector(
               onTap: () {
                 setState(() {
                   xAlign = loginAlign;
                   loginColor = selectedColor;
                   this.setState(() {
                     selType="Client";
                   });
                   signInColor = normalColor;
                 });
               },
               child: Align(
                 alignment: Alignment(-1, 0),
                 child: Container(
                   width: width * 0.5,
                   color: Colors.transparent,
                   alignment: Alignment.center,
                   child: Text(
                     'Client',
                     style: TextStyle(
                       color: loginColor,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
               ),
             ),
             GestureDetector(
               onTap: () {
                 setState(() {
                   xAlign = signInAlign;
                   signInColor = selectedColor;
                   this.setState(() {
                     this.selType="Lawyer";
                   });
                   loginColor = normalColor;
                 });
               },
               child: Align(
                 alignment: Alignment(1, 0),
                 child: Container(
                   width: width * 0.5,
                   color: Colors.transparent,
                   alignment: Alignment.center,
                   child: Text(
                     'Lawyer',
                     style: TextStyle(
                       color: signInColor,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                 ),
               ),
             ),
           ],
         ),
       ),

  );

}
  Widget _showLogoe() {
    return   Container(
      padding: EdgeInsets.only(top:30,bottom:30,),
      child:     Image.asset(Assets.loginB,width: 150,height: 150,),



    );
  }
}

