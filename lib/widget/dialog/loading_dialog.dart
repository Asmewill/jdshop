import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {
  var text;

  LoadingDialog({this.text = "加载中"});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      type: MaterialType.transparency, //透明类型
      child:Center(
        child: Container(
          width: 120,
          height: 120,
          decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Padding(padding:EdgeInsets.only(top: 15)),
              Text("Loading")
            ],
          ),
        ),
      )
    );
  }
}
