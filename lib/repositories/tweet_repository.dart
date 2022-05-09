import 'package:dio/dio.dart';

class TweetRepository {
  final _url = 'https://api.kanye.rest';
  final _listSize = 5;

  final _dio = Dio();

  Future<List<String>> fetchTweets() async {
    List<String> tweetList = [];

    for (var i = 0; i < _listSize; i++) {
      final tweet = await _dio.get(_url);
      final data = tweet.data;
      tweetList.contains(data['quote']) ? null : tweetList.add(data['quote']);
    }

    return tweetList;
  }
}
