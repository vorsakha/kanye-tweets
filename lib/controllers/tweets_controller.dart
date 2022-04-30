import 'dart:convert';

import 'package:http/http.dart' as http;

Future getManyTweets() async {
  List list = [];

  for (var i = 0; i < 3; i++) {
    final tweet = await fetchTweet();
    list.add(tweet);
  }

  return list;
}

Future<Tweet> fetchTweet() async {
  var url = 'https://api.kanye.rest';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);

  var tweet = Tweet.fromJson(json);
  return tweet;
}

class Tweet {
  final String quote;

  Tweet({required this.quote});

  factory Tweet.fromJson(Map json) {
    return Tweet(quote: json['quote']);
  }
}
