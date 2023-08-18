import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/util/dio_proxy.dart';

class DioDemoPage extends StatefulWidget {
  const DioDemoPage({Key? key}) : super(key: key);

  @override
  State<DioDemoPage> createState() => _DioRequestDemoState();
}

class _DioRequestDemoState extends State<DioDemoPage> {
  List list = [];

  void getData() async {
    var response = await DioProxy().dio.get("https://www.wanandroid.com/banner/json");
    print(response.data);
    if (response.statusCode == 200) {
      setState(() {
        list = response.data["data"];
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio请求演示页面"),
      ),
      body: getListWidget(),
    );
  }

  Widget? getListWidget() {
    if (list.length > 0) {
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index)=> Text("${list[index]["title"]}"));
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text("loading..."),
            )
          ],
        ),
      );
    }
  }
}
