import 'package:flutter/material.dart';
import 'package:flutter_qualif_vc/models/product.dart';
import 'package:flutter_qualif_vc/widgets/product_card.dart';


class ItemsPage extends StatefulWidget {
  final String? username;
  const ItemsPage({super.key, this.username});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {

  final List<Product> products = [
     Product(title: "Americano", imageUrl: "assets/product_carousel/americano.jpg", description: "Hot/Iced", price: 2.00),
     Product(title: "Cappucino", imageUrl: "assets/product_carousel/cappucino.jpg", description: "Hot", price: 4.00),
     Product(title: "Espresso", imageUrl: "assets/product_carousel/espresso.jpg", description: "Hot", price: 1.00),
     Product(title: "Latte", imageUrl: "assets/product_carousel/latte.jpg", description: "Hot/Iced", price: 3.00),
  ];

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height; 
    
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, top: 60),
              child: Text(
                "Hey, ${widget.username}!",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900
                )
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: const Text(
                "Enlighten your day with a cup of coffee!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300
                )
              ),
            ),
            Center(
              child: Container(
                width: screenWidth * 0.93,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for beverages or drinks',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: const Text(
                "Coffee",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800
                )
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: screenHeight * 0.4),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true, // Important
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6, // Adjust as per your design
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    title: products[index].title,
                    imageUrl: products[index].imageUrl,
                    description: products[index].description,
                    price: products[index].price,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}