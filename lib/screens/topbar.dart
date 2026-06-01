import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ehtiaji/utils/colors.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key , required this.notificationCount,
    required this.onNotificationTap,
    required this.height
});


  final int notificationCount;
  final VoidCallback onNotificationTap;
  final double height;

  @override
  Widget build(BuildContext context) {
     final width = MediaQuery.of(context).size.width;
     final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        SvgPicture.asset(
          'assets/svg/topbar.svg',
          width: double.infinity,
          height: height * 0.15,
          fit: BoxFit.fill,
        ),

        Positioned(
          top: 18,
          right: -8,
          child:Image.asset(
            'assets/images/grayicon.png' ,
             width: width * 0.45,
            fit: BoxFit.contain,
          ),
        ),

        Positioned(
          left: 15,
          top: height * 0.03,
          child: GestureDetector(
            onTap:onNotificationTap,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
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