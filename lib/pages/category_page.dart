import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('users').snapshots();
  List<String> imageNames = [
    "Hair Cut",
    "Makeup",
    "Straightening",
    "Mani-pedi",
    "Spa/Message",
    "Beard Trimming",
    "Hair Coloring",
    "Waxing",
    "Facial",
  ];

  List<Map<String, dynamic>> getImagePaths = [
    {"id": 1, "getImagePath": "assets/category/barbershop.png"},
    {"id": 2, "getImagePath": "assets/category/beauty.png"},
    {"id": 3, "getImagePath": "assets/category/hair-straightener.png"},
    {"id": 4, "getImagePath": "assets/category/nail.png"},
    {"id": 5, "getImagePath": "assets/category/massage.png"},
    {"id": 6, "getImagePath": "assets/category/beard-trimming.png"},
    {"id": 7, "getImagePath": "assets/category/hair-dye.png"},
    {"id": 8, "getImagePath": "assets/category/wax.png"},
    {"id": 9, "getImagePath": "assets/category/sheet-mask.png"},
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(height: height * 0.04),
                const Text(
                  "Category",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: height * 0.05),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 30.0,
                    mainAxisSpacing: 50.0,
                    childAspectRatio: 1.0,
                    mainAxisExtent: height * 0.17,
                  ),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.grey[200],
                            ),
                            child: Center(
                              child: Image.asset(
                                getImagePaths[index]["getImagePath"] as String,
                                height: height * 0.08,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
