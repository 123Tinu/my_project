import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home_page.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  final cartKey = GlobalKey<FormState>();
  List<String> sizes = ['6', '7', '8', '9', '10', "11"];
  int selectedSizeIndex = -1;
  bool isFavorite = false;
  final List<String> productImages = [
    'assets/images1/nikepr1.webp',
    'assets/images1/nikepr2.webp',
    "assets/images1/nikepr3.webp",
    "assets/images1/nikepr4.webp",
    "assets/images1/nikepr5.webp",
    "assets/images1/nikepr6.webp"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double halfWidth = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
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
        actions: [
          IconButton(
            icon:
            const Icon(Icons.shopping_cart, size: 30, color: Colors.black),
            onPressed: () {
              // Handle "Add to Cart" icon tapped
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text("Nike",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text("Nike Air Force 1 '07",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    )),
              ],
            ),
            SizedBox(
              height: 2,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
                Icon(
                  Icons.star_half,
                  color: Colors.orangeAccent,
                ),
                Icon(
                  Icons.star_border,
                  color: Colors.orangeAccent,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Stack(alignment: Alignment.topRight, children: [
              CarouselSlider(
                items: productImages.map((item) {
                  return Center(
                    child: Image(
                        image: AssetImage(
                          productImages[currentIndex],
                        ),
                        fit: BoxFit.cover,
                        width: size.width,
                        height: size.height),
                  );
                }).toList(),
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  height: 500,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 30,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: productImages.asMap().entries.map((entry) {
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
                      color:
                          currentIndex == entry.key ? Colors.red : Colors.grey,
                    ),
                  ),
                );
              }).toList(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 10),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 0;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                      image: AssetImage(productImages[0]),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: AssetImage(productImages[1]),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 2;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                    image: AssetImage(productImages[2]),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 3;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                      image: AssetImage(productImages[3]),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 4;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                      image: AssetImage(productImages[4]),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = 5;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                      image: AssetImage(productImages[5]),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.95, 0),
              child: Text("₹ 8195.00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment(-0.95, 0),
              child: Text("Size-Uk/India",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                    color: Colors.black,
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  SizedBox(
                    height: 50.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSizeIndex = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Stack(
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 48.0,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: selectedSizeIndex == index
                                            ? Colors.red
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      child: Center(
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          sizes[index],
                                          style: TextStyle(
                                            color: selectedSizeIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 16.0,
                                          ),
                                        ),
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
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Text("Product Details",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "The radiance lives on in the Nike Air Force 1 '07, the basketball original that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Container(
            width: halfWidth,
            height: 55,
            color: Colors.white,
            child: TextButton(
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: "Added To Cart",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    fontSize: 16.0,
                    backgroundColor: Colors.grey,
                  );
                },
                child: const Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.black, fontSize: 23),
                )),
          ),
          Container(
            width: halfWidth,
            height: 55,
            color: Colors.black,
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Buy now",
                  style: TextStyle(color: Colors.white, fontSize: 23),
                )),
          ),
        ]),
      ),
    );
  }
}
