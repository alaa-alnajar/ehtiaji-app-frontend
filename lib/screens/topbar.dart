import 'package:ehtiaji/screens/home_page.dart';
import 'package:ehtiaji/screens/nav-bottom-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ehtiaji/utils/colors.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key ,
    required this.notificationCount,
    required this.onNotificationTap,
    required this.height,
    this.isHome= false,
    this.isIntent = false,



});



  final int notificationCount;
  final VoidCallback onNotificationTap;
  final double height;
  final bool isHome;
  final bool isIntent;


  @override
  Widget build(BuildContext context) {
     final width = MediaQuery.of(context).size.width;
     final height = MediaQuery.of(context).size.height;

            return Stack(
              children: [
            width > 400
        ?
        Container(
          height: 100,
          width: double.infinity,
          color: AppColors.deepBlue,
        )
        :
        SvgPicture.asset(
          'assets/svg/topbar.svg',
          width: double.infinity,
          height: height * 0.15,
          fit: BoxFit.fill,
        ),
       if(isHome)
        Positioned(
          top: 12,
          right: -8,
          child:Image.asset(
            'assets/images/grayicon.png' ,
             width:width > 400 ? 180 : width * 0.45,
            fit: BoxFit.contain,
          ),
        ),

        if(!isHome)
          Positioned(
            top: 20,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.collGray,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                            onPressed: () {
                                          if(isIntent){

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomBar(),
                  ),
                );

              } else {

                Navigator.pop(context);

              }
                                        },
                icon: Icon(
                  Icons.arrow_forward,
                  color: AppColors.deepBlue,
                ),
              ),
            ),
          ),





         Positioned(
          left: 15,
          top: 20,
          child: GestureDetector(
            onTap:onNotificationTap,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.collGray,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.notifications,
                    color: AppColors.deepBlue,
                    size: 30,
                  ),
                ),

                if (notificationCount > 0)
                  Positioned(
                    top: -5,
                    right: -5,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                         notificationCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}