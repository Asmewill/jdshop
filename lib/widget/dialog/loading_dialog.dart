import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {


  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Material(
        ///背景透明
        color: Colors.transparent,
        ///保证控件居中效果
        child:  Center(
          ///弹框大小
          child:  SizedBox(
            width: 120.0,
            height: 120.0,
            child:  Container(
              ///弹框背景和圆角
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new CircularProgressIndicator(),
                  new Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: new Text(
                      "加载中",
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            child: LoadingDialog(),
            onWillPop: () async {
              return Future.value(false);
            });
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }

}