import 'package:flutter/material.dart';
import 'package:kanye_tweets/components/timeline.dart';
import 'package:kanye_tweets/controllers/theme_controller.dart';
import 'package:kanye_tweets/controllers/tweets_controller.dart';
import 'package:kanye_tweets/views/profile_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TweetsController();

  _success() {
    return Timeline(
      list: controller.tweets,
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        child: const Text('Try again'),
        onPressed: () {},
      ),
    );
  }

  _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  _start() {
    return Container();
  }

  stateManagement(TweetState state) {
    switch (state) {
      case TweetState.start:
        return _start();
      case TweetState.loading:
        return _loading();
      case TweetState.error:
        return _error();
      case TweetState.success:
        return _success();

      default:
        return _start();
    }
  }

  @override
  void initState() {
    super.initState();

    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/ye.jpg'),
                backgroundColor: Colors.black,
                radius: 20,
              ),
            ),
            IconButton(
                onPressed: () {
                  controller.start();
                },
                icon: const Icon(Icons.refresh_outlined)),
            CustomSwitch(),
          ],
        ),
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  CustomSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkThemed,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
