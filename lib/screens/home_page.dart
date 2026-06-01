import 'package:ehtiaji/screens/aqrabawi.dart';
import 'package:ehtiaji/screens/city.dart';
import 'package:ehtiaji/screens/locationpage.dart';
import 'package:ehtiaji/screens/micca.dart';
import 'package:ehtiaji/screens/notificationBar.dart';
import 'package:ehtiaji/screens/samih.dart';
import 'package:ehtiaji/screens/topbar.dart';
import 'package:ehtiaji/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
import 'package:ehtiaji/screens/topbar.dart';

class HomePage extends StatefulWidget {
  const   HomePage({super.key, /*required this.user*/});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final  String user = "(اسم المستخدم ) "  ;



  @override
  void initState() {
    super.initState();
    fetchProgress(); // أول ما تفتح الصفحة استدعي الميثود
  }

  // هذه الميثود ممكن تغيّر قيمة progressa
  void fetchProgress() {
    double newProgress = 65; // مثال: 65%

    setState(() {
      progress = newProgress / 100; 
          });
  }

   double progress = 0.65; // 65% كمثال
   int total = 100; // القيمة الكاملة

 
   
    

  @override
  Widget  build (BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

   return Scaffold(
  appBar: PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: Topbar(
      notificationCount: 5,
      onNotificationTap: () {
        print('notifications');
      },
      height: 1,
    ),
  ),

             body: 
             Column(
              children: [
                 
              
            Padding(padding: EdgeInsetsGeometry.symmetric(
              horizontal: 16, vertical: 8  ),
              
              child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                       children: [

                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal:2),
                            child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text("مرحبا (اسم المستخدم )",
                            style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color:AppColors.deepBlue,
                          ),
                          ),

                       const Spacer(), //مسافة
                     
                      Container(
                        decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(66, 0, 0, 0),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                    ),
                  ],
                ),
                  child: IconButton(
                  icon: Icon(Icons.location_on_outlined,
                  color: AppColors.deepBlue,),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Locationpage()
                                      ),
                                      );
                  },
             ),
                 ) ],
              ),
            ),
                
                Text("الموقع الحالي الزرقاء",
                style: TextStyle(
                  color: AppColors.deepBlue,
                  fontSize: 16,
                ),                
            ),
          
             Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 0.6),
                  duration: Duration(milliseconds: 2500),
                  builder: (context, value, child) {
                    return LinearProgressIndicator(
                      value: value,
                      minHeight: 20,
                      color: AppColors.deepBlue,
                      backgroundColor:AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      
        );
      },
    ),
  ),
),

  Padding(
  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
  child:Column(
    children: [
   Container(
    height: 25,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: TextField(
      textAlign: TextAlign.start,

      decoration: InputDecoration(
        hintText: "ابحث هنا...",
        prefixIcon: Icon(Icons.search),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(vertical: 5),
      ),
    ),

      ),
      SizedBox(height: 5,)
    ]
),
                     
   ),



                   
                      SizedBox(
                        height: height * 0.19,
                       child:Notificationbar(offers: offers),
                      ),
                       
                               Padding(
                                padding: EdgeInsetsGeometry.symmetric(horizontal: 5,vertical: 5), 
                                child: Text("اطّلع على أحدث الخصومات الرائعة في هذه المولات ",
                                style: TextStyle(
                                color: AppColors.deepBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,

                              ),
                            ),
                              ),

                            
                              SizedBox(
                                height: height* 0.33,
                                
                                child: GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                //mainAxisSpacing: 3,
                                padding:EdgeInsets.all(30) ,
                                children: [
                                  InkWell(
                                    onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => MiccaMall()
                                          ), // 
                                              );
                                            },
                                                                           
                                    child:Column(
                                      children: [
                                     Image.asset('assets/images/micca.png',
                                    width: 80,
                                    height: 80,
                                    filterQuality: FilterQuality.high,
                                    ),
                                    Text("ميكا مول ",
                                    style: TextStyle(
                                    color:AppColors.deepBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  )
                                    ),
                                      ]
                                      )
                                  ),
                                  
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>  CityMall()
                                      ),
                                      );
                                      },
                                    child:Column(

                                    children: [
                                     Image.asset('assets/images/city.png',
                                     width: 80,
                                    height: 80,
                                    filterQuality: FilterQuality.high,
                                    ),
                                    Text("سيتي مول ",
                                    style: TextStyle(
                                    color:AppColors.deepBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold

                                    )
                                    ),
                                    ]
                                    )
                                  ),
                                
                                
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Aqrabawi()
                                      ),
                                      );
                                    },
                                    child: Column(
                                      children: [
                                    Image.asset('assets/images/aqrabawi.png',
                                    width: 80,
                                    height: 80,
                                    //filterQuality:FilterQuality.medium
                                    ),
                                    Text("عقرباوي مول  ",
                                    style: TextStyle(
                                    color:AppColors.deepBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                    )
                                    ),
                                      ]
                                    ),
                                  ),


                                  InkWell(
                                    onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=> SamihMall()
                                     ),
                                     ); },
                                    child: Column(
                                      children: [
                                    Image.asset('assets/images/samih.png',
                                    width: 80,
                                    height: 80,
                                    //filterQuality: FilterQuality.high,
                                    //fit: BoxFit.cover
                                    ),
                                    Text(" سامح مول ",
                                    style: TextStyle(
                                    color:AppColors.deepBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                    )
                                    ),
                                      ]
                                      ),
                                  ),



                                                              ],
                              )
                            ),
              ]),


                                
             )]
                
              ),
               
   
   
              








              
                                
       
    );
         }
           }
        



 
























      