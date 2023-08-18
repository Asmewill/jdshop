import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/widget/pages/buttom_page.dart';
import 'package:jdshop/widget/pages/search_page_demo.dart';
import 'package:jdshop/widget/statefulwidget/checkbox_demo.dart';
import 'package:jdshop/widget/statefulwidget/dialog_demo.dart';
import 'package:jdshop/widget/statefulwidget/dio_demo.dart';
import 'package:jdshop/widget/statefulwidget/flex_demo.dart';
import 'package:jdshop/widget/statefulwidget/http_demo.dart';
import 'package:jdshop/widget/statefulwidget/radio_demo.dart';
import 'package:jdshop/widget/refresh/refresh_demo.dart';
import 'package:jdshop/widget/statefulwidget/take_photo_demo.dart';
import 'package:jdshop/widget/statefulwidget/textfield_demo.dart';

import '../statefulwidget/provider_demo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const SearchPageDemo(arguments: {"id": "666"});
              }));
            },
            child: const Text("普通路由跳转传值:跳转到搜索界面")),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/searchdemo",
                  arguments: {"id": "454545"});
            },
            child: const Text("命名路由跳转传值:跳转到搜索界面")),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/product");
            },
            child: const Text("命名路由跳转到商品界面")),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/default_tabcontroller");
            },
            child: const Text("DefaultTabControllerView")),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/tabcontroller");
            },
            child: const Text("Tabcontroller")),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/drawerview");
            },
            child: Text("DrawerView")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ButtomDemo();
              }));
            },
            child: Text("按钮演示界面")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return TextFieldDemo();
              }));
            },
            child: Text("文本输入框演示界面")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ProviderDemo();
              }));
            },
            child: Text("Provider功能演示")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CheckBoxDemo();
              }));
            },
            child: Text("CheckBox用法演示")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RadioDemo();
              }));
            },
            child: Text("Radio用法演示")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DialogDemo();
              }));
            },
            child: Text("Dialog用法演示")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FlexDemo();
              }));
            },
            child: Text("Flex功能演示")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HttpDemo();
              }));
            },
            child: Text("Http请求功能演示")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DioDemo();
              }));
            },
            child: Text("Dio请求功能演示")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RefreshDemo();
              }));
            },
            child: Text("Refresh下拉刷新")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TakePhotoDemo();
              }));
            },
            child: Text("相机拍照")),
      ],
    );
  }
}
