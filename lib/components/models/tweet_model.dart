class TweetModel {
  String? quote;

  TweetModel({this.quote});

  TweetModel.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quote'] = quote;
    return data;
  }
}
