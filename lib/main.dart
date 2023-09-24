import 'package:flutter/material.dart';
// Hafiz

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListPage(),
    );
  }
}

class Product {
  late final String name;
  late final double price;
  late int quantity;
  bool isBuy = false;

  Product(this.name, this.price, this.quantity);
}

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> products = [
    Product('T-shirt', 15.99, 0),
    Product('Jeans', 29.99, 0),
    Product('Hoodie', 24.50, 0),
    Product('Dress Shirt', 19.99, 0),
    Product('Skirt', 18.75, 0),
    Product('Sweatpants', 22.99, 0),
    Product('Jacket', 34.99, 0),
    Product('Shorts', 12.99, 0),
    Product('Blouse', 27.50, 0),
    Product('Sweater', 26.50, 0),
    Product('Coat', 39.99, 0),
    Product('Polo Shirt', 17.50, 0),
    Product('Leggings', 16.99, 0),
    Product('Suit', 79.99, 0),
    Product('Tank Top', 10.50, 0),
    Product('Cardigan', 32.50, 0),
    Product('Trousers', 22.50, 0),
    Product('Jumpsuit', 28.99, 0),
    Product('V-neck Sweater', 23.50, 0),
    Product('Blazer', 37.50, 0),
  ];

  customShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulation!'),
          content: Text('You\'ve bought 5 products'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            )
          ],
        );
      },
    );
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List'), centerTitle: true),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = products[index];

            return ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              trailing: Column(
                children: [
                  Text('Count: ${product.quantity}'),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        product.quantity++;
                        setState(() {});
                        if (product.quantity == 5) {
                          customShowDialog(context);
                        }
                        if (product.isBuy == false) {
                          product.isBuy = true;
                          count++;
                          // print(count);
                        }
                      },
                      child: Text('Buy Now'),
                    ),
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CartPage(
                      itemBought: count.toString(),
                    )),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final String itemBought;
  const CartPage({super.key, required this.itemBought});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Total Products $itemBought',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
