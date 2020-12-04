import 'package:flutter/material.dart';
import 'package:wholesome_meme/post.dart';

class SliderItem extends StatelessWidget {
  final Post post;

  SliderItem({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      post.postUrl,
      // height: MediaQuery.of(context).size.height * 1 / 2,
    );
  }
}
