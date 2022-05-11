import 'package:flutter/material.dart';
import 'package:kanye_tweets/components/tweet.dart';

class Timeline extends StatelessWidget {
  final List list;

  const Timeline({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      showTrackOnHover: true,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: ModalRoute.of(context)?.settings.name as String != "/profile"
            ? null
            : const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Tweet(tweet: list[index]);
        },
      ),
    );
  }
}
