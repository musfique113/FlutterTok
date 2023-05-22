import 'package:flutter/material.dart';
import 'package:fluttertok/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

class addVideoScreen extends StatelessWidget {
  addVideoScreen({Key? key}) : super(key: key);

  videoPicker(ImageSource src) async{
    final video = await ImagePicker().pickVideo(source: src);
    if(video != null){
      Get.snackbar("Video Selected", video.path);
    }else{
      Get.snackbar("Error in selection videos", "Choose another video file");
    }
  }

  showDialogOpt(BuildContext context){
    return showDialog(context: context, builder: (context)=> SimpleDialog(
      children: [
        SimpleDialogOption(
          onPressed: () => videoPicker(ImageSource.gallery),
          child: Text("Gallery"),
        ),
        SimpleDialogOption(
          onPressed: () => videoPicker(ImageSource.camera),
          child: Text("Camera"),
        ),
        SimpleDialogOption(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Close"),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showDialogOpt(context),
          child: Container(
            width: 160,
            height: 40,
            decoration: BoxDecoration(
              color: buttonColor
            ),
            child: Center(
              child: Text("Add videos",style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
