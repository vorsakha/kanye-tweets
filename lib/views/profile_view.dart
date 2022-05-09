import 'package:flutter/material.dart';
import 'package:kanye_tweets/components/profile/profile_body.dart';
import 'package:kanye_tweets/components/profile/profile_header.dart';
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

    // doesn't work bc Timeline ListView is not scrollable at /profile
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

    _success() {
      return Scrollbar(
        isAlwaysShown: true,
        showTrackOnHover: true,
        child: PageStorage(
          bucket: bucket,
          child: SingleChildScrollView(
            key: PageStorageKey<String>('$controller.tweetsDownstream.length'),
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Header(),
                const ProfileBody(),
                Timeline(list: controller.tweetsDownstream),
              ],
            ),
          ),
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
      return Stack(
        children: [
          Timeline(list: controller.tweetsDownstream),
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
