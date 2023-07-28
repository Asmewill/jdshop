import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/jdshop/widget/loading_widget.dart';

import 'news_detail_1.dart';

class RefreshDemo extends StatefulWidget {
  const RefreshDemo({Key? key}) : super(key: key);
  @override
  State<RefreshDemo> createState() => _RefreshDemoState();
}

class _RefreshDemoState extends State<RefreshDemo> {
  bool flag=true;//  解决重复请求的问题
  int page=1;
  ScrollController controller=ScrollController();
  int pageSize=20;
  List list=[];
  bool hasMore=true;//判断有没有数据

  void getData() async{
    setState(() {
      this.flag=false;
    });
    await Future.delayed(Duration(milliseconds: 500),() async{
      var apiUrl="http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${page}";
      var result= await Dio().get(apiUrl);
      print("返回结果:${result}");
      print("response data is Map:${result.data is Map}"); //false
      print("response data is String:${result.data is String}"); //true
      List tempList= json.decode(result.data)["result"];
      if(tempList.length<this.pageSize){
        setState(() {
           this.list.addAll(tempList);
           this.hasMore=false;
           this.flag=true;
        });
      }else{
        setState(() {
          this.list.addAll(tempList);
          this.page++;
          this.flag=true;
        });
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    controller.addListener(() {
      if(controller.position.pixels>controller.position.maxScrollExtent-20){
        if(this.flag&&this.hasMore){
          getData();
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refresh 示例演示"),
      ),
      body:getRefreshLayout(list) ,
    );
  }

  Widget? getRefreshLayout(List list){
    if(list.length>0){
      return RefreshIndicator(
        child: ListView.builder(
          controller: controller,
          itemCount: list.length,
            itemBuilder:(BuildContext context,int index){
                return InkWell(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("${this.list[index]["title"]}"),
                      ),
                      Divider(height: 0.1,color: Colors.grey),
                      showMore(index)
                    ],
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return NewsDetailPage1(aid:list[index]["aid"]);

                    }));
                  },
                );
            }
        ),
        onRefresh: onRefresh,
      );
    }else{
      return LoadingWidget();
    }
  }
  
  Future<void> onRefresh() async{
    await  Future.delayed(Duration(milliseconds: 1000),(){
       this.page=1;
       this.hasMore=true;
       this.flag=true;
       this.list.clear();
       getData();
     });
  }

  Widget showMore(dynamic index){
    if(this.hasMore){
       return (index==this.list.length-1)?LoadingWidget():Container();
    }else{
       return (index ==  this.list.length-1)?Container(child: Text("--我是有底线的--"),):Container();
    }
  }
}
