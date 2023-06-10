import 'package:flutter/material.dart';
import 'package:fluttertok/controller/video_controller.dart';
import 'package:fluttertok/view/widgets/AlbumRotator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/flutterTokVideoPlayer.dart';
import '../widgets/profile_button.dart';

class DisplayVideo_Screen extends StatelessWidget {
  DisplayVideo_Screen({Key? key}) : super(key: key);
  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
            itemCount: 10,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.vertical,
            itemBuilder: (contex, index) {
              return Stack(
                children: [
                  FlutterTokVideoPlayer(
                    videoUrl: "adf",
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "@username",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                        Text("Caption"),
                        Text(
                          "Song",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 450,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3,
                          right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileButton(
                            profilePhotoUrl: "ADD",
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.white,
                              ),
                              Text("LIKES",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.reply,
                                size: 30,
                                color: Colors.white,
                              ),
                              Text("Share",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.comment,
                                size: 30,
                                color: Colors.white,
                              ),
                              Text("Comments ",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  AlbumRotator(profilePicUrl: "adf"),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            });
      }),
    );
  }
}
