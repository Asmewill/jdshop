import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/jdshop/config/config.dart';
import 'package:jdshop/jdshop/config/constant.dart';
import 'package:jdshop/jdshop/event/event_bus.dart';
import 'package:jdshop/jdshop/util/dio_proxy.dart';
import 'package:jdshop/jdshop/util/sharedpreferences_util.dart';
import 'package:jdshop/jdshop/widget/jd_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phone="";
  String pwd="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close),
        ),
        centerTitle: true,
        title: Text("登录"),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "客服",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10, right: 10),
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            child: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage("images/flutter1.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: JdTextField(
              hint: "用户名/手机号",
              onChanged: (value) {
                this.phone=value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: JdTextField(
              hint: "请输入密码",
              onChanged: (value) {
                this.pwd=value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: ScreenUtil().screenWidth,
            height: 50,
            child: Stack(
              children: [
                Align(alignment: Alignment.centerLeft, child: Text("忘记密码")),
                Align(alignment: Alignment.center, child: Text(".")),
                Align(alignment: Alignment.centerRight, child:InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "/register_first_page");
                  },
                  child:  Text("用户注册"),
                )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 46,
            child: ElevatedButton(
              onPressed: () {
                doLogin();
              },
              child: Text("登录"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
            ),
          )
        ],
      ),
    );
  }

  doLogin() async{
    if(this.phone.length<=0){
      ToastUtil.showMsg("请输入用户名");
      return;
    }
    if(this.pwd.length<=0){
      ToastUtil.showMsg("请输入密码");
      return;
    }
    var api="${Config.domain}api/doLogin";
    print("api:${api}");
    var result =await DioProxy().dio.post(api,data:{"username":phone,"password":pwd});
    print("返回结果:${result.data}");
    if(result.data["success"]==true){
      SharedPreferencesUtil.setString(Constant.USER_INFO,json.encode(result.data["userinfo"]));
      eventBus.fire(UserEvent(text: "登录成功"));
      Navigator.pop(context);
    }else{
      ToastUtil.showMsg(result.data["message"]);
    }
  }
}
