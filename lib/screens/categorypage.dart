import 'package:ehtiaji/models/Category.dart';
import 'package:ehtiaji/screens/aqrabawi.dart';
import 'package:ehtiaji/screens/city.dart';
import 'package:ehtiaji/screens/micca.dart';
import 'package:ehtiaji/screens/samih.dart';
import 'package:ehtiaji/screens/topbar.dart';
import 'package:ehtiaji/utils/colors.dart';
import 'package:flutter/material.dart';

class Categorypage extends StatefulWidget {
  final int mallId;

const Categorypage(this.mallId, {super.key});
  

  @override
  State<Categorypage> createState() =>
      _CategorypageState();
}

class _CategorypageState
    extends State<Categorypage> {

  // بيانات وهمية (لاحقًا من API)
  List<Category> categories = [
    Category(
      categoryId: 1,
      categoryName: "خضار وفواكه",
      image: "assets/images/vegetable.png",
      mallid: 2
    ),
    Category(
      categoryId: 2,
      categoryName: "ألبان وأجبان",
      image: "assets/images/milks2.png",
      mallid: 3
        ),
    Category(
      categoryId: 3,
      categoryName: "لحوم ودجاج",
      image: "assets/images/meats.png",
      mallid: 4
      
    ),
    Category(
      categoryId: 4,
      categoryName: "مشروبات",
      image: "assets/images/juices.png",
      mallid: 2
      
    ),
    Category(
      categoryId: 5,
      categoryName: "مواد غذايئة" ,
      image: "assets/images/foodstuffs.png",
      mallid: 3
      
    ),
    Category(
      categoryId: 6,
      categoryName: "منظفات",
      image: "assets/images/cleanner2.png",
      mallid: 1
          ),

           Category(
      categoryId: 7,
      categoryName: "مخبوزات",
      image: "assets/images/baked2.png",
      mallid: 3
          ),

           Category(
      categoryId: 8,
      categoryName: "حلويات وسناكات",
      image: "assets/images/sweets.png",
      mallid: 4
          ),
  ];
 

   


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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

    ),
  ),
      body: Column(
        children: [

          const SizedBox(height: 30),

          Text(
            "الأقسام",
            style: TextStyle(
              fontSize: 25,
              color: AppColors.deepBlue,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate:
                   SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > 900 ? 4:2,
                childAspectRatio: 1.2,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {

              final cat = categories[index];

return  InkWell(
           
onTap: () {
  if (widget.mallId == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MiccaMall(
          categoryId: cat.categoryId,
        ),
      ),
    );
  }





   if (widget.mallId == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CityMall(
          categoryId: cat.categoryId,
        ),
      ),
    );
  }



   if (widget.mallId ==3) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Aqrabawi(
          categoryId: cat.categoryId,
        ),
      ),
    );
  }



    if (widget.mallId == 4) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SamihMall(
          categoryId: cat.categoryId,
        ),
      ),
    );
  }


 


},

    
   
   child: Card(
    color: AppColors.white,
    margin: const EdgeInsets.all(12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          cat.image,
          width: width > 900 ? 120 : 90,
          height:100,
          fit:BoxFit.contain,
          filterQuality: FilterQuality.high,
        ),

        const SizedBox(height: 4),

        Text(
          cat.categoryName,
          style:  TextStyle(
            color:AppColors.deepBlue,
            fontSize: width > 900 ? 25: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
);

              },
            ),
          ),
        ],
      ),
    );
  }
}