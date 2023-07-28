import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/widget/dialog/loading_dialog.dart';
import 'package:jdshop/widget/dialog/message_dialog.dart';

class DialogDemo extends StatefulWidget {
  const DialogDemo({Key? key}) : super(key: key);
  @override
  State<DialogDemo> createState() => _DailogDemoState();
}

class _DailogDemoState extends State<DialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog用法演示"),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        children: [
          ElevatedButton(
              onPressed: () {
                showAlertDialog();
              },
              child: Text("AlertDialog")),
          ElevatedButton(onPressed: () {
            showSimpleDialog();
          }, child: Text("SimpleDialog")),
          ElevatedButton(onPressed: () {
            showBottomSheet();
          }, child: Text("showModalBottomSheet")),
          ElevatedButton(onPressed: () {
              showDialog(context: context, builder: (context){
                return LoadingDialog();
              });
          }, child: Text("自定义LoadingDialog")),
          ElevatedButton(onPressed: () {
            showDialog(context: context, builder: (context){
              return MessageDialog();
            });

          }, child: Text("自定义Dialog")),
        ],
      ),
    );
  }
  void showLoadingDialog(){

  }

  void showBottomSheet(){
    var result = showModalBottomSheet(context: context, builder: (context){
      return Container(
        height: 250,
        child: ListView(
          children: [
            ListTile(
              title: Text("分享A"),
              onTap: (){
                ToastUtil.showMsg("分享A");
              },
            ),
            ListTile(
              title: Text("分享B"),
              onTap: (){
                ToastUtil.showMsg("分享B");
              },
            ),
            ListTile(
              title: Text("分享C"),
              onTap: (){
                ToastUtil.showMsg("分享C");
              },
            ),
            ListTile(
              title: Text("分享D"),
              onTap: (){
                ToastUtil.showMsg("分享D");
              },
            ),
            ListTile(
              title: Text("分享E"),
              onTap: (){
                ToastUtil.showMsg("分享E");
              },
            ),
            ListTile(
              title: Text("分享F"),
              onTap: (){
                ToastUtil.showMsg("分享F");
              },
            ),
          ],
        ),
      );
    });
  }
  //AlertDialog
  void showAlertDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示信息"),
            content: Text("确定要删除吗?"),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context,"ok");
              }, child: Text("确定")),
              TextButton(onPressed: () {
                Navigator.pop(context,"cancel");
              }, child: Text("取消")),
            ],
          );
        });
    ToastUtil.showMsg("result:$result");
  }
   //限制死了，基本不会用到
  void showSimpleDialog() async{
    var result= await showDialog(context: context, builder: (context){
      return  SimpleDialog(
        title: Container(
          height: 30,//无效
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("选择内容"),
            ],
          ),
        ),
        children: [
          Divider(height: 1),
          SimpleDialogOption(
            child: Text("OptionA"),
            onPressed: (){
              Navigator.pop(context,"OptionA");
            },
          ),
          Divider(height: 1),
          SimpleDialogOption(
            child: Text("OptionB"),
            onPressed: (){
              Navigator.pop(context,"OptionB");
            },
          ),
          Divider(height: 1),
          SimpleDialogOption(
            child: Text("OptionC"),
            onPressed: (){
              Navigator.pop(context,"OptionC");
            },
          ),
          Divider(height: 1),
          SimpleDialogOption(
            child: Text("OptionD"),
            onPressed: (){
              Navigator.pop(context,"OptionD");
            },
          ),
          Divider(height: 1),
        ],
      );
    });
    ToastUtil.showMsg("result:$result");
  }
}
