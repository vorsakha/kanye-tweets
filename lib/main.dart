import 'package:flutter/material.dart';
import 'package:kanye_tweets/views/home_view.dart';

import 'controllers/app_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          title: 'Kanye Tweets',
          theme: ThemeData(
            brightness: AppController.instance.isDarkThemed
                ? Brightness.dark
                : Brightness.light,
            primarySwatch: Colors.red,
          ),
          home: const MyHomePage(title: 'Kanye Tweets'),
        );
      },
    );
  }
}
