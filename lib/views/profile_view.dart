import 'package:flutter/material.dart';
import 'package:kanye_tweets/components/profile/profile_body.dart';
import 'package:kanye_tweets/components/profile/profile_header.dart';
import 'package:kanye_tweets/components/timeline.dart';
import 'package:kanye_tweets/controllers/home_controller.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = HomeController();

  _success() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(),
          const ProfileBody(),
          Timeline(
            list: controller.tweets,
          ),
        ],
      ),
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
        title: const Text('Profile'),
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
