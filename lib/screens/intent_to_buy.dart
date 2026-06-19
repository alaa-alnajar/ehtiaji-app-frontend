import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ehtiaji/models/cart.dart';
import 'package:ehtiaji/models/shoppinglistitem.dart';
import 'package:ehtiaji/screens/nav-bottom-bar.dart';
import 'package:ehtiaji/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:ehtiaji/screens/topbar.dart';



class IntentToBuy extends StatefulWidget {
  const IntentToBuy({super.key});

  @override
  State<IntentToBuy> createState() =>
      _IntentToBuyState();
}

class _IntentToBuyState
    extends State<IntentToBuy> {

  @override
  Widget build(BuildContext context) {

    int totalItems = 0;

    double totalPrice = 0;

    for (var item in Cart.items) {

      totalItems +=item.quantity;
      
      totalPrice +=
          (item.product.price) *
          item.quantity;
    }


      //backgroundColor: AppColors.collGray,
String updateText = "";

if (Cart.lastUpdate != null) {
  updateText =
      "${Cart.lastUpdate!.day}/${Cart.lastUpdate!.month}/${Cart.lastUpdate!.year} "
      "${Cart.lastUpdate!.hour}:${Cart.lastUpdate!.minute}";
}
      return Scaffold(
   appBar: PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: Topbar(
      notificationCount: 5,
      onNotificationTap: () {
       print('notifications');
      },
      height: 1,
      isHome: false,
      isIntent: true,


    ),
  ),

      body:   Column(

  children: [

    Expanded(

      child: ListView.builder(

        itemCount: Cart.items.length,

        itemBuilder: (context, index) {

          final item = Cart.items[index];
          double itemTotal=(item.product.priceAfterDiscount)* item.quantity;

          return Container(

            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),

            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(

              color: AppColors.deepBlue,

              borderRadius:
                  BorderRadius.circular(20),
            ),

            child: Row(

              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                Container(

                  width: 70,
                  height: 70,

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
              Image.asset(
                item.product.image,
                height: 100,
              ),
                                   SizedBox(height: 10),
                                    Text(
                                     item.product.productName,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),

                                    const SizedBox(height: 5),

                                    Text(item.product.description,
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
  child: Image.asset(
    item.product.image,
  ),
),
),
 
                Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                      if (item.product.priceAfterDiscount < item.product.price)
            Row(
              children: [

                Text(
                  "${item.product.priceAfterDiscount.toStringAsFixed(2)} د.أ",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(width: 8),

                Text(
                  "${item.product.price.toStringAsFixed(2)} د.أ",
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
              "${item.product.price.toStringAsFixed(2)} د.أ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.collGray,
              ),
            ),


                                    ],
                            ),

                  
                

                Row(

                  children: [

                    CircleAvatar(

                      radius: 18,

                      backgroundColor:
                          const Color.fromARGB(137, 190, 38, 27),

                      child: IconButton(

                        padding: EdgeInsets.zero,

                        onPressed: () {

                          setState(() {

                            Cart.removeProduct(
                              item.product,
                            );
                          });
                        },

                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),

                    Padding(

                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),

                      child: Text(

                        item.quantity.toString(),

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    CircleAvatar(

                      radius: 18,

                      backgroundColor:
                          Colors.green,

                      child: IconButton(

                        padding: EdgeInsets.zero,

                        onPressed: () {

                          setState(() {

                            item.quantity++;
                            


                          });
                        },

                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                
                Column(
                  children: [
                  const Text("الأجمالي",
                  style: TextStyle(
                  color:AppColors.white,
                  fontWeight: FontWeight.bold,

                    fontSize: 15,
                  ),),
                  SizedBox(height: 5,),
                  Text("${itemTotal.toStringAsFixed(2)} د.أ",
                  style: TextStyle(
                  color:AppColors.white,
                  fontSize: 15)
                  ),
                ],)
                                      
                      

              ],
            ),
          );
        },
      ),
    ),

    Container(

      margin: const EdgeInsets.all(15),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: AppColors.deepBlue,

        borderRadius:
            BorderRadius.circular(25),
      ),

      child: Column(

        children: [
        
          Row(

            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              Row(

                children: [

                  const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),

                  const SizedBox(width: 5),

                  const Text(

                    " عدد المنتحات ",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Text(

                totalItems.toString(),

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(

            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              const Text(

                "السعر الكلي",

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),

              Text(
              
                "${totalPrice.toStringAsFixed(2)} د.أ",

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          SizedBox(height: 10,),

            Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "آخر تحديث: $updateText",
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ],
      ),
    ),

  ],
        
),
      );
       
      
      
      

}
    }