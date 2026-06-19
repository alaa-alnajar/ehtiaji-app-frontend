import 'package:ehtiaji/models/cart.dart';
import 'package:ehtiaji/screens/aqrabawi.dart';
import 'package:ehtiaji/screens/categorypage.dart';
import 'package:ehtiaji/screens/city.dart';
import 'package:ehtiaji/screens/intent_to_buy.dart';
import 'package:ehtiaji/screens/nav-bottom-bar.dart';
import 'package:ehtiaji/screens/topbar.dart';
import 'package:flutter/material.dart';
import 'package:ehtiaji/utils/colors.dart';
import 'package:ehtiaji/models/product-info.dart';


class MiccaMall extends StatefulWidget {
  final int categoryId;
  
  const MiccaMall({super.key,
  required this.categoryId});
  

  @override
  State<MiccaMall> createState() => _MiccaMallState();
}

class _MiccaMallState extends State<MiccaMall> {
  

List<Product> products = [
  Product(productId:1,productName: " شكولاتة",description:"شكولاتة: شوكولاتة بالحليب 100 غرام", price: 2.00,priceAfterDiscount:1.80, 
  image: "assets/images/chocolate.png",stockQuantity:10,isAvailable:true ,categoryId:8,mallId: 1),

  Product(productId:1,productName: "زيت العافية",description:"  زيت ذرة العافية 1.8 لتر .", price: 2.30,priceAfterDiscount:1.84,
  image: "assets/images/oil.png",stockQuantity:10, isAvailable:true ,categoryId:7,mallId: 1),

  Product(productId:2,productName: "جبنة سائلة",description:"جبنة سائلة قابلة للدهن 500 غرام.", price: 3.50,priceAfterDiscount:2.80, 
  image: "assets/images/chesse.png",stockQuantity:10,isAvailable:true ,categoryId:2,mallId: 1),

  Product(productId:3,productName: "لبن ", description:": لبن بقري طازج 0.25 لتر",price: 0.30, priceAfterDiscount:0.24,
  image: "assets/images/yogurt.png",stockQuantity:10, isAvailable:true ,categoryId:2,mallId: 1),

  Product(productId:4,productName: "أرز مصري",description:"أرز مصري فاخر 5 كغم", price: 5.50,priceAfterDiscount:4.40, 
  image: "assets/images/rice.png", stockQuantity:10,isAvailable:true ,categoryId:5,mallId: 1),

  Product(productId:5,productName: " موز 1 كغ", description:"موز صومالي مستورد.",price: 2.30,priceAfterDiscount:1.84,
   image: "assets/images/banana.png", stockQuantity:10,isAvailable:true ,categoryId:1,mallId: 1),

  Product(productId:6,productName: "ليمون 1 كغ",description:"ليمون بلدي أردني", price: 3.00,priceAfterDiscount:2.40, 
  image: "assets/images/lemon.png",stockQuantity:10,isAvailable:true ,categoryId:1,mallId: 1),
   
];



List<Product> get filteredProducts {
  return products.where((p) {
    return p.mallId == 1 &&
           p.categoryId ==widget.categoryId;
  }).toList();
}
 
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
      isHome:false ,
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
            'ميكا مول',

            style: TextStyle(
              fontSize: 25,
              
              fontWeight: FontWeight.bold,
              color: AppColors.deepBlue,

            ),
          ),
          ),
          SizedBox(width:200),
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

              itemCount: filteredProducts.length,

              itemBuilder: (context, index) {

                final product = filteredProducts[index];

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

                       child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: AppColors.white,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [

                                    Image.asset(product.image, height: 100),

                                    const SizedBox(height: 10),

                                    Text(
                                      product.productName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    Text(product.description,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),),

                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(product.image),
                  )
                  )
                                        
                              
                            ),

                            Column(

                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [

                                Text(

                                  product.productName,

                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.collGray,
                                  ),
                                ),

                                
                                const SizedBox(height: 10),

          if (product.priceAfterDiscount < product.price)
            Row(
              children: [

                Text(
                  "${product.priceAfterDiscount.toStringAsFixed(2)} د.أ",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(width: 8),

                Text(
                  "${product.price.toStringAsFixed(2)} د.أ",
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness:4
                  ),
                ),
              ],
            )
          else
            Text(
              "${product.price.toStringAsFixed(2)} د.أ",
              style: TextStyle(
                fontSize: 18,
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

                      if (product.priceAfterDiscount < product.price)

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
                        
                        Text("") 
                    ],
                  ),
                );
              },
            ),
          ),




          ElevatedButton(
               onPressed: (){
               Navigator.push(context, MaterialPageRoute(
                builder: (context)=> CityMall(categoryId: widget.categoryId,), 
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











  

