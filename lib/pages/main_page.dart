import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
    pages = [
      HomePage(username: widget.username!,),
      ItemsPage(username: widget.username,),
      const DetailsPage()
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar:  BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedPage = value;
          });
        },
        currentIndex: selectedPage,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            tooltip: "Menu",
            label: "Menu",
            icon: Icon(Icons.coffee_outlined),
            activeIcon: Icon(Icons.coffee)
          ),
          BottomNavigationBarItem(
            tooltip: "Details",
            label: "Details",
            icon: Icon(Icons.list_outlined),
            activeIcon: Icon(Icons.list)
          ),
        ],
      ),
    );
  }
}