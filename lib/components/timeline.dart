import 'package:flutter/material.dart';
import 'package:kanye_tweets/components/tweet.dart';

class Timeline extends StatelessWidget {
  final List list;

  const Timeline({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Tweet(
            tweet: list[index],
            color: index % 2 == 0 ? Colors.white : Colors.white);
      },
    );
  }
}
