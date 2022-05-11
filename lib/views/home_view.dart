import 'package:flutter/material.dart';
import 'package:kanye_tweets/components/switch.dart';
import 'package:kanye_tweets/components/timeline.dart';
import 'package:kanye_tweets/controllers/tweets_controller.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final controller = Provider.of<TweetController>(context, listen: false);

      controller.startUpstream();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TweetController>(context);

    _success() {
      return RefreshIndicator(
        onRefresh: controller.startUpstream,
        child: Timeline(
          list: controller.tweetsUpstream,
        ),
      );
    }

    _error() {
      return Center(
        child: ElevatedButton(
          child: const Text('Try again'),
          onPressed: () {
            controller.startUpstream();
          },
        ),
      );
    }

    _loading() {
      return Stack(
        children: [
          Timeline(list: controller.tweetsUpstream),
          const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      );
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
                radius: 21,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ye.jpg'),
                  radius: 20,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  controller.startUpstream();
                },
                icon: const Icon(Icons.upgrade)),
            const CustomSwitch(),
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
