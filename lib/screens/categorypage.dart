import 'package:ehtiaji/models/Category.dart';
import 'package:ehtiaji/utils/colors.dart';
import 'package:flutter/material.dart';

class Categorypage extends StatefulWidget {
  final int mallId;

  const Categorypage({
    super.key,
    required this.mallId,
  });

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
      image: "assets/images/chocolate.png",
      mallId: 1,
    ),
    Category(
      categoryId: 2,
      categoryName: "ألبان وأجبان",
      image: "assets/images/chocolate.png",
      mallId: 1,
        ),
    Category(
      categoryId: 3,
      categoryName: "لحوم ودجاج",
      image: "assets/images/chocolate.png",
      mallId: 2
    ),
    Category(
      categoryId: 4,
      categoryName: "مشروبات",
      image: "assets/images/chocolate.png",
      mallId: 3
    ),
    Category(
      categoryId: 5,
      categoryName: "معلبات",
      image: "assets/images/chocolate.png",
      mallId: 4
    ),
    Category(
      categoryId: 5,
      categoryName: "منظفات",
      image: "assets/images/chocolate.png",
      mallId: 4
    ),
  ];
 

    List<Category> get filteredCategories {
    return categories
        .where((c) => c.mallId == widget.mallId)
        .toList();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [

          const SizedBox(height: 30),

          Text(
            "الفئات",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.deepBlue,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {

                final cat = filteredCategories[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [

                      Image.asset(
                        cat.image,
                        width: 60,
                        height: 60,
                      ),

                      const SizedBox(height: 10),

                      Text(cat.categoryName),
                    ],
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