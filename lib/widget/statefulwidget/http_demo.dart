import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jdshop/widget/pages/http_demo_page.dart';
class HttpDemo extends StatefulWidget {
  const HttpDemo({Key? key}) : super(key: key);

  @override
  State<HttpDemo> createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http请求演示"),
      ),
      body:Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              getData();
            }, child: Text("Get请求数据")),
            ElevatedButton(onPressed: (){
              postData();
            }, child: Text("Post请求数据")),
            ElevatedButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context){
                return HttpDemoPage();
              }));
            }, child: Text("Get请求渲染数据"))
          ],
        ),
      )
    );
  }
  void getData() async{
    var apiUri=Uri.parse("https://jd.itying.com/api/httpGet");
    var response=await http.get(apiUri);
    print("Response status:${response.statusCode}");
    print("Response body:${response.body}");
    print(response.body is String);
    print(response.body is Map);
    print(json.decode(response.body) is Map);
  }

  void postData() async{
    var apiUrl=Uri.parse("https://jd.itying.com/api/httpPost");
    var response= await http.post(apiUrl,body: {"username":"张三","age":"20"});
    print("Response status:${response.statusCode}");
    print("Response body:${response.body}"); print(response.body is String);
    print(response.body is Map);
    print(json.decode(response.body) is Map);
  }


}
