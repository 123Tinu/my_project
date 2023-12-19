import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<String> sizes = ['6', '7', '8', '9', '10', "11"];
  int selectedSizeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showSizeSelectionBottomSheet(context);
          },
          child: Text('Select Size'),
        ),
      ),
    );
  }

  void _showSizeSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200, // Set the height as per your requirement
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                'Select Size',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                                    borderRadius: BorderRadius.circular(25.0),
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
        );
      },
    );
  }

  Widget _buildSizeTile(String size, BuildContext context) {
    return ListTile(
      title: Text(
        size,
        style: TextStyle(fontSize: 16),
      ),
      onTap: () {},
    );
  }
}
