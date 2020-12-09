import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:wholesome_meme/post.dart';
import 'package:wholesome_meme/slider_item.dart';
import 'package:gallery_saver/gallery_saver.dart';

class Service {
  final baseUrl = 'https://www.reddit.com/r/wholesomememes/top.json?limit=10';
  List<Post> _postList = List<Post>();

  Future<List<SliderItem>> fetchWholesome() async {
    var response = await http.get(baseUrl);
    List<SliderItem> sliderList = [];
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var posts = jsonResponse["data"]["children"];
      var postUrl;
      var postTitle;

      for (var post in posts) {
        postUrl = post["data"]["url_overridden_by_dest"];
        postTitle = post["data"]["title"];
        _postList.add(Post(postUrl: postUrl, title: postTitle));
        sliderList.add(
          SliderItem(
            post: Post(postUrl: postUrl, title: postTitle),
          ),
        );
      }

      print(postUrl);
      print(postTitle);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return sliderList;
  }

  void saveNetworkImage(String url) async {
    String path = url;
    GallerySaver.saveImage(path).then((bool success) {
      print('Image is saved');
    });
  }

  List<Post> get postsList => _postList;
}
