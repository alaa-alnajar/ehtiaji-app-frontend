import 'package:ehtiaji/screens/categorypage.dart';
import 'package:ehtiaji/screens/locationpage.dart';
import 'package:ehtiaji/screens/notificationBar.dart';
import 'package:ehtiaji/screens/topbar.dart';
import 'package:ehtiaji/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ehtiaji/models/allproduct.dart';
import 'package:ehtiaji/models/product-info.dart';


class HomePage extends StatefulWidget {
  const   HomePage({super.key, /*required this.user*/});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>     with WidgetsBindingObserver {
  
    final  String user = "(اسم المستخدم ) "  ;
    bool locationGranted = false;
    bool locationEnabled = false;
    bool isPopupOpen = false;
    String searchText = "";


  List<Product> get searchResults {

  return allProducts.where((product){

    return product.productName
        .toLowerCase()
        .contains(searchText.toLowerCase());

  }).toList();

}

String getMallName(int id){

  switch(id){

    case 1:
      return "ميكا";

    case 2:
      return "سيني";

    case 3:
      return "عقرباوي";

    case 4:
      return "سامح";

    default:
      return "";

  }

}



void searchProduct(String text){

  text = text.trim();

  Product? product;


  for(var p in allProducts){

    if(p.productName.contains(text)){

      product = p;
      break;

    }

  }


  if(product != null){


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context)=> Categorypage(
          product!.mallId
        ),
      ),
    );


  }else{


    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(
        content: Text("المنتج غير موجود"),
      ),

    );


  }

}




    double progress = 0.0;
    double shoppingBudget = 300;
    double spentAmount = 120; // هذا اللي بيتغير لاحقاً
    
      

 
  Future<void> enableRealLocation() async {

  // 1) طلب صلاحية
  var status = await Permission.location.request();

  if (!status.isGranted) {
    return;
  }

  // 2) التأكد GPS شغال
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    return;
  }

  // 3) جلب الموقع الحقيقي
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  print("Lat: ${position.latitude}");
  print("Lng: ${position.longitude}");

  setState(() {
    locationGranted = true;
  });
}


Future<bool> checkLocationEnabled() async {
  return await Geolocator.isLocationServiceEnabled();
}

void showLocationPopup() {
  isPopupOpen = true;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setStatePopup) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
                          ),
             title: const Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.red,
                      ),
                      SizedBox(width: 8),
                      Text("تحذير",
                      style: TextStyle(
                        fontSize: 25,
                        color:AppColors.deepBlue,
                      ),),
                    ],
                  ),
            content: SizedBox(
              width: double.maxFinite,
              height: 250,
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                
                     const Text("نحتاج إلى الوصول إلى موقعك لعرض "
                     "المتاجر القريبة والعروض المناسبة لك."
                       " بدون تفعيل الموقع، لن تتمكن من استخدام ميزات التطبيق الأساسية.",
                     style: TextStyle(  color:AppColors.deepBlue,
                     overflow: TextOverflow.visible,
                     fontSize: 14),
                        ),

                      SizedBox(height: 12,),

                        Text("ملاحظة: يتم استخدام الموقع فقط لعرض المتاجر القريبة"
                       " ، ولا يتم تخزينه أو مشاركته.",
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color:AppColors.deepBlue,
                        fontSize: 15,
                       ),),
                
                      
                       

                   
                           
                 SizedBox(height:6 ),

                SwitchListTile(
                  title: const Text("تفعيل الموقع",
                  style: TextStyle(
                    color: AppColors.deepBlue,
                    fontWeight: FontWeight.bold,
                  ),),
                  value: locationEnabled,

                  activeColor:AppColors.white ,
                  activeTrackColor: AppColors.deepBlue,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: AppColors.white,

                  onChanged: (value) async {
                    setStatePopup(() {
                      locationEnabled = value;
                    });

                    if (value) {
                      await Geolocator.openLocationSettings();

                      // بعد الرجوع للتطبيق
                      bool enabled =
                          await Geolocator.isLocationServiceEnabled();

                      if (enabled && mounted) {
                        Navigator.pop(context);
                        setState(() {
                          locationGranted = true;
                        });
                      }
                    }
                  },
                ),
              ],
             ),
            ),
          );
        },
      );
    },
  );
}


@override
void initState() {
  super.initState();

  WidgetsBinding.instance.addObserver(this);

  WidgetsBinding.instance.addPostFrameCallback((_) async {

    bool enabled = await checkLocationEnabled();

    if (!enabled) {
      showLocationPopup();
    }

  });
}



@override
void dispose() {
  WidgetsBinding.instance.removeObserver(this);
  super.dispose();
}


@override
void didChangeAppLifecycleState(AppLifecycleState state) async {

  if (state == AppLifecycleState.resumed) {

    bool enabled =
        await Geolocator.isLocationServiceEnabled();


    if (enabled && isPopupOpen && mounted) {

      Navigator.of(context, rootNavigator: true).pop();

      isPopupOpen = false;


      setState(() {
        locationGranted = true;
        locationEnabled = true;
      });

    }
  }
}
  






  void fetchProgress() {
    double spentAmount = 120; // مثال: 65%

    setState(() {
      progress = spentAmount / shoppingBudget; 
          });
  }

 
 


    

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
      isHome: true,
    ),
  ),

             body: SafeArea(
              child: SingleChildScrollView(
                child:  Column(

              children: [
                 
              
            Padding(padding: EdgeInsetsGeometry.symmetric(
              horizontal: 16, vertical: 5  ),
              
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
    textAlignVertical: TextAlignVertical.center,

  textDirection: TextDirection.rtl,


  onSubmitted: (value){

    searchProduct(value);

  },


  decoration: InputDecoration(

    hintText: "ابحث هنا",

    prefixIcon: Icon(Icons.search),
     contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 0,
      ),




  enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),

  ),

)
       ),
      SizedBox(height: 3,),


      if(searchText.isNotEmpty)
      Expanded(
        child:   ListView.builder(

    shrinkWrap: true,

    itemCount: searchResults.length,


    itemBuilder:(context,index){


      Product product = searchResults[index];


      return ListTile(

        title: Text(
          product.productName
        ),


        subtitle: Text(
          "${product.price} JD"
        ),

      );


    },

  ),
  )]
),
 

                     
   ),
   Padding(
  padding: const EdgeInsets.all(10),
  child: SizedBox(
    width: MediaQuery.of(context).size.width - 50,
    child: TweenAnimationBuilder<double>(
      tween: Tween(
        begin: 0,
        end: (spentAmount / shoppingBudget).clamp(0.0, 1.0),
      ),
      duration: const Duration(milliseconds: 1500),
      builder: (context, value, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            
            // الشريط
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 20,
                backgroundColor: AppColors.white,
                color: AppColors.deepBlue,
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            // النص داخل الشريط
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${spentAmount.toInt()} JD',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${shoppingBudget.toInt()} JD',
                    style: const TextStyle(
                      color:AppColors.deepBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
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
                                crossAxisCount: width > 900 ? 4:2,
                                crossAxisSpacing: 20,
                                //mainAxisSpacing: 3,
                                padding:EdgeInsets.all(30) ,
                                children: [
                                  InkWell(
                                    onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Categorypage(2
                                            
                                          )
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
                                      MaterialPageRoute(builder: (context)=>  Categorypage(1
                                        
                                      )
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
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=> Categorypage(3
                                                                              )
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
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=> Categorypage(4
                                      
                                     )
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
               
   
   
              








             ),         
             ),                    
       
    );
         }
           }
        



 
























      