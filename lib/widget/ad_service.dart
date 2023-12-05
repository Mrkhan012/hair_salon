import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AdService extends StatefulWidget {
  const AdService({super.key});

  @override
  State<AdService> createState() => _AdServiceState();
}

class _AdServiceState extends State<AdService> {
  List<Map<String, dynamic>> imageList = [
    {"id": 1, "image_path": "assets/images/slider1.jpg"},
    {"id": 2, "image_path": "assets/images/slider2.jpg"},
    {"id": 3, "image_path": "assets/images/slider3.jpg"},
  ];

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: CarouselSlider(
                    items: imageList
                        .map(
                          (item) => Image.asset(
                        item["image_path"],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    )
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 2,
                      height: height * 0.3,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(entry.key),
                      child: Container(
                        width: currentIndex == entry.key ? 17 : 7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? lighblue
                              : Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
