
import 'package:flutter/material.dart';
import 'package:hospital_app/LoginScreen.dart';
import 'package:hospital_app/utils/btn1.dart';
import 'package:masked_text/masked_text.dart';
import 'APIServices.dart';
import 'APIs/SignUpR.dart';
import 'Alerts/BaseAlertDialogS.dart';
import 'GItm/CButton.dart';
import 'OtherStyle.dart';
import 'Textstylee.dart';
class CreateAccount extends StatefulWidget {
  final String meg;

    const CreateAccount({super.key,required this.meg});




  @override
  State<CreateAccount> createState() => _CreateAccountState();

}

class _CreateAccountState extends State<CreateAccount> {
  OtherStyle otherStyle= new OtherStyle();
  bool _autoValidate = false;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final Textstylee ani= new Textstylee();
  bool _obscureText = true;
  TextEditingController te_fullname = new TextEditingController();
  TextEditingController te_mob = new TextEditingController();
  TextEditingController te_email = new TextEditingController();
  TextEditingController te_cnic = new TextEditingController();
  TextEditingController te_pass = new TextEditingController();
  TextEditingController te_pass1 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(



          backgroundColor: otherStyle.headerclr ,
          title: Column(
              children: <Widget>[
                Text(
                    'Sign Up',style: TextStyle(color: otherStyle.headertxtclr)),



              ]
          ),
          leading:   IconButton(
            icon:   Icon(Icons.arrow_back,color: otherStyle.headerbtnclr,),
            onPressed: ()async{
        //      _sendDataBack(context);
            },
          ),
        ),
        body: Stack(
          children: <Widget>[
            _showBody(context),

          ],
        )
    );



  }
  Widget _showLogo() {
    return   Container(
      padding: EdgeInsets.only(top:0,bottom:0,),


      child:     Image.asset('assets/patPlus.png',width: 150,height: 150,),

    );
  }

  Widget _showNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        controller: te_fullname,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: ani.inputStylee('Full Name'),
        validator: (value) {
          if (value!.isEmpty) {
            return ' Field is empty.';
          }
          return null;
        },
      ),
    );
  }
  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        controller: te_email,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        validator: (value){
          if(!
          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!))
          {
            return ' Please Provide Valid Email Address';
          }
          return null;
        },
        decoration: ani.EmailStylee('Email'),
      ),
    );
  }
  Widget _showCNICInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child:
      MaskedTextField(
        mask: "#####-#######-#",
        decoration: ani.CnicStylee('XXXXX-XXXXXXX-X'),
        controller: te_cnic,
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.length<14) {
            return 'Please Enter Valid CNIC No.';
          }
          return null;
        },
      ),
    );
  }
  Widget _showPhonenput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child:
      MaskedTextField(
        mask: "#### #######",
        controller: te_mob,
        decoration: ani.Phonestylee('XXXX XXXXXXX'),
        validator: (value) {
          if (value!.length<12) {
            return 'Please Enter Valid Mobile No.';
          }
          return null;
        },
      ),
    );
  }
  show_dialog(String valuee){

    var baseDialog = BaseAlertDialogS(

      content: valuee ,

      yes: "Ok",
    );
    showDialog(context: context, builder: (BuildContext context) => baseDialog);

  }

  show_dialogs(String valuee,String cnic , String mobilee){

  //  Navigator.push(context, MaterialPageRoute(builder: (context) => OTPVarification(content: '',mobilenno:mobilee,cnicc: cnic,
 //   )))
    ;




  }


  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        validator: (value) {
          if(!
          RegExp("^.{8}\$")
              .hasMatch(value!)){
            return 'Minimum eight characters.';
          }
          return null;
        },
        obscureText: _obscureText,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        controller: te_pass,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: InputBorder.none,
          enabledBorder: ani.txtborder(),
          filled: true,
          fillColor: Colors.white,
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
        ) ,
      ),
    );
  }

  Widget _showPasswordInput1() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child:   TextFormField(
        maxLines: 1,
        validator: (value) {
          if(!
          RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@\$%^&*-]).{8,}\$")
              .hasMatch(value!)){
            return 'Minimum eight characters, at least one uppercase letter, one lowercase letter and one number:.';
          }
          return null;
        },
        obscureText: _obscureText,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        controller: te_pass1,
        decoration:   InputDecoration(
          hintText: 'Confirm Password',
          fillColor:    otherStyle.txtfclr ,
          filled: true,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),

          ),

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

  Widget _showPrimaryButtonf(BuildContext context) {
    return   Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: SizedBox (
            height: 40.0,

            child:
            CButton(onPressed: ()async {

               //  }
    //   );
             // }
            },txt: "Sign Up",


            )));


  }
  Widget _showPrimaryButton(context) {
    return   Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
        child: Center(


          child: ElevatedButton(
        child:   Text('Sign Up',style:  otherStyle.btnstyle(),),
            style: btnprimary,
            onPressed: () {
              print('Ccc');
              if( formKey.currentState!.validate()) {
                print('isvalidform');

  show_dialog("Record Update sucessfully !!");
//                   Future<SignUpR?> _selectedItems =
//                   APIService().Signup(
//                     te_fullname.text.toString(),
//                     te_email.text.toString(),
//     te_mob.text.replaceAll(' ', '').toString(),
//     te_cnic.text.toString().replaceAll('-', ''),
//     te_pass.text.toString(),context);
// if(_selectedItems!=null)
//   {
//
//                 _selectedItems.then((value) {
//
// print(value);
//                     String hZonesString ="";
//                     if(value!.id==0) {
//                       hZonesString = value!.cnic.toString();
//                       show_dialog(hZonesString);
//                     }else{
//                       show_dialog("Sign Up Sucessfully !!");
//
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(meg: "")));
//                     }
//                 } );
// }
          }}
        ),
          ),
          );
  }
  Widget _weclome(BuildContext context) {
    return

      Padding(padding: EdgeInsets.only(top: 20)
        ,child:
        Row(
          children: <Widget>[
              Text('Create Account for ' +widget.meg, style: TextStyle(fontSize: 20,),)

          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      );

  }
  Widget _showBody(context) {
    return   Container(
        padding: const EdgeInsets.all(16.0),
        child:   Form(
            key: formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child:   ListView(
            shrinkWrap: true,
            children: <Widget>[

              _weclome(context),
              _showCNICInput(),

              _showNameInput(),
              _showPhonenput(),
              _showEmailInput(),

              _showPasswordInput(),

              _showPrimaryButton(context),
            ],
          ),
        ));
  }
}