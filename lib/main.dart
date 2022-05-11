import 'package:flutter/material.dart';
import 'package:kanye_tweets/controllers/tweets_controller.dart';
import 'package:kanye_tweets/views/home_view.dart';
import 'package:kanye_tweets/views/profile_view.dart';
import 'package:provider/provider.dart';

import 'controllers/theme_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TweetController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final String title = 'Kanye Tweets';

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeController.instance,
      builder: (context, child) {
        return MaterialApp(
          title: title,
          theme: ThemeController.lightTheme,
          darkTheme: ThemeController.darkTheme,
          themeMode: currentTheme.currentTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => MyHomePage(title: title),
            '/profile': (context) => const Profile(),
          },
        );
      },
    );
  }
}
