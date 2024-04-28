import 'package:flutter/material.dart';
import 'package:short_video_streaming_demo/data/models/video.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoPlayerScreen extends StatefulWidget {
  Video videoData;
  VideoPlayerScreen({super.key, required this.videoData});
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  //final url = "https://firebasestorage.googleapis.com/v0/b/short-video-player-7ec8f.appspot.com/o/videos%2Fraghunandan.mp4?alt=media&token=cdd20ed4-9d54-4885-bdb2-d5e21f08f002";
 // final songImageUrl = "https://firebasestorage.googleapis.com/v0/b/short-video-player-7ec8f.appspot.com/o/Images%2Fraghunandan_image.jpeg?alt=media&token=008cb851-e3a8-4f07-bf64-ac68bf15b9aa";
  bool _shouldRenderUi = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoData.videoUrl),
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized,
        // even before the play button has been pressed.
        _shouldRenderUi = true;
        _controller.play();
        _controller.setVolume(1.0);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Stack(
              children: [
                _controller.value.isInitialized
                    ?
                VideoPlayer(_controller)
                    : Container(),
                if(_shouldRenderUi) Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  CircularIcon(iconLetter: widget.videoData.logoLetter),
                                  const SizedBox(width: 8,),
                                  Text(widget.videoData.userId,
                                    style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16
                                    ),),
                                  const SizedBox(width: 8,),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(16)),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                                      child: Text("Subscribe", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12,),
                              Text(widget.videoData.videoTitle,
                                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SideActionButton(icon: Icons.thumb_up_rounded, text: widget.videoData.likeNum),
                            SideActionButton(icon: Icons.thumb_down_rounded, text: "Dislike"),
                            SideActionButton(icon: Icons.message, text: widget.videoData.commentNum),
                            SideActionButton(icon: Icons.share, text: "Share"),
                          ],
                        )
                      ],
                    ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(Icons.library_music_rounded, color: Colors.white70,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(widget.videoData.songName, style: const TextStyle(color: Colors.white70, fontSize: 16),)),
                          ),
                          SizedBox(
                              height: 60,
                              width: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                  child: Image.network(widget.videoData.songPosterUrl)))
                        ],
                      )
                    ],
                  ),
                ),
                if(!_shouldRenderUi) const Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            )
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     setState(() {
          //       _controller.value.isPlaying
          //           ? _controller.pause()
          //           : _controller.play();
          //     });
          //   },
          //   child: Icon(
          //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          //   ),
          // ),
        ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget SideActionButton({required IconData icon, required String text}) {
    return Column(
    children: [
      IconButton(onPressed: (){}, icon: Icon(
        icon, color:
        Colors.white,
        size: 36,
      )),
      Text(text,style: const TextStyle(color: Colors.white),),
       const SizedBox(height: 12,)
    ],
    );
  }

  Widget CircularIcon({required String iconLetter}) {
    return CircleAvatar(backgroundColor: Colors.white, radius: 20,
      child: Text(iconLetter, style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
      ),),);
  }
}