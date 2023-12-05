import 'package:flutter/material.dart';

import '../pages/category_page.dart';
import '../utils/colors.dart';


class CategoryService extends StatefulWidget {
  const CategoryService({super.key});

  @override
  State<CategoryService> createState() => _CategoryServiceState();
}

class _CategoryServiceState extends State<CategoryService> {
  List<String> imageNames = [
    "Hair Cut",
    "Makeup",
    "Straightening",
    "Mani-pedi",
    "Spa/Message",
    "Beard Trimming",
  ];

  List<Map<String, dynamic>> getImagePaths = [
    {"id": 1, "getImagePath": "assets/category/barbershop.png"},
    {"id": 2, "getImagePath": "assets/category/beauty.png"},
    {"id": 3, "getImagePath": "assets/category/hair-straightener.png"},
    {"id": 4, "getImagePath": "assets/category/nail.png"},
    {"id": 5, "getImagePath": "assets/category/massage.png"},
    {"id": 6, "getImagePath": "assets/category/beard-trimming.png"},
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "Category",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryPage()),
                  );
                },
                child: const Text(
                  "View All",
                  style: TextStyle(
                    color: lighblue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
            width: width * 1,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 24.0,
                  mainAxisExtent: 130),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: width *
                            0.5, // Set this to ensure the container takes all available width
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey[100],
                        ),
                        child: Center(
                          child: Image.asset(
                            getImagePaths[index]["getImagePath"],
                            height: height * 0.09,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      imageNames[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
