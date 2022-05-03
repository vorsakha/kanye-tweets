import 'package:flutter_test/flutter_test.dart';
import 'package:kanye_tweets/repositories/tweet_repository.dart';

main() {
  final repository = TweetRepository();

  test('Should return a list o tweets', () async {
    final tweetList = await repository.fetchTweets();
  });
}
