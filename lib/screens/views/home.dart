import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_hub/Getx/common_layout_controller.dart';
import 'package:video_player/video_player.dart';
import '../../Getx/bottom_nav_controller.dart';
import '../../Getx/video_controller.dart';
import 'about_us.dart';
import 'cart.dart';
import 'contact_us.dart';
import 'gallery.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFBf9AED),
          body: HomeScreenContent(),
        ),
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            'SportsHub has everything you need to elevate your game to the next level.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'About SportsHub',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Welcome to SportsHub, your ultimate destination for all things football! Whether you\'re a dedicated player, a passionate fan, or a coach looking to gear up your team, SportsHub has everything you need to elevate your game to the next level. From top-quality footballs and jerseys to essential gear and accessories, we\'ve got you covered for every aspect of the beautiful game',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: 381,
            height: 130,
            child: VideoPlayerWidget(),
          ),
          SizedBox(height: 10),
          Text(
            'Football',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Explore a variety of high-quality footballs, including match balls, training balls, and mini balls, from top brands.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Protective Gear:',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Stay safe and protected with our assortment of football helmets, shoulder pads, shin guards, and mouthguards.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Accessories:',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Enhance your game with essential football accessories such as gloves, socks, arm sleeves, and captain armbands.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(
      builder: (controller) {
        if (controller.videoPlayerController.value.isInitialized) {
          return AspectRatio(
            aspectRatio: controller.videoPlayerController.value.aspectRatio,
            child: VideoPlayer(controller.videoPlayerController),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
