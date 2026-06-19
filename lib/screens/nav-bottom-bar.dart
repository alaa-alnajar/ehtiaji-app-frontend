import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ehtiaji/screens/home_page.dart';
import 'package:ehtiaji/screens/intent_to_buy.dart';
import 'package:ehtiaji/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}











class   Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("profile"));
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("profile"));
  }
}





class _BottomBarState extends State<BottomBar> {
    var selectedindex = 0;

    final  pages = [ 
        HomePage(),
        Center(child: Text("ai"),),
        Center(child: Text("ai"),),
        IntentToBuy(),
                  
        

    ];

    Widget buildIcon(Widget icon, int index) {
        bool isSelected = selectedindex == index;

        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected? const Color.fromARGB(255, 89, 121, 184): Colors.transparent,
            shape: BoxShape.circle,
          ),

          child: Transform.translate(
          offset: Offset(0, -3),
         
          child: IconTheme(
            data: IconThemeData(
              color: isSelected? AppColors.deepBlue:AppColors.collGray,
              size: isSelected? 30 : 21
            ), 
            child: icon
            ),
        ),
        );
      }


 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
      body: pages[selectedindex],

     bottomNavigationBar: CurvedNavigationBar(
      color:AppColors.deepBlue,
      buttonBackgroundColor:Color.fromARGB(137, 170, 177, 212),
      backgroundColor: AppColors.collGray,
      height: 60,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 300),
      index: selectedindex,
       items:[
        buildIcon(
        SvgPicture.asset('assets/svg/homee.svg',
        width: 26,
        height: 26,
        color:AppColors.white),0,),

        buildIcon(
        SvgPicture.asset('assets/svg/AI.svg',
        width: 26,
        height: 26,
        color: AppColors.white,),1),

        buildIcon(
        SvgPicture.asset('assets/svg/profile.svg', width: 26,
        height: 26,
        color:AppColors.white),2),

        buildIcon(
        Image.asset('assets/images/favorite.png',color: AppColors.white,),3),
] ,
      onTap:(selectedindex) => setState(() => this.selectedindex = selectedindex  ), 
    ),
      )
      );

      
       








    
             
    
  }
}

