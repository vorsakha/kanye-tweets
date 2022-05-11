import 'package:flutter/material.dart';
import 'package:kanye_tweets/components/profile/profile_body.dart';
import 'package:kanye_tweets/components/profile/profile_header.dart';
import 'package:kanye_tweets/components/switch.dart';
import 'package:kanye_tweets/components/timeline.dart';
import 'package:kanye_tweets/controllers/tweets_controller.dart';
import 'package:provider/provider.dart';

final bucket = PageStorageBucket();

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    final controller = Provider.of<TweetController>(context, listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.startDownstream();
    });

    _scrollController = ScrollController(keepScrollOffset: true);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          controller.state.value != TweetState.loading) {
        controller.infiniteScroll();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TweetController>(context);

    _error() {
      return Center(
        child: ElevatedButton(
          child: const Text('Try again'),
          onPressed: () {},
        ),
      );
    }

    _loading() {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    stateManagement(TweetState state) {
      if (state == TweetState.error) {
        return _error();
      }

      return state == TweetState.loading ? _loading() : Container();
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Profile'),
            CustomSwitch(),
          ],
        ),
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return Scrollbar(
            isAlwaysShown: true,
            showTrackOnHover: true,
            child: PageStorage(
              bucket: bucket,
              child: SingleChildScrollView(
                key: PageStorageKey<String>(
                    '$controller.tweetsDownstream.length'),
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(),
                    const ProfileBody(),
                    Timeline(list: controller.tweetsDownstream),
                    stateManagement(controller.state.value),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
