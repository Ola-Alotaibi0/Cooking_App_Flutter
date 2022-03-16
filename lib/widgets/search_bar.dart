import 'package:cooking_app/component/colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {

  final String hintText;
  const SearchBar({
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Container(
        height: size.height *0.057,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: AppColors.greyBackgroundColor,
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.6),
                ),
                prefixIcon: Icon(Icons.search_rounded, color: AppColors.mainColor,size: 30,)
            ),
          ),
        ),
      ),
    );
  }
}