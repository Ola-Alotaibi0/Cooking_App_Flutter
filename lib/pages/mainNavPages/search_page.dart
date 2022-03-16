import 'package:cooking_app/component/colors.dart';
import 'package:cooking_app/widgets/app_large_text.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AppLargeText(text: "Search Page",size: 20,),
      ),
    );
  }
}
