import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class FeatureService extends StatefulWidget {

  const FeatureService({
    Key? key,
  }) : super(key: key);

  @override
  State<FeatureService> createState() => _FeatureServiceState();
}

class _FeatureServiceState extends State<FeatureService> {

  final CarouselController carouselController = CarouselController();
  final ScrollController scrollController = ScrollController();
  int currentIndex = 0;

  // Sample data for featured services
  List<Map<String, dynamic>> featuredServices = [
    {
      "name": "Beer Trimming",
      "subtitle": "Rs 200",
      "additionalText": "Rs 300",
      "image":
      "https://tse1.mm.bing.net/th?id=OIP.FZBUQFulfkM5oDDk5059CAHaE7&pid=Api&rs=1&c=1&qlt=95&h=180"
    },
    {
      "name": "Hair Straightening",
      "subtitle": "Rs 1000",
      "additionalText": "Rs 2100",
      "image":
      "https://cdn2.stylecraze.com/wp-content/uploads/2020/12/Which-Hair-Straightening-Treatment-Is-Best-For-You.jpg"
    },
    {
      "name": "Eyelashes ",
      "subtitle": "Rs 1000",
      "additionalText": "Rs 2100",
      "image":
      "https://static.thatsup.co/content/img/article/16/feb/har-ar-salongerna-som-ar-bra-pa-ogonfransar-i-stockholm.jpg?1562774385"
    },
    {
      "name": "Hair",
      "subtitle": "Rs 1000",
      "additionalText": "Rs 1700",
      "image": "https://media.timeout.com/images/102210943/image.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  const Text(
                    "Featured Services",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: featuredServices.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () {
                          carouselController.animateToPage(entry.key);
                          setState(() {
                            currentIndex = entry.key;
                          });
                        },
                        child: Container(
                          width: currentIndex == entry.key ? 18 : 8,
                          height: 5.0,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == entry.key
                                ? lighblue
                                : Colors.grey,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 197,
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: featuredServices.length,
              itemBuilder: (context, index) {
                String serviceName = featuredServices[index]["name"];
                String serviceSubtitle = featuredServices[index]["subtitle"];
                String additionalText =
                featuredServices[index]["additionalText"];
                String serviceImage = featuredServices[index]["image"];

                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.network(
                            serviceImage,
                            height: 140,
                            width: width * 0.4,
                            fit: BoxFit.cover,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            serviceName,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: black,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 6),
                              child: Text(
                                serviceSubtitle,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: additionalText,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
