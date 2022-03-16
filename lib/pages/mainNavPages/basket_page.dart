import 'package:cooking_app/widgets/app_large_text.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AppLargeText(text: "Basket Page",size: 20,),
      ),
    );
  }
}
