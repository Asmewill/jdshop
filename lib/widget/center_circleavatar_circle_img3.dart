import 'package:flutter/material.dart';

class CenterCircleAvatarCircleImage3 extends StatelessWidget {
  //CircleAvatar  实现圆角头像
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://jdmall.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png"),
          radius: 120,
        ),
      ),
    );
  }
}
