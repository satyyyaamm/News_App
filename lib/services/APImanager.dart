import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constants/Strings.dart';
import 'package:news_app/models/newsinfo.dart';

class APImanager {
  Future<Newsmodel> getNews() async {
    var client = http.Client();

    var newsModel = null;
    try {
      var response = await client.get(Strings.newsUrl);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        newsModel = Newsmodel.fromJson(jsonMap);
      }
      return newsModel;
    } catch (expection) {
      return newsModel;
    }
  }
}
