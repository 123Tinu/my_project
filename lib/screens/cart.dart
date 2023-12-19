import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      shoeImages[index],
                      height: 200,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shoeNames[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          shoeName2[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                            height: 5
                        ),
                        Text(
                          shoePrice[index],
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) {
                                    quantity--;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              ' $quantity ',
                              style: TextStyle(fontSize: 16),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
