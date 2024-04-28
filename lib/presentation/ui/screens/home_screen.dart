import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:short_video_streaming_demo/data/models/video.dart';
import 'package:short_video_streaming_demo/presentation/ui/screens/video_player_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Video> videoList = [];

  @override
  void initState() {
    // String jsonResponse = '[{"videoTitle":"Raghunandana Song Lyrics || Hanuman movie song 🚩 || Hanuman Status 🚩🙏 #shorts #hanuman #viralshorts","videoUrl":"https://firebasestorage.googleapis.com/v0/b/short-video-player-7ec8f.appspot.com/o/videos%2Fraghunandan.mp4?alt=media&token=cdd20ed4-9d54-4885-bdb2-d5e21f08f002","likeNum":"295K","commentNum":"1,650","logoLetter":"A","userId":"@abcd1234","songPosterUrl":"https://firebasestorage.googleapis.com/v0/b/short-video-player-7ec8f.appspot.com/o/Images%2Fraghunandan_image.jpeg?alt=media&token=008cb851-e3a8-4f07-bf64-ac68bf15b9aa","songName":"Raghunandana (From \\\"HanuMan\\\")"},{"videoTitle":"Jai Shree Ram | Shree Hanuman [4K Edit] Subscribe for Editing Shorts #hanuman #tejasajja","videoUrl":"https://firebasestorage.googleapis.com/v0/b/short-video-player-7ec8f.appspot.com/o/videos%2Fraghunandan2.mp4?alt=media&token=798801f7-43ee-452b-8a93-3078342e6f4f","likeNum":"30K","commentNum":"1,387","logoLetter":"E","userId":"@efgh134","songPosterUrl":"https://firebasestorage.googleapis.com/v0/b/short-video-player-7ec8f.appspot.com/o/Images%2Fraghunandan_image.jpeg?alt=media&token=008cb851-e3a8-4f07-bf64-ac68bf15b9aa","songName":"Raghunandana (From \\\"HanuMan\\\")"}]';
    // json.decode(jsonResponse).map((json) => videoList.add(Video.fromJson(json)));
    // log("Video url is $videoList");
    videoList.add(
      Video(
          videoTitle: "Raghunandana Song Lyrics || Hanuman movie song 🚩 || Hanuman Status 🚩🙏 #shorts #hanuman #viralshorts",
          videoUrl: "https://firebasestorage.googleapis.com/v0/b/short-video-player-7ec8f.appspot.com/o/videos%2Fraghunandan.mp4?alt=media&token=cdd20ed4-9d54-4885-bdb2-d5e21f08f002",
          likeNum: "295K",
          commentNum: "1,650",
          logoLetter: "A",
          userId: "@abcd1234",
          songPosterUrl: "https://firebasestorage.googleapis.com/v0/b/short-video-player-7ec8f.appspot.com/o/Images%2Fraghunandan_image.jpeg?alt=media&token=008cb851-e3a8-4f07-bf64-ac68bf15b9aa",
          songName: "Raghunandana (From \"HanuMan\")")
    );

    videoList.add(
        Video(
            videoTitle: "Jai Shree Ram | Shree Hanuman [4K Edit] Subscribe for Editing Shorts #hanuman #tejasajja",
            videoUrl: "https://firebasestorage.googleapis.com/v0/b/short-video-player-7ec8f.appspot.com/o/videos%2Fraghunandan2.mp4?alt=media&token=798801f7-43ee-452b-8a93-3078342e6f4f",
            likeNum: "30K",
            commentNum: "1,387",
            logoLetter: "E",
            userId: "@efgh134",
            songPosterUrl: "https://firebasestorage.googleapis.com/v0/b/short-video-player-7ec8f.appspot.com/o/Images%2Fraghunandan_image.jpeg?alt=media&token=008cb851-e3a8-4f07-bf64-ac68bf15b9aa",
            songName: "Raghunandana (From \"HanuMan\")")
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: videoList.length,
            itemBuilder: (context, pos){
               return VideoPlayerScreen(videoData: videoList[pos]);
        })
      ),
    );
  }
}
