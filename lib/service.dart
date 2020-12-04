import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wholesome_meme/post.dart';
import 'package:wholesome_meme/slider_item.dart';

class Service {
  final baseUrl = 'https://www.reddit.com/r/wholesomememes/top.json?limit=10';
  List<Post> _postList = List<Post>();

  Future<List<SliderItem>> fetchWholesome() async {
    var response = await http.get(baseUrl);
    List<SliderItem> sliderList = [];
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var posts = jsonResponse["data"]["children"];
      var posturl;

      for (var post in posts) {
        posturl = post["data"]["url_overridden_by_dest"];
        _postList.add(Post(postUrl: posturl));
        sliderList.add(SliderItem(post: Post(postUrl: posturl)));
      }
      print(posturl);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return sliderList;
  }

  List<Post> get postsList => _postList;
}
