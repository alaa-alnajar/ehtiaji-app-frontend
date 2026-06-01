import 'package:ehtiaji/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:ehtiaji/screens/topbar.dart';


class Locationpage extends StatelessWidget {
  const Locationpage({super.key});

  @override
  Widget build(BuildContext context) {

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
    ),
  ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // الصورة العلوية
              Stack(
                children: [

                  Container(
                    margin: const EdgeInsets.all(16),

                    width: double.infinity,
                    height: height * 0.28,

                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(25),

                      child: Image.asset(
                        "assets/images/marketimag.jpg",

                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 30,
                    left: 30,

                    child: ElevatedButton.icon(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.location_on,
                      ),

                      label: const Text(
                        "عرض على الخريطة",
                      ),

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:AppColors.white,

                        foregroundColor:
                            AppColors.deepBlue,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                            20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // الكروت
              ListView.builder(
                shrinkWrap: true,

                physics:
                    const NeverScrollableScrollPhysics(),

                itemCount: 3,

                itemBuilder: (context, index) {

                  return mallCard(
                    number: "${index + 1}",

                    title: index == 0
                        ? "سامح مول"
                        : index == 1
                            ? "العقرباوي مول "
                            : "ميكا مول",

                    distance: index == 0
                        ? "0.5 كم"
                        : index == 1
                            ? "1.2 كم"
                            : "1.8 كم",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mallCard({
    required String number,
    required String title,
    required String distance,
  }) {

    return Card(
      color:AppColors.white,
      elevation: 0,

      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            // الجزء العلوي
            Row(
              children: [

                CircleAvatar(
                  radius: 22,

                  backgroundColor:
                      AppColors.deepBlue,

                  child: Text(
                    number,

                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Text(
                        title,

                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        "شارع السعادة - الزرقاء",

                        style: TextStyle(
                          color: Color.fromARGB(202, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),

                Text(
                  distance,

                  style: TextStyle(
                    color: AppColors.deepBlue,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ],
            ),

            const Divider(height: 30),

            // الأزرار
            Row(
              children: [
                Icon(Icons.timer,
                color:Color.fromARGB(255, 105, 105, 103)
                ),

                Text("الظهر- 12:30",
                style: TextStyle(
                ),
                ),
                SizedBox(width: 30,),

                Icon(Icons.call,
                color:Color.fromARGB(255, 105, 105, 103)),
                Text("اتصال",
                style: TextStyle(
                ),
                ),
                
                Spacer(),

                SizedBox(
                 
                 height: 40,
                 child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on),
                  label: const Text("توجيه"),
                  style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.deepBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 10,
                    ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
      ),
    ),
  ),
)


                      

                

                      
                  
                
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}