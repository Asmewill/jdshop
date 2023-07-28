import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({Key? key}) : super(key: key);

  @override
  State<TextFieldDemo> createState() => _TextFiledDemoState();
}

class _TextFiledDemoState extends State<TextFieldDemo> {
  var _controller;
  var _password;

  TextEditingController inputTextCollection(String value) {
    TextEditingController tempController = TextEditingController();
    //解决设置了初始值之后，
    tempController.addListener(() {
      final text = tempController.text;
      tempController.value = tempController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    tempController.text = value;
    return tempController;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = inputTextCollection("初始值");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField演示页面"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(hintText: "请输入用户名"),
                onChanged: (value) {
                  setState(() {
                    _controller.text = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(hintText: "请输入密码"),
                onChanged: (value){
                  setState(() {
                    _password=value;
                  });
                },
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            if(_controller.text.toString().isEmpty){
                              ToastUtil.showMsg("请输入用户名");
                              return;
                            }
                            if(_password==null||(_password!=null&&_password.toString().isEmpty)){
                              ToastUtil.showMsg("请输入密码");
                              return;
                            }
                            ToastUtil.showMsg("用户名:"+_controller.text +",密码:"+_password);
                          },child: Text("登录"),
                        ),
                      ))
                ],
              ),

              SizedBox(height: 50,),
              TextField(),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  hintText: "请输入搜索的内容",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  hintText: "多行文本",
                  border: OutlineInputBorder()
                ),
                maxLines: 4,
              ),
              SizedBox(height: 20,),
              TextField(
                 obscureText: true,
                decoration: InputDecoration(
                   hintText: "用户名",border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "密码框",border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "密码"
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  hintText: "请输入用户名"
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
