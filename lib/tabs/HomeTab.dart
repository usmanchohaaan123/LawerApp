import 'package:flutter/material.dart';
import 'package:hospital_app/Doctorlst.dart';
import 'package:hospital_app/styles/colors.dart';
import 'package:hospital_app/styles/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../APIServices.dart';
import '../APIs/APISlipType.dart';

List<Map> doctors = [
  {
    'img': 'assets/doctor02.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/doctor03.jpeg',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  },
  {
    'img': 'assets/doctor02.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/doctor03.jpeg',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  }
];

class HomeTab extends StatefulWidget {
  final void Function() onPressedScheduleCard;
final String aa;
  const HomeTab({
    Key? key,
    required this.onPressedScheduleCard,   required this.aa,
  }) : super(key: key);
  @override
  State<HomeTab> createState() => _HomeTabState();

}

class _HomeTabState extends State<HomeTab> {
List<APISlipType> catee =[];

reload_Data () async {

  List<APISlipType>? lst = await  APIService().SlipTypes( context);

  if(lst!=null)
    this.setState(() {
      catee = lst;
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            UserIntro(title: widget.aa.toString(),),
            SizedBox(
              height: 10,
            ),
            SearchInput(),
            SizedBox(
              height: 20,
            ),
            CategoryIcons(categories: catee,),
            SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Appointment Today',
            //       style: kTitleStyle,
            //     ),
            //     TextButton(
            //       child: Text(
            //         'See All',
            //         style: TextStyle(
            //           color: Color(MyColors.yellow01),
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       onPressed: () {},
            //     )
            //   ],
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // AppointmentCard(
            //   onTap: widget. onPressedScheduleCard,
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Text(
            //   'Top Doctor',
            //
            //
            //   style: TextStyle(
            //     color: Color(MyColors.header01),
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),

          ],
        ),
      ),
    );
  }
}

class TopDoctorCard extends StatelessWidget {
  String img;
  String doctorName;
  String doctorTitle;

  TopDoctorCard({
    required this.img,
    required this.doctorName,
    required this.doctorTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Row(
          children: [
            Container(
              color: Color(MyColors.grey01),
              child: Image(
                width: 100,
                image: AssetImage(img),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: TextStyle(
                    color: Color(MyColors.header01),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  doctorTitle,
                  style: TextStyle(
                    color: Color(MyColors.grey02),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(MyColors.yellow02),
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '4.0 - 50 Reviews',
                      style: TextStyle(color: Color(MyColors.grey02)),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final void Function() onTap;

  const AppointmentCard({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(MyColors.primary),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/doctor01.jpeg'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dr.Muhammed Syahid',
                                style: TextStyle(color: Colors.white)),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Dental Specialist',
                              style: TextStyle(color: Color(MyColors.text01)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ScheduleCard(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(MyColors.bg02),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          height: 10,
          decoration: BoxDecoration(
            color: Color(MyColors.bg03),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

// List<APISlipType> categories = [
//   // { 'id':"1", 'icon':'assets/stethoscope.png', 'text': 'General','color': Color(0xFF467DFF)},
//   //   {'id':"2",'icon':'assets/dental-care.png', 'text': 'Dental','color': Color(0xFFFFB25F)},
//   // {'id':"3",'icon': 'assets/daily-health-app.png', 'text': 'Cardiology','color': Color(0xFFEC716A)},
//   // {'id':"4",'icon':'assets/brain.png', 'text': 'Neurology','color': Color(0xFF54B4D2)},
//   // {'id':"8",'icon': 'assets/fracture.png', 'text': 'OrthoPedic','color': Color(0xFF467DFF)},
//   // {'id':"6",'icon':'assets/stomach.png', 'text': 'Gestroentrology','color': Color(0xFFFFB25F)},
// ];

class CategoryIcons extends StatelessWidget {
  final List<APISlipType> categories;
  const CategoryIcons({
    Key? key
  ,required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Center(
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: categories.length,
        itemBuilder: (ctx, i) {
          return
            InkWell(
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => Doctorlst(meg:  categories[i].id.toString()
                ,details:  categories[i].name.toString()
                )));
                
              },
          child:

            Card(
             color: Color(int.parse("0xFF" + categories[i].colorCode.toString())),
            child: Container(

              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(20)),

              child: Stack(

                children: [
              Center (

                child:  CategoryIcon(
                        id:  categories[i].id.toString(),
                        icon:  categories[i].imgPath.toString(),
                    text: categories[i].name.toString(),
                bg:Colors.red
                      ),
                      ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.stretch,
                  //   children: [
                  //     Expanded(
                  //       child: Image.network(
                  //         'https://tech.pelmorex.com/wp-content/uploads/2020/10/flutter.png',
                  //         fit: BoxFit.fill,
                  //       ),
                  //     ),
                  //     Text(
                  //       'Title',
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     Row(
                  //       children: [
                  //         Text(
                  //           'Subtitle',
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 15,
                  //           ),
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
            );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 5,
          mainAxisExtent: 120,
        ),
      ),
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     for (var category in categories)
    //       CategoryIcon(
    //         icon: category['icon'],
    //         text: category['text'],
    //       ),
    //   ],
    // );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.bg01),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Mon, July 29',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              '11:00 ~ 12:10',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  String id;
  String icon;
  String text;
 Color bg;
  CategoryIcon({
    required this.id,
    required this.icon,
    required this.text,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return

      Container(

   child:   InkWell(
      splashColor: Color(MyColors.bg01),
      onTap: () {

        Navigator.push(context, MaterialPageRoute(builder: (context) => Doctorlst(
            meg: id
            ,details:text
        )));

      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10),
              ),
             // child: Image(image: AssetImage(icon),width: 23,height: 23,) ,
             child: Image(image:NetworkImage(icon),width: 23,height: 23,) ,


            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: Color(MyColors.black),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
      );

  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(MyColors.bg),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search,
              color: Color(MyColors.purple02),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search a doctor or health issue',
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(MyColors.purple01),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserIntro extends StatefulWidget {
final  String title;
    UserIntro({super.key,required this.title});

  //
  // final int   counter   ;
  //
  //
  //
  //
  //
  // Dashboard({super.key , required this.counter });

  @override
  State<UserIntro> createState() => _UserIntroState();

}

class _UserIntroState extends State<UserIntro> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    String username='';
  @override
  void initState() {
    super.initState();
    getdata();
  }
load_data(){



}
  getdata (    )async {
    final SharedPreferences prefs = await _prefs;
    print(prefs.getString('patName').toString());
    username =await  prefs.getString('patName').toString();
  }
    @override
  Widget build(BuildContext context) {
      getdata();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:   [
            Text(
              'Hello',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
            widget.title  .toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/person.jpeg'),
        )
      ],
    );
  }
}
