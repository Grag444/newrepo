import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Grid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductGridScreen(),
    );
  }
}

class ProductGridScreen extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Backpack', description: 'Your perfect pack for everyday use and walks in', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfaWgr60SvFL9zDqGhvQ2YpCYkylHBu7siOA&s'),
    Product(name: 'Mens Casual tshirt', description: 'Slim fitting style contrast raglan long sleeve', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSQ9OnMkJe0N57BZg3DLz_BSJy4XYsXrl4cQ&s'),
    Product(name: 'Mens Cotton Jacket', description: 'Great outerwear jackets for Spring/Autumn', imageUrl: 'https://m.media-amazon.com/images/I/8115qruvmLL.AC_SL1500.jpg'),
    Product(name: 'Mens Casual bracelet', description: 'The color could be slightly different between', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbyEdudWlsh15oFL64yofcpvpb18XOesbe_w&s'),
    Product(name: 'watch', description: 'From our Legends Collection', imageUrl: 'https://m.media-amazon.com/images/I/71fJ8PJ8ooL.AC_UL1500.jpg'),
    Product(name: 'necklace', description: 'Satisfaction Guaranteed.', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNDHLW1SElLL5DgnHd5J4Taw1IEugKFR2wPw&s'),
    Product(name: 'pants', description: 'Classic Created', imageUrl: 'https://i5.walmartimages.com/seo/George-Men-s-Synthetic-Casual-Pants_d200f157-8cdc-411e-a3c0-b840495ed157.723599c2c358b7a467e5e101880d3c82.jpeg'),
    Product(name: 'sneakers', description: 'casual and comfortable', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl6qeFaa4GKCNavRoQpjTvPbj5CwF3nuaaJw&s'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final String imageUrl;

  Product({required this.name, required this.description, required this.imageUrl});
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}