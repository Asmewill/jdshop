import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/util/dio_proxy.dart';
import 'package:jdshop/widget/pages/dio_demo_page.dart';

class DioDemo extends StatefulWidget {
  const DioDemo({Key? key}) : super(key: key);

  @override
  State<DioDemo> createState() => _DioDemoState();
}



class _DioDemoState extends State<DioDemo> {
  String msg="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio网络请求演示"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${msg}"),
            ElevatedButton(onPressed: (){getData();}, child: Text("Get请求数据")),
            ElevatedButton(onPressed: (){postData();}, child: Text("Post请求数据")),
            ElevatedButton(onPressed: (){ Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return DioDemoPage();
            }));}, child: Text("Get请求数据,渲染数据")),
          ],
        ),
      ),
    );
  }

  void getData() async{
    var response = await DioProxy().dio.get("https://jd.itying.com/api/httpGet");
    print(response.data);
    print(response.data is String);
    print(response.data is Map);
    setState(() {
      msg=response.data["msg"];
    });
  }

  void postData() async{
    var response = await DioProxy().dio.post("https://jd.itying.com/api/httpPost",data: {"username":"张三","age":"20"});
    print(response.data);
    print(response.data is String);
    print(response.data is Map);//默认是Map类型
    setState(() {
      msg=response.data["msg"];
      //msg=response.data["body"]["username"];
    });
  }
}
