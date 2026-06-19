import 'package:ehtiaji/screens/nav-bottom-bar.dart';
import 'package:ehtiaji/utils/colors.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());

}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:AppColors.collGray  
     ),
         home : BottomBar(),
         builder: (context,child){
          return Directionality(
            textDirection: TextDirection.rtl, 
            child: child!);
            // study direction code
         }, 
     );
    
  }
}