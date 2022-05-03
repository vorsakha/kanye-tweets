import 'package:flutter/material.dart';
import 'package:kanye_tweets/repositories/tweet_repository.dart';

class TweetsController {
  List tweets = [];

  final state = ValueNotifier(TweetState.start);
  final repository = TweetRepository();

  Future start() async {
    state.value = TweetState.loading;

    try {
      tweets = await repository.fetchTweets();

      state.value = TweetState.success;
    } catch (e) {
      state.value = TweetState.error;
    }
  }
}

enum TweetState { start, loading, success, error }
