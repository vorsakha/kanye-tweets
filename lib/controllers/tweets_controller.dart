import 'dart:convert';

import 'package:http/http.dart' as http;

Future main() async {
  List list = [];

  for (var i = 0; i < 3; i++) {
    final tweet = await fetch();
    list.add(tweet);
  }

  print(list[0].quote);
}

Future<Tweet> fetch() async {
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
