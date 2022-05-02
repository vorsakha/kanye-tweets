import 'package:flutter/material.dart';
import 'package:kanye_tweets/controllers/tweets_controller.dart';

class HomeController {
  List tweets = [];

  final state = ValueNotifier(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;

    try {
      tweets = await getManyTweets();

      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
