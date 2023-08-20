import 'package:flutter/material.dart';
import 'package:flutter_qualif_vc/models/comment.dart';
import 'package:flutter_qualif_vc/models/product.dart';
import 'package:flutter_qualif_vc/pages/details_page.dart';
import 'package:flutter_qualif_vc/pages/home_page.dart';
import 'package:flutter_qualif_vc/pages/items_page.dart';

class MainPage extends StatefulWidget {
  final String? username;
  
  MainPage({super.key, required this.username});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  late List<Widget> pages;
  Product defaultProduct = Product(title: "Americano", imageUrl: "assets/product_carousel/americano.jpg", description: "Hot/Iced", price: 2.00, detailDescription: "A rich and bold coffee, the Americano is made by pouring a shot (or more) of espresso and adding hot water. The result is a coffee that's somewhat similar in strength to black coffee but has a different flavor profile. It can be enjoyed black or with a splash of milk.", comments: []);

  List<Product> products = [
     Product(title: "Americano", imageUrl: "assets/product_carousel/americano.jpg", description: "Hot/Iced", price: 2.00, detailDescription: "A rich and bold coffee, the Americano is made by pouring a shot (or more) of espresso and adding hot water. The result is a coffee that's somewhat similar in strength to black coffee but has a different flavor profile. It can be enjoyed black or with a splash of milk.", comments: []),
     Product(title: "Cappucino", imageUrl: "assets/product_carousel/cappucino.jpg", description: "Hot", price: 4.00, detailDescription: "A classic Italian coffee drink, the Cappuccino consists of equal parts espresso, steamed milk, and frothed milk. The perfect cappuccino is crowned with a cloud of milk foam on the top. The harmony of flavors makes it a beloved morning drink for coffee lovers.", comments: []),
     Product(title: "Espresso", imageUrl: "assets/product_carousel/espresso.jpg", description: "Hot", price: 1.00, detailDescription: "Espresso is a concentrated form of coffee that's made by forcing pressurized hot water through finely-ground coffee beans. It's known for its strong, robust flavor and forms the base for many other coffee drinks. Enjoyed straight up, it's a pure, unadulterated coffee experience that packs a punch.", comments: []),
     Product(title: "Latte", imageUrl: "assets/product_carousel/latte.jpg", description: "Hot/Iced", price: 3.00, detailDescription: "A Latte is a creamy coffee drink made with one or more shots of espresso and steamed milk. Often enjoyed with a flavoring like vanilla or caramel, it's topped with just a small amount of foam. The Latte's smooth and mild flavor makes it an approachable choice for any time of day.", comments: []),
  ];

  void updateProduct(Product updatedProduct) {
    setState(() {
      int updateIdx = products.indexWhere((product) => product.title == updatedProduct.title);

      if (updateIdx != -1) 
        products[updateIdx] = updatedProduct;
    });
  }

  void backToItem() {
    setState(() {
      selectedPage = 1;
    });
  }

  void onSelectProduct(Product product) {
    setState(() {
      pages[2] = DetailsPage(product: product, backToMenu: backToItem, username: widget.username, updateItem: updateProduct,);
      selectedPage = 2; 
    });
  }

  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(username: widget.username!,),
      ItemsPage(username: widget.username, onSelectProduct: onSelectProduct, products: products,),
      DetailsPage(product: defaultProduct, backToMenu: backToItem, username: widget.username, updateItem: updateProduct,),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar:  BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).colorScheme.tertiary,
        onTap: (value) {
          setState(() {
            selectedPage = value;
          });
        },
        currentIndex: selectedPage,
        items: const [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            tooltip: "Menu",
            label: "",
            icon: Icon(Icons.coffee_outlined),
            activeIcon: Icon(Icons.coffee)
          ),
          BottomNavigationBarItem(
            tooltip: "Details",
            label: "",
            icon: Icon(Icons.list_outlined),
            activeIcon: Icon(Icons.list)
          ),
        ],
      ),
    );
  }
}