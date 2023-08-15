import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qualif_vc/pages/login_page.dart';
import 'package:flutter_qualif_vc/widgets/product_card_carousel.dart';

class HomePage extends StatefulWidget {
  final String username; // Declare username variable

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<String> carouselImages = [
      "assets/coffee_tomoro_1.png",
      "assets/coffee_tomoro_2.png",
      "assets/coffee_tomoro_3.png"
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 450,
              child: Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      height: 400,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                    ),
                    items: carouselImages.map((url) {
                      return Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage(url),
                            fit: BoxFit
                                .cover, // This will fill the container with the image
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Positioned(
                    top: 370,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        width: screenWidth * 0.95,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hi, ${widget.username}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 3), // Set the padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Set the border radius
                                ),
                              ),
                              child: const Text(
                                "Logout",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              alignment: Alignment.topLeft,
              child: const Text(
                "Trendy Products",
                style: TextStyle(
                    fontWeight: FontWeight.w800, fontSize: 22
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: CarouselSlider(
                options: CarouselOptions(
                  padEnds: false,
                  initialPage: 0,
                  pageSnapping: false,
                  enableInfiniteScroll: false,
                  autoPlay: false,
                  height: 365,
                  viewportFraction: 0.5, // Adjust this value to control the width of the items
                  enlargeCenterPage: true,
                  enlargeFactor: 0.1,
                  
                ),
                items: const [
                  ProductCardCarousel(title: "Americano", imageUrl: "assets/product_carousel/americano.jpg", description: "Made with Love", price: 2.00),
                  ProductCardCarousel(title: "Cappucino", imageUrl: "assets/product_carousel/cappucino.jpg", description: "Made with Love", price: 4.00),
                  ProductCardCarousel(title: "Espresso", imageUrl: "assets/product_carousel/espresso.jpg", description: "Made with Love", price: 1.00),
                  ProductCardCarousel(title: "Latte", imageUrl: "assets/product_carousel/latte.jpg", description: "Made with Love", price: 3.00),
                ]
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: screenWidth * 0.92,
              height: 120,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage("assets/coffee_promotion_2.jpg"),
                  fit: BoxFit.cover
                ),
                
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: screenWidth * 0.92,
              height: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage("assets/coffee_promotion.jpg"),
                  fit: BoxFit.cover
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
