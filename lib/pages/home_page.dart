import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hair_salon_app/pages/user_page.dart';
import 'package:hair_salon_app/widget/category_service.dart';
import '../utils/colors.dart';
import '../widget/ad_service.dart';
import '../widget/bottom_navigation.dart';
import '../widget/features_service.dart';
import '../widget/homeApp_bar.dart';
import '../widget/popular_service.dart';
import 'calendar_page.dart';
import 'category_page.dart';
import 'messenger_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _selectedIndex == 0 ? const HomeAppBar() : null,
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ListView(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.06,
                        child: Container(
                          width: width * .9,
                          decoration: BoxDecoration(
                            border: Border.all(color: white),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.search, color: Colors.grey),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    fillColor: Colors.grey,
                                    border: InputBorder.none,
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          "assets/images/filter.png",
                                          width: width * 0.05,
                                          height: height * 0.08,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                  onChanged: (value) {
                                    // Handle search
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.007,
                      ),
                      // Ad Service
                      const AdService(),
                      // UI for featured services
                      SizedBox(
                        height: height * 0.03,
                      ),
                      const FeatureService(),
                      // ui for category
                      const CategoryService(),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        height: height * 0.5,
                        child: const PopularServiceList(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const CategoryPage(),
          const CalendarPage(),
          const MessengerPage(),
          const UserPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onTabTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}