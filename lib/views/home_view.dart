import 'package:flutter/material.dart';
import 'package:kanye_tweets/controllers/app_controller.dart';
import 'package:kanye_tweets/controllers/home_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = HomeController();

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _success() {
    return ListView.builder(
      itemCount: controller.tweets.length,
      itemBuilder: (context, index) {
        var tweet = controller.tweets[index];
        return ListTile(
          title: Text('tile $tweet'),
        );
      },
    );
  }

  _error() {
    return Center(
        child: ElevatedButton(
      child: const Text('Try again'),
      onPressed: () {},
    ));
  }

  _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  _start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      case HomeState.success:
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
          title: Text(widget.title),
          actions: [
            CustomSwitch(),
          ],
        ),
        body: stateManagement(HomeState.start));
  }
}

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({Key? key}) : super(key: key);

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
