import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class PopularServiceList extends StatefulWidget {
  const PopularServiceList({Key? key,}) : super(key: key);

  @override
  State<PopularServiceList> createState() => _PopularServiceListState();
}

class _PopularServiceListState extends State<PopularServiceList> {
  Map<int, bool> bookmarkStates = {};
  // for most popular services section
  int selectedCategory = 0;
  List<String> categories = [
    "All",
    "Haircuts",
    "Make up",
    "Manicure",
    "Business",
    "Techno",
  ];
  List<Map<String, dynamic>> popularServices = [
    {
      "name": "Tanishk Unisex salon",
      "subtitle": "Janakpuri, New Delhi",
      "additionalText": "1.2km",
      "image":
      "https://thumbs.dreamstime.com/b/men-hair-salon-man-barber-doing-hairstyle-barbershop-men-hair-salon-man-barber-doing-hairstyle-barbershop-handsome-male-121117324.jpg",
    },
    {
      "name": "Royal Touch Salon",
      "subtitle": "Tilak Nagar, New Delhi",
      "additionalText": "800m",
      "image": "https://media.smallbiztrends.com/2019/03/Hair-Salon.png",
    },
    {
      "name": "Hair Direction Salon",
      "subtitle": "Tilak Nagar, New Delhi",
      "additionalText": "900m",
      "image":
      "https://tse1.mm.bing.net/th?id=OIP.LrTGszOcp1cC6BGifjNycgHaE8&pid=Api&P=0&h=180",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Widget makeCategory({required String title, required int index}) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            width: width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: selectedCategory == index ? darkblue : Colors.grey[200],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: selectedCategory == index ? Colors.white : darkblue,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              "Most Popular Services",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          SizedBox(
            height: height * 0.06,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => makeCategory(
                title: categories[index],
                index: index,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: popularServices.length,
              itemBuilder: (context, index) {
                String serviceImage = popularServices[index]["image"];
                String serviceName = popularServices[index]["name"];
                String serviceSubtitle = popularServices[index]["subtitle"];
                String serviceAdditionalText =
                popularServices[index]["additionalText"];

                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.grey[100],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(
                              serviceImage,
                              height: 140,
                              width: 123,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  child: const Center(
                                    child: Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.grey[100],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        serviceName,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            bookmarkStates[index] =
                                            !(bookmarkStates[index] ??
                                                false);
                                          });
                                        },
                                        child: Image.asset(
                                          "assets/images/bookmark.png",
                                          height: height * 0.03,
                                          width: width * 0.1,
                                          color: bookmarkStates[index] ?? false
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.002,
                                  ),
                                  Text(
                                    serviceSubtitle,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: height * 0.009,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_pin,
                                        color: darkblue,
                                        size: 20,
                                      ),
                                      Text(
                                        serviceAdditionalText,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.009,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade600,
                                        size: 22,
                                      ),
                                      const Text(
                                        "4.8 |  256 Reviews",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
