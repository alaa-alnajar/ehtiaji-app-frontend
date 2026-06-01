import 'package:ehtiaji/models/cart.dart';
import 'package:ehtiaji/screens/city.dart';
import 'package:ehtiaji/screens/intent_to_buy.dart';
import 'package:ehtiaji/screens/samih.dart';
import 'package:ehtiaji/screens/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ehtiaji/utils/colors.dart';
import 'package:ehtiaji/models/product-info.dart';

class Aqrabawi extends StatefulWidget {
  const Aqrabawi({super.key});

  @override
  State<Aqrabawi> createState() => _AqrabawiState();
}

class _AqrabawiState extends State<Aqrabawi> {


List<Product> products = [
  Product(productId:1,productName: " شكولاتة",description:"", price: "0.30", image: "assets/images/chocolate.png",stockQuantity:10,isAvailable:true ,categoryId:1,isSpecial:true),
  Product(productId:1,productName: "زيت العافية",description:"", price: "2.30", image: "assets/images/oil.png",stockQuantity:10, isAvailable:true ,categoryId:1,isSpecial: true),
  Product(productId:2,productName: "جبنة سائلة",description:"", price: "3.50", image: "assets/images/lemon.png",stockQuantity:10,isAvailable:true ,categoryId:1,isSpecial: false),
  Product(productId:3,productName: "لبن ", description:"",price: "0.30", image: "assets/images/yogurt.png",stockQuantity:10, isAvailable:true ,categoryId:1,isSpecial: false),
  Product(productId:4,productName: "أرز مصري",description:"", price: "5.50", image: "assets/images/rice.png", stockQuantity:10,isAvailable:true ,categoryId:1,isSpecial: true),
  Product(productId:5,productName: " موز", description:"",price: "2.30", image: "assets/images/banana.png", stockQuantity:10,isAvailable:true ,categoryId:1,isSpecial: true),
  Product(productId:5,productName: "ليمون",description:"", price: "3.00", image: "assets/images/lemon.png",stockQuantity:10,isAvailable:true ,categoryId:1,isSpecial: false),
   
];
 
