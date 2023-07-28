import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewsDetailPage2 extends StatefulWidget {
   var aid;
   NewsDetailPage2({Key? key,this.aid}) : super(key: key);

  @override
  State<NewsDetailPage2> createState() => _NewsDetailPage2State();
}

class _NewsDetailPage2State extends State<NewsDetailPage2> {
  List list=[];

  void getData() async{
    var apiUrl = "http://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${widget.aid}";
    var result = await Dio().get(apiUrl);
    print("result:${result}");
    setState(() {
         this.list = json.decode(result.data)["result"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新闻详情${widget.aid}"),
      ),
      body: getListWidget(),
    );
  }

  Widget? getListWidget(){

  }
}
