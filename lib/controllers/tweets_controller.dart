import 'dart:convert';

import 'package:http/http.dart' as http;

Future main() async {
  final json = await fetch();

  print(json);
}

Future<Map> fetch() async {
  var url = 'https://api.kanye.rest';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);

  return json;
}
