import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/pages/mainNavPages/basket_page.dart';
import 'package:cooking_app/pages/mainNavPages/home_page.dart';
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
          BottomNavigationBarItem(title: Text("Home"),icon: Icon(Icons.home,)),
          BottomNavigationBarItem(title: Text("Search"),icon: Icon(Icons.search,)),
          BottomNavigationBarItem(title: Text("Basket"),icon: Icon(Icons.shopping_basket_outlined,)),
          BottomNavigationBarItem(title: Text("Save"),icon: Icon(Icons.bookmark_border_outlined,))
        ],
      ),
    );
  }
}
