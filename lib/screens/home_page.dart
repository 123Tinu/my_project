import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_project/screens/main_page.dart';
import 'package:my_project/screens/product_details_page.dart';
import 'package:my_project/screens/profile_page.dart';
import 'package:my_project/screens/settings_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_project/screens/widget/banner-widget.dart';
import 'package:my_project/screens/widget/product-list-widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Settings";
  final List<String> shoeNames = [
    'Nike',
    'Adidas Originals',
    'Nike',
    'New Balance',
  ];
  final List<String> shoeName2 = [
    "Nike Air Force 1 '07",
    "Stan Smith Sneakers",
    "Air Jordan 1 Mid",
    "574 Core "
  ];
  final List<String> shoePrice = [
    "₹ 8195.00",
    "₹ 8999.00",
    "₹ 11495.00",
    "₹ 7499.00"
  ];
  final List<String> shoeImages = [
    "assets/images1/nikeaf1.webp",
    "assets/images1/stanadi.webp",
    "assets/images1/nikejordhan.webp",
    "assets/images1/newbalance2.webp"
  ];
  int currentIndex = 0;
  final List<String> imgList = [
    'assets/images1/bg1.jpeg',
    'assets/images1/bg2.jpeg',
    "assets/images1/bg3.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          width: size.width,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                icon: Icon(Icons.search, size: 25, color: Colors.black),
              ),
              onChanged: (value) {},
            ),
          ),
        ),
      ),
      body: ListView(children: [
        Column(children: [
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment(-0.96, 0),
            child: Text(
              "Trending Deals",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const BannerWidget(),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment(-0.96, 0),
            child: Text(
              "All category",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/images1/nike.jpeg")),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Nike")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/images1/adidas.jpeg")),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Adidas"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/images1/puma.jpeg")),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Puma")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/images1/newbalance.jpeg"),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("New Balance")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/images1/converse.jpeg")),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Converse")
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment(-0.96, 0),
            child: Text(
              "Top Selection",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetProductWidget(),
          )
        ]),
      ]),
    );
  }
}
