import 'package:flutter/material.dart';
import 'package:my_project/screens/test2.dart';

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> _cartItems = [];

  void addToCart(Product product) {
    setState(() {
      bool found = false;
      for (CartItem item in _cartItems) {
        if (item.product.name == product.name) {
          item.quantity++;
          found = true;
          break;
        }
      }
      if (!found) {
        _cartItems.add(CartItem(product: product, quantity: 1));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product(name: 'Product 1', price: 10.0),
      Product(name: 'Product 2', price: 20.0),
      Product(name: 'Product 3', price: 15.0),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () {
                addToCart(products[index]);
              },
              child: const Text('Add to Cart'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartDetails(_cartItems)),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
