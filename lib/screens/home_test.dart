import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_project/screens/main_page.dart';
import 'package:my_project/screens/product_details_page.dart';
import 'package:my_project/screens/profile_page.dart';
import 'package:my_project/screens/settings_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeTestPage extends StatefulWidget {
  const HomeTestPage({super.key});

  @override
  State<HomeTestPage> createState() => _HomeTestPageState();
}

class _HomeTestPageState extends State<HomeTestPage> {
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
  CarouselController carouselController = CarouselController();
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            width: 400,
            height: 80,
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
        ],
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
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CarouselSlider(
                items: imgList.map((item) {
                  return SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 500),
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2.0,
                  viewportFraction: 1,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
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
                    color: currentIndex == entry.key ? Colors.red : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(
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
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.height,
              height: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: shoeNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailsPage();
                        },
                      ));
                    },
                    child: Card(
                      elevation: 2,
                      color: Colors.white,
                      child: SizedBox(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10)),
                              child: SizedBox(
                                width: double.infinity,
                                height: 130,
                                child: Image.asset(
                                  shoeImages[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              shoeNames[index],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              shoeName2[index],
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              shoePrice[index],
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ]),
      ]),
    );
  }
}
