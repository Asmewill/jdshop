import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/widget/statefulwidget/custom_button.dart';

class ButtomDemo extends StatefulWidget {
  const ButtomDemo({Key? key}) : super(key: key);

  @override
  State<ButtomDemo> createState() => _ButtomDemoState();
}

class _ButtomDemoState extends State<ButtomDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("按钮演示界面")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ToastUtil.showMsg("普通按钮");
                  },
                  child: Text("普通按钮")),
              SizedBox(
                width: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  ToastUtil.showMsg("颜色按钮");
                },
                child: Text(
                  "颜色按钮",
                  style: TextStyle(fontSize: 14, color: Colors.yellow),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ToastUtil.showMsg("阴影按钮");
                },
                child: Text("阴影按钮"),
                style: ButtonStyle(elevation: MaterialStateProperty.all(20)),
              ),
              SizedBox(
                width: 5,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    ToastUtil.showMsg("图标按钮");
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.yellow,
                  ),
                  label: Text("图标按钮")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    ToastUtil.showMsg("宽度高度");
                  },
                  child: Text("宽度高度"),
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child:
                      ElevatedButton(onPressed: () {}, child: Text("自适应按钮"))),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: 50,
                margin: EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(onPressed: () {}, child: Text("自适应按钮")),
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 38,
                child: ElevatedButton(
                  onPressed: () {
                    ToastUtil.showMsg("圆角按钮");
                  },
                  child: Text("圆角按钮"),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))))),
                ),
              ),
              SizedBox(width: 4),
              Container(
                width: 90,
                height: 38,
                child: ElevatedButton(
                  onPressed: () {
                    ToastUtil.showMsg("圆形按钮");
                  },
                  child: Text("圆形按钮"),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(19))))),
                ),
              ),
              SizedBox(width: 4),
              Container(
                width: 90,
                height: 38,
                child: ElevatedButton(
                  onPressed: () {
                    ToastUtil.showMsg("单个圆角按钮");
                  },
                  child: Text("单个圆角按钮",style: TextStyle(color: Colors.grey),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.only(bottomRight:Radius.circular(19))))),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: Text("文本按钮")),
              SizedBox(width: 10),
              Container(
                width: 100,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("线框按钮", style: TextStyle(color: Colors.grey)),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0), //去除阴影
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.red))),
                ),
              ),
              Container(
                width: 100,
                height: 30,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text("线框按钮", style: TextStyle(color: Colors.grey)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                      side: MaterialStateProperty.all(
                          BorderSide(color: Colors.red))),
                ),
              ),
            ],
          ),
          //REC
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text("注册",style: TextStyle(color: Colors.blue)),
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               CustomButton(text: "我是自定义按钮", width: 200, height: 40, onPressed: (){
                  ToastUtil.showMsg("我是自定义按钮");
               })
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               TextButton(onPressed: (){

               }, child: Text("确定"),style: ButtonStyle(
                 shape: MaterialStateProperty.all(RoundedRectangleBorder(
                     borderRadius: BorderRadius.only(bottomRight:Radius.circular(8)))),
               ),)
            ],
          ),
        ],
      ),
    );
  }
}
