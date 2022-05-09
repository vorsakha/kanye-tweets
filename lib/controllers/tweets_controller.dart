import 'package:flutter/material.dart';
import 'package:kanye_tweets/repositories/tweet_repository.dart';

enum TweetState { start, loading, success, error }

class TweetController extends ChangeNotifier {
  List tweetsUpstream = [];
  List tweetsDownstream = [];

  final state = ValueNotifier(TweetState.start);
  final repository = TweetRepository();

  Future startUpstream() async {
    state.value = TweetState.loading;

    try {
      var _newTweets = await repository.fetchTweets();
      tweetsUpstream = [..._newTweets, ...tweetsUpstream];

      state.value = TweetState.success;
    } catch (e) {
      state.value = TweetState.error;
    }

    notifyListeners();
  }

  Future startDownstream() async {
    state.value = TweetState.loading;

    if (tweetsDownstream.isEmpty) {
      try {
        var _newTweets = await repository.fetchTweets();
        tweetsDownstream = [...tweetsDownstream, ..._newTweets];

        state.value = TweetState.success;
      } catch (e) {
        state.value = TweetState.error;
      }

      notifyListeners();
    } else {
      state.value = TweetState.success;
    }
  }

  Future infiniteScroll() async {
    state.value = TweetState.loading;

    try {
      var _newTweets = await repository.fetchTweets();
      tweetsDownstream = [...tweetsDownstream, ..._newTweets];

      state.value = TweetState.success;
    } catch (e) {
      state.value = TweetState.error;
    }

    notifyListeners();
  }
}
