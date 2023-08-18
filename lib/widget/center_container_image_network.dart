import 'package:flutter/material.dart';


//Container 的alignment和 child控件的alignment的效果是一样的
class CenterContainerImageNetWork extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     //https://iconfont.alicdn.com/t/d7596d2a-969a-4724-94d7-0b3483a7303d.png
     return Center(
       child: Container(
           child: Image.network(
             "https://jdmall.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png",
             alignment: Alignment.topRight,
             fit: BoxFit.cover,
             //color: Colors.blue,
             // repeat: ImageRepeat.repeat,
           ),
           width: 300,
           height: 300,
           //alignment: Alignment.topLeft,
           decoration: BoxDecoration(
             color: Colors.yellow,
           )
       ),
     );
  }

}