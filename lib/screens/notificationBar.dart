import 'package:ehtiaji/models/offers.dart';
import 'package:ehtiaji/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Notificationbar extends StatefulWidget {
  const Notificationbar({super.key,required this.offers});
   final List offers;


  @override
  State<Notificationbar> createState() => _NotificationbarState();
}
List<Offers> offers = [



  Offers(
    mallName: " العروض بين يديك 24/7  ",
    image:'assets/images/card.png', 
    discountType: "خصومات تصل الى 90%" ,
    discountAmount:"90%",

    ),
  Offers(
    mallName: "سامح مول ",
    image:'assets/images/offers.png' , 
    discountType: "خصم اليوم الوطني 50% ",
    discountAmount: "50%",
    ),
    Offers(
    mallName: "العقرباوي مول ",
    image:'assets/images/sales.png', 
    discountType: "خصومات الجمعة السوداء ",
    discountAmount:"20%",
    ),
    Offers(
    mallName: "ميكا مول",
    image:'assets/images/blackfriday.png', 
    discountType: "خصم السنة الجديدة ",
    discountAmount:"70%",
    ),
    
];

class _NotificationbarState extends State<Notificationbar> {
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.offers.length,
        itemBuilder:(context , index) {
          final offer = widget.offers[index];
          return Container(
            width: 300,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
            color:AppColors.deepBlue,
            borderRadius: BorderRadius.circular(19)
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 28,
                  right: 10,
                  bottom: 5,
                   child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                    offer.image,
                    //width: ,
                    //height: ,
                  ),
                ),
                ),
                 
                Positioned(
                  top: 10,
                  right: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                    horizontal:5, vertical: 5),
                    child: Text(
                      textAlign: TextAlign.center,
                      offer.mallName,
                      style: const TextStyle(color:AppColors.white,fontSize: 15,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                 Positioned(
                  bottom:20,
                  left: 15,
                  child: Container(
                   width: 95 ,
                   height: 95,
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color:AppColors.collGray,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      offer.discountType,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color:AppColors.deepBlue,fontSize: 15,
                      fontWeight: FontWeight.bold),
                    ),
                  ),
                ),



              ],
            ),
          );
        }
        ),
     
    ) ;
  }
}