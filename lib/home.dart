import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wholesome_meme/post.dart';
import 'package:wholesome_meme/service.dart';
import 'package:wholesome_meme/slider_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Service service = Service();
  final CarouselControllerImpl _pageController = CarouselControllerImpl();
  List<SliderItem> memes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Post currentPost = Post();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<List<SliderItem>>(
            future: service.fetchWholesome(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              } else {
                return CarouselSlider(
                  carouselController: _pageController,
                  items: snapshot.data,
                  options: CarouselOptions(
                      viewportFraction: 1,
                      initialPage: 0,
                      height: MediaQuery.of(context).size.height * 1 / 2,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        print(index);
                        currentPost = snapshot.data[index].post;
                      }),
                );
              }
            },
          ),
          RaisedButton(
            child: Text('Fetch'),
            onPressed: () {
              print('pressed');
              // service.fetchWholesome();
              service.saveNetworkImage(currentPost.postUrl);
            },
          ),
        ],
      ),
    );
  }
}
