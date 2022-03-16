import 'package:cooking_app/widgets/app_large_text.dart';
import 'package:flutter/material.dart';

class SavePage extends StatelessWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AppLargeText(text:"Save Page",size: 20,),
      ),
    );
  }
}
