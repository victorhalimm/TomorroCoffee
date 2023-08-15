import 'package:flutter/material.dart';

class ProductCardCarousel extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final double price;

  const ProductCardCarousel(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.description,
      required this.price});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: 0.45 * screenWidth,
      height: 350,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(7),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        children:  [
          Container(
            width: screenWidth * 0.4,
            height: 225,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black38,
                        )
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "\$" + price.toString() + "0",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange,
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ]
            ),
          )
        ]
      )
    );
  }
}
