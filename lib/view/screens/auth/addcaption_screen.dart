import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../constants.dart';
import '../../widgets/text-input.dart';

class addCaptionScreen extends StatefulWidget {
  File videoFile;
  String videoPath;

  addCaptionScreen({Key? key, required this.videoFile, required this.videoPath})
      : super(key: key);

  @override
  State<addCaptionScreen> createState() => _addCaptionScreenState();
}

class _addCaptionScreenState extends State<addCaptionScreen> {
  late VideoPlayerController videoPlayerController;
  TextEditingController songNameController = new TextEditingController();
  TextEditingController captionController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.4,
              child: VideoPlayer(videoPlayerController),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextInputField(controller: songNameController,
                      myIcon: Icons.music_note,
                      myLabelText: "Song Name"),
                  SizedBox(height: 20,),
                  TextInputField(controller: captionController,
                      myIcon: Icons.closed_caption,
                      myLabelText: "Caption"),
                  SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){}, child: Text("Upload") , style: ElevatedButton.styleFrom(primary: buttonColor),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
