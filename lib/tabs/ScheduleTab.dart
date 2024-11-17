import 'package:flutter/material.dart';
import 'package:hospital_app/APIServices.dart';
import 'package:hospital_app/CounterPage.dart';
import 'package:hospital_app/styles/colors.dart';
import 'package:hospital_app/styles/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../APIs/AppointAp.dart';
import '../APIs/DoctorApi.dart';
import '../APIs/ScheulelApi.dart';
import '../APIs/SignUpR.dart';
import '../Alerts/BaseAlertDialogS.dart';
import '../OtherStyle.dart';

class ScheduleTab extends StatefulWidget {
  const ScheduleTab({Key? key}) : super(key: key);

  @override
  State<ScheduleTab> createState() => _ScheduleTabState();
}

enum FilterStatus {  Complete,Pending, Cancel }
//
OtherStyle otherStyle = new OtherStyle();
 List<ScheulelApi> schedules = [];
List<ScheulelApi> filteredSchedules= [];
//   {
//     'img': 'assets/doctor01.jpeg',
//     'doctorName': 'Dr. Anastasya Syahid',
//     'doctorTitle': 'Dental Specialist',
//     'reservedDate': 'Monday, Aug 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Upcoming
//   },
//   {
//     'img': 'assets/doctor02.png',
//     'doctorName': 'Dr. Mauldya Imran',
//     'doctorTitle': 'Skin Specialist',
//     'reservedDate': 'Monday, Sep 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Upcoming
//   },
//   {
//     'img': 'assets/doctor03.jpeg',
//     'doctorName': 'Dr. Rihanna Garland',
//     'doctorTitle': 'General Specialist',
//     'reservedDate': 'Monday, Jul 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Upcoming
//   },
//   {
//     'img': 'assets/doctor04.jpeg',
//     'doctorName': 'Dr. John Doe',
//     'doctorTitle': 'Something Specialist',
//     'reservedDate': 'Monday, Jul 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Complete
//   },
//   {
//     'img': 'assets/doctor05.jpeg',
//     'doctorName': 'Dr. Sam Smithh',
//     'doctorTitle': 'Other Specialist',
//     'reservedDate': 'Monday, Jul 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Cancel
//   },
//   {
//     'img': 'assets/doctor05.jpeg',
//     'doctorName': 'Dr. Sam Smithh',
//     'doctorTitle': 'Other Specialist',
//     'reservedDate': 'Monday, Jul 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Cancel
//   },
// ];

class _ScheduleTabState extends State<ScheduleTab> {
  String  status ="Complete";
  Alignment _alignment = Alignment.centerLeft;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
void reload_Data() async {

  print( status.toString());
  print( status.toString());

  final SharedPreferences prefs = await _prefs;
  String  fkPatient= await prefs.getString('fkPatient').toString();


  List<ScheulelApi>? api = await APIService().get_pat_schedule(fkPatient, context);
  if(api!=null)
  this.setState(() {
    schedules = api!;
    filteredSchedules = schedules;

  });

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


    reload_Data();





    //_totalNotifications = 0;
    // permission_manager();
  }
  show_dialog(String valuee){

    var baseDialog = BaseAlertDialogS(

      content: valuee ,
      type: "Ex",
      yes: "Ok",
    );
    showDialog(context: context, builder: (BuildContext context) => baseDialog);

  }
  void Booknow(index,ScheulelApi aa) async {

    final SharedPreferences prefs = await _prefs;
    String  fkPatient= await prefs.getString('fkPatient').toString();


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



      if(value!.id==-1  || value!.id==0)
        {
          show_dialog(value!.cnic.toString()),

        }else{

        shoeSuccess(value),

      }




    });
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

  void shoeSuccess(SignUpR value){
    String mess =
        "You have successfully Book Appointment !"
            "You Appointment #" +value.isActive.toString()
            + "You Bill #" +value.id.toString();
    show_dialogA(mess);
  }
  cancel_click(id ) async {


    DoctorApi? api = await APIService().updateStatus(id,3, context);
    if(api!=null)
    {
      show_dialog(api!.cnic.toString());

    }
  this.reload_Data();

  }

  @override
  Widget build(BuildContext context) {

filteredSchedules = schedules.where((var schedule) {
     return schedule.status == status.toString();
     }).toList();

    return

      Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Schedule',
              textAlign: TextAlign.center,
              style: kTitleStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(MyColors.bg),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                print(filterStatus);
                                print(status);
                                if (filterStatus ==
                                    FilterStatus.Complete) {
                                  status = "Complete";
                                  _alignment = Alignment.centerLeft;
                                } else
                                if (filterStatus == FilterStatus.Pending) {
                                  status = "Pending";
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.Cancel) {
                                  status = "Cancel";
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                filterStatus.name,
                                style: kFilterStyle,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  duration: Duration(milliseconds: 200),
                  alignment: _alignment,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(MyColors.primary),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: (context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return
                    InkWell(
                      onTap: () {
                        print(_schedule.id);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CounterPage(c1:_schedule.id!,c2:20 )));

                      },
                  child:
                    Card(
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
                              //   //backgroundImage: AssetImage(_schedule['img']),
                              // ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _schedule.doctorName.toString(),
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
                          DateTimeCard(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _schedule.status=="Complete"?Container():    Expanded(
                                child: OutlinedButton(
                                  child: Text('Cancel'),
                                  onPressed: () async{await this.cancel_click(_schedule.id
                                  );},
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                                 Expanded(
                                child: ElevatedButton(
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(otherStyle.btnclr)
                                      ,foregroundColor:MaterialStateProperty.all<Color>(otherStyle.btnfclr)
                                  ),
                                  child: Text('Reschedule'),
                                  onPressed: () =>   {   this.Booknow(index, _schedule)},
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                    );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DateTimeCard extends StatelessWidget {
  const DateTimeCard({
    Key? key,
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
                'Mon, July 29',
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
                '11:00 ~ 12:10',
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
