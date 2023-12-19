import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<Product> _wishlist = [];

  // List of available products
  List<Product> _availableProducts = [
    Product(name: 'Product A', price: 15.0),
    Product(name: 'Product B', price: 20.0),
    Product(name: 'Product C', price: 10.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: _buildWishlist(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToProductList(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildWishlist() {
    if (_wishlist.isEmpty) {
      return Center(
        child: Text('Your wishlist is empty.'),
      );
    } else {
      return ListView.builder(
        itemCount: _wishlist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_wishlist[index].name),
            subtitle: Text('\$${_wishlist[index].price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                _removeFromWishlist(index);
              },
            ),
          );
        },
      );
    }
  }

  void _removeFromWishlist(int index) {
    setState(() {
      _wishlist.removeAt(index);
    });
  }

  void _navigateToProductList(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductListPage(_availableProducts)),
    );

    if (result != null && result is Product) {
      setState(() {
        _wishlist.add(result);
      });
    }
  }
}

class ProductListPage extends StatelessWidget {
  final List<Product> availableProducts;

  ProductListPage(this.availableProducts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Products'),
      ),
      body: ListView.builder(
        itemCount: availableProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(availableProducts[index].name),
            subtitle:
                Text('\$${availableProducts[index].price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pop(context, availableProducts[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
