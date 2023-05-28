import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FlutterTokVideoPlayer extends StatefulWidget {
  FlutterTokVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);
  String videoUrl;

  @override
  State<FlutterTokVideoPlayer> createState() => _FlutterTokVideoPlayerState();
}

class _FlutterTokVideoPlayerState extends State<FlutterTokVideoPlayer> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController.play();
      });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: VideoPlayer(videoPlayerController),
    );
  }
}
