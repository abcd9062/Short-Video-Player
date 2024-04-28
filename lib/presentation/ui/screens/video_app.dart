import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const VideoApp());

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  final url = "https://firebasestorage.googleapis.com/v0/b/short-video-player-7ec8f.appspot.com/o/raghunandan.mp4?alt=media&token=34ec12f1-9c8c-4ced-a664-dbec2715746b";
  final songImageUrl = "https://firebasestorage.googleapis.com/v0/b/short-video-player-7ec8f.appspot.com/o/Images%2Fraghunandan_image.jpeg?alt=media&token=008cb851-e3a8-4f07-bf64-ac68bf15b9aa";
  bool _shouldRenderUi = false;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(url),
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
                                  CircularIcon(iconLetter: "A"),
                                  const SizedBox(width: 8,),
                                  const Text("@abcd1234",
                                    style: TextStyle(
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
                              const Text("Raghunandana Song Lyrics || Hanuman movie song 🚩 || Hanuman Status 🚩🙏 #shorts #hanuman #viralshorts",
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SideActionButton(icon: Icons.thumb_up_rounded, text: "295K"),
                            SideActionButton(icon: Icons.thumb_down_rounded, text: "Dislike"),
                            SideActionButton(icon: Icons.message, text: "1,650"),
                            SideActionButton(icon: Icons.share, text: "Share"),
                          ],
                        )
                      ],
                    ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.library_music_rounded, color: Colors.white70,),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text("Raghunandana (From \"HanuMan\")", style: TextStyle(color: Colors.white70, fontSize: 16),)),
                          ),
                          SizedBox(
                              height: 60,
                              width: 60,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                  child: Image.network(songImageUrl)))
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