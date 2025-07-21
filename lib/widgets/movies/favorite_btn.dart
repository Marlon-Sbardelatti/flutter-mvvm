import 'package:flutter/material.dart';
import 'package:mvvm/constants/my_app_icons.dart';

class FavoriteBtnWidget extends StatelessWidget {
  const FavoriteBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          // todo: add to favorites
        },
        icon: Icon(
          MyAppIcons.favoriteOutlineRounded,
          // color: Colors.red,
          size: 20,
        ));
  }
}
