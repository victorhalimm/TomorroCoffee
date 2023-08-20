import 'package:flutter/material.dart';
import 'package:flutter_qualif_vc/models/product.dart';
import 'package:flutter_qualif_vc/pages/details_page.dart';
import 'package:flutter_qualif_vc/widgets/product_card.dart';


class ItemsPage extends StatefulWidget {
  final String? username;
  final void Function(Product) onSelectProduct;
  final List<Product> products;

  const ItemsPage({super.key, required this.username, required this.onSelectProduct, required this.products});
  
  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {


  void updateProduct(Product updatedProduct) {
    setState(() {
      int updateIdx = widget.products.indexWhere((product) => product.title == updatedProduct.title);

      if (updateIdx != -1) 
        widget.products[updateIdx] = updatedProduct;
    });
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height; 
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                  color: Theme.of(context).colorScheme.secondary
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
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (() {
                      widget.onSelectProduct(widget.products[index]);
                    }),
                    child: ProductCard(
                      title: widget.products[index].title,
                      imageUrl: widget.products[index].imageUrl,
                      description: widget.products[index].description,
                      price: widget.products[index].price,
                    ),
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