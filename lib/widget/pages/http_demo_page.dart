import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDemoPage extends StatefulWidget {
  const HttpDemoPage({Key? key}) : super(key: key);

  @override
  State<HttpDemoPage> createState() => _HttpDemoPageState();
}

class _HttpDemoPageState extends State<HttpDemoPage> {
  List _list = [];

  void getListData() async {
    var apiUrl = Uri.parse("https://www.wanandroid.com/banner/json");
    var response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      setState(() {
        print("resultBody:${response.body}");
        print("decodeBody:${json.decode(response.body)}");
        this._list = json.decode(response.body)["data"];
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("请求数据Demo"),
      ),
      body: listWidget(_list),
    );
  }

  Widget listWidget(List list) {
    if (_list.length > 0) {
      return ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(this._list[index]["title"]));
          });
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
