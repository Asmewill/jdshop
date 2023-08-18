import 'package:flutter/material.dart';

class ListviewForListTile extends StatelessWidget {
  List<Widget> _getData() {
    List<Widget> list = []; //初始化一个空的list集合列表
    for (var i = 0; i < 20; i++) {
      list.add(Container(
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black12, width: 0.5))),
        child: ListTile(
          title: Text("我是第$i 个列表"),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: this._getData(),
      ),
    );
  }
}
