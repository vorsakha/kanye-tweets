import 'package:flutter/material.dart';
import 'package:kanye_tweets/controllers/theme_controller.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.light),
      onPressed: () {
        ThemeController.instance.changeTheme();
      },
    );
  }
}
