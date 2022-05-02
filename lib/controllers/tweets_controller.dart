import 'dart:convert';

import 'package:http/http.dart' as http;

Future getManyTweets() async {
  List list = [];

  for (var i = 0; i < 3; i++) {
    final tweet = await fetchTweet();
    list.contains(tweet) ? null : list.add(tweet.quote);
  }

  return list;
}

Future<TweetModel> fetchTweet() async {
  var url = 'https://api.kanye.rest';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);

  var tweet = TweetModel.fromJson(json);
  return tweet;
}

class TweetModel {
  final String quote;

  TweetModel({required this.quote});

  factory TweetModel.fromJson(Map json) {
    return TweetModel(quote: json['quote']);
  }
}
