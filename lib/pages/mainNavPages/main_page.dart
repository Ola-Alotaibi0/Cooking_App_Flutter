import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/pages/mainNavPages/basket_page.dart';
import 'package:cooking_app/pages/home_page.dart';
import 'package:cooking_app/pages/mainNavPages/save_page.dart';
import 'package:cooking_app/pages/mainNavPages/search_page.dart';
import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    SearchPage(),
    BasketPage(),
    SavePage(),
  ];

  int bottomNavigationBarIndex = 0;
  void onTap(int index){
    setState(() {
      bottomNavigationBarIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: pages[bottomNavigationBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.colorWhite,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomNavigationBarIndex,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.mainColor.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(label: "Home",icon: Icon(Icons.home,)),
          BottomNavigationBarItem(label: "Search",icon: Icon(Icons.search,)),
          BottomNavigationBarItem(label: "Basket",icon: Icon(Icons.shopping_basket_outlined,)),
          BottomNavigationBarItem(label: "Save",icon: Icon(Icons.bookmark_outline_sharp,))
        ],
      ),
    );
  }
}
