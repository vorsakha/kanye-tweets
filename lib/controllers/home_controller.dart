import 'package:kanye_tweets/controllers/tweets_controller.dart';

class HomeController {
  List tweets = [];

  HomeState state = HomeState.start;

  Future start() async {
    state = HomeState.loading;

    try {
      tweets = await getManyTweets();

      state = HomeState.success;
    } catch (e) {
      state = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
