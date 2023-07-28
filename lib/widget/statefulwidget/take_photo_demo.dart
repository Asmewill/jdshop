import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakePhotoDemo extends StatefulWidget {
  const TakePhotoDemo({Key? key}) : super(key: key);

  @override
  State<TakePhotoDemo> createState() => _TakePhotoDemoState();
}

class _TakePhotoDemoState extends State<TakePhotoDemo> {
  PickedFile? imageFile;
  final picker=ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImagePicker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             ElevatedButton(onPressed: (){
               takePhoto();
             }, child: Text("拍照")),
             ElevatedButton(onPressed: (){
               openGallery();
             }, child: Text("选择图库")),
             this.imageFile==null?Text("请选择图片"):Image.file(File(this.imageFile!.path))
           ],
        ),
      ),
    );
  }

  void takePhoto() async{
    PickedFile? pickerFile= await picker.getImage(source: ImageSource.camera,maxWidth: 200,maxHeight: 200);
    if(pickerFile!=null){
      setState(() {
        this.imageFile=pickerFile;
      });
      this.uploadFile(pickerFile.path);
    }
  }
  void openGallery() async{
    PickedFile? pickerFile=await picker.getImage(source: ImageSource.gallery,maxWidth: 300,maxHeight: 300);
    if(pickerFile!=null){
      setState(() {
        this.imageFile=pickerFile;
      });
      this.uploadFile(pickerFile.path);
    }
  }


  void uploadFile(String imagePath){
    var formData=FormData.fromMap({
      "name":"wendux",
      "age":25,
      "file": MultipartFile.fromFile(imagePath,filename: "aaa.png")
    });
    var response= Dio().post("https://jd.itying.com/imgupload",data:  formData);
    print(response);
  }



}
