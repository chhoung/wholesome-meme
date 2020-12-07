import 'package:flutter/material.dart';
import 'package:wholesome_meme/post.dart';

class SliderItem extends StatelessWidget {
  final Post post;

  SliderItem({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 25.0),
          child: Text(
            post.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(width: 1, color: Colors.grey),
                    vertical: BorderSide(width: 0.5))),
            child: Image.network(
              post.postUrl,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - 100,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}
