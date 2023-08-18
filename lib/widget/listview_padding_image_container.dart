import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//listView所包含的Widget是自适应宽度的
class ListViewPaddingImageContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Image.network("https://jdmall.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png"),
            Container(
              child: Text(
                "我是一个标题",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18
                ),
              ),
              height: 40,
              //alignment: Alignment.center,
            ),
            Image.network("https://jdmall.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png"),
            Container(
              child: Text(
                "我是一个标题",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18

                ),
              ),
              height: 40,
              //alignment: Alignment.center,
            ),
            Image.network("https://jdmall.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png"),
            Container(
              child: Text(
                "我是一个标题",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18

                ),
              ),
              height: 40,
              //alignment: Alignment.center,
            ),
            Image.network("https://jdmall.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png"),
            Container(
              child: Text(
                "我是一个标题",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18

                ),
              ),
              height: 40,
              //alignment: Alignment.center,
            ),
            Image.network("https://jdmall.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png"),
            Container(
              child: Text(
                "我是一个标题",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18

                ),
              ),
              height: 40,
              //alignment: Alignment.center,
            ),

          ],
        ),
      );

  }
  
}