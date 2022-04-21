import 'package:cooking_app/bloc/authBloc/authentication_bloc.dart';
import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/pages/mainNavPages/basket_page.dart';
import 'package:cooking_app/pages/home_page.dart';
import 'package:cooking_app/pages/mainNavPages/save_page.dart';
import 'package:cooking_app/pages/mainNavPages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainPage extends StatefulWidget {
  AuthenticationBloc authenticationBloc;
  MainPage({Key? key, required this.authenticationBloc}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    super.initState();
  }



  int bottomNavigationBarIndex = 0;
  void onTap(int index){
    setState(() {
      bottomNavigationBarIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    List pages = [
      HomePageParent(authenticationBloc: authenticationBloc),
      SearchPage(),
      BasketPage(),
      SavePage(),
    ];
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