  @override
  Widget build(BuildContext context) {

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
       
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            //crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
          child:Text(
            'العقراباوي مول',

            style: TextStyle(
              fontSize: 25,
              
              fontWeight: FontWeight.bold,
              color: AppColors.deepBlue,

            ),
          ),
          ),
          Material(
            color: AppColors.white,
            shape: CircleBorder(),

                
          child: IconButton(
            icon:Icon(Icons.shopping_cart,
            size: 20,
             color: AppColors.deepBlue),
           onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>  IntentToBuy(),
            ),
            
                     );
                     
        },
          ),
          )
        ]
        ),
        ),
        
        
                            
       


          Expanded(

            child: ListView.builder(

              itemCount: products.length,

              itemBuilder: (context, index) {

                final product = products[index];

                return Padding(

                  padding: const EdgeInsets.all(10),

                  child: Stack(

                    children: [

                      Container(

                        padding: const EdgeInsets.all(15),

                        decoration: BoxDecoration(

                          color: AppColors.deepBlue,

                          borderRadius:
                              BorderRadius.circular(20),

                          boxShadow: const [

                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),

                        child: Row(

                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,

                          children: [

                            Container(

                              width: 80,
                              height: 80,

                              decoration: BoxDecoration(

                                color: Colors.white,

                                borderRadius:
                                    BorderRadius.circular(15),
                              ),

                              child: Image.asset(
                                product.image,
                              ),
                            ),

                            Column(

                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [

                                Text(

                                  product.productName,

                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.collGray,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                Text(

                                  "${product.price} د.أ",

                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.collGray,
                                  ),
                                ),
                              ],
                            ),

                            CircleAvatar(

                              backgroundColor:
                                  Colors.green,

                              child: IconButton(

                                onPressed: () {

                                  setState(() {

                                    Cart.addProduct(product);

                                  });

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(

                                    SnackBar(

                                      content: Text(
                                        "${product.productName} تمت إضافته",
                                      ),

                                      duration:
                                          const Duration(
                                        seconds: 1,
                                      ),
                                    ),
                                  );
                                },

                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      if (product.isSpecial)

                        Positioned(

                          top: -8,
                          left: -8,

                          child: Transform.rotate(

                            angle: -0.12,

                            child: Image.asset(
                              "assets/images/offerchart.png",
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
               onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> SamihMall(),
               ),               
             );
             },
              child:Text("السوق التالي",
              style: TextStyle(
                color: AppColors.deepBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                
              ),
             )
           )
        ],
      ),
    );
  }
}



/*
  List<Product> products = [
  Product(productId:1,productName: " شكولاتة",description:"", price: "0.30", image: "assets/images/chocolate.png",stockQuantity:10,isAvailable:true ,categoryId:1,isSpecial:true),
  Product(productId:1,productName: "زيت العافية",description:"", price: "2.30", image: "assets/images/oil.png",stockQuantity:10, isAvailable:true ,categoryId:1,isSpecial: true),
  Product(productId:2,productName: "جبنة سائلة",description:"", price: "3.50", image: "assets/images/lemon.png",stockQuantity:10,isAvailable:true ,categoryId:1,isSpecial: false),
  Product(productId:3,productName: "لبن ", description:"",price: "0.30", image: "assets/images/yogurt.png",stockQuantity:10, isAvailable:true ,categoryId:1,isSpecial: false),
  Product(productId:4,productName: "أرز مصري",description:"", price: "5.50", image: "assets/images/rice.png", stockQuantity:10,isAvailable:true ,categoryId:1,isSpecial: true),
  Product(productId:5,productName: " موز", description:"",price: "2.30", image: "assets/images/banana.png", stockQuantity:10,isAvailable:true ,categoryId:1,isSpecial: true),
  Product(productId:5,productName: "ليمون",description:"", price: "3.00", image: "assets/images/lemon.png",stockQuantity:10,isAvailable:true ,categoryId:1,isSpecial: false),
   
];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor:AppColors.collGray ,
        toolbarHeight: 60,
        flexibleSpace: Stack(
          children: [
            SvgPicture.asset('assets/svg/topbar.svg',
            height: double.infinity,
            width: double.infinity,
            fit:BoxFit.cover
            ),
                ],
                 ),
                 leading:BackButton(
                  color:AppColors.collGray
                 ),
      ),
      body: Column(
        children: [
          Align(
          child: Text(' العقرباوي مول ',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.deepBlue,
          ),),
          ),
          Expanded(
            child:ListView.builder
           (
            itemCount: products.length,
            itemBuilder:(context,index){
              final product = products[index];

              return Padding(
                padding:const EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.deepBlue,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Image.asset(product.image),
                          ),

                            Column(
                            crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              Text(product.productName,
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.collGray
                              ),
                               ),
                               Text(product.price,
                               style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.collGray
                               ),)

                            ],
                          ),

                          CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(Icons.add,color:AppColors.white),
                          ),

                         /*  CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(Icons.add,color:AppColors.white),
                          ),
                         */
                         
                        ],
                      ),
                    ),
                  if (product.isSpecial)
                  Positioned(
                    top: -8,
                    left: -8,
                    child: Transform.rotate(
                      angle: -0.12,
                      child: Image.asset("assets/images/offerchart.png",
                      filterQuality: FilterQuality.high
                      ,),
                                    
                              )
                            )

                             
                  ],
                ), );
            }
             ),
             ),


             ElevatedButton(
               onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> CityMall(),
               ),               
             );
             },
              child:Text("السوق التالي",
              style: TextStyle(
                color: AppColors.deepBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                
              ),
             )
           )
        ],
      ),

    );
  }
}

*/
 

  

  
