import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/jdshop/config/config.dart';
import 'package:jdshop/jdshop/config/constant.dart';
import 'package:jdshop/jdshop/util/dio_proxy.dart';
import 'package:jdshop/jdshop/util/sharedpreferences_util.dart';
import 'package:jdshop/jdshop/widget/jd_textfield.dart';

class RegisterThridPage extends StatefulWidget {
  var arguments;

  RegisterThridPage({this.arguments, Key? key}) : super(key: key);

  @override
  State<RegisterThridPage> createState() => _RegisterThridPageState();
}

class _RegisterThridPageState extends State<RegisterThridPage> {
  String pwd1 = "";
  String pwd2 = "";
  String phone = "";
  String vCode = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phone = widget.arguments["phone"];
    vCode = widget.arguments["vCode"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户注册第三部"),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 30),
            child: Text("请设置您的登录密码"),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            child: JdTextField(
              hint: "请输入密码",
              onChanged: (value) {
                this.pwd1 = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            child: JdTextField(
              hint: "请输入确认密码",
              onChanged: (value) {
                this.pwd2 = value;
              },
            ),
          ),
          Container(
            height: 44,
            margin: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: ElevatedButton(
              onPressed: () {
                doRegister();
              },
              child: Text("确定"),
            ),
          )
        ],
      ),
    );
  }

  doRegister() async {
    if (pwd1.length < 6) {
      ToastUtil.showMsg("密码长度不能小于6位");
      return;
    }
    if (pwd2.length < 6) {
      ToastUtil.showMsg("确认密码长度不能小于6位");
      return;
    }
    if (this.pwd1 != this.pwd2) {
      ToastUtil.showMsg("二次密码不一致");
      return;
    }
    print("api:" + Config.doRegister);
    var result = await DioProxy().dio.post(Config.doRegister,
        data: {"tel": phone, "code": vCode, "password": this.pwd1});
    //{success: true, message: 注册成功, userinfo: [{_id: 64d2141a149c90000718191a, username: 13148735182, tel: 13148735182, salt: e71ad22eed10d8f6f8242f67695b215f}]}
    print("返回结果:${result.data}");
    if (result.data["success"] == true) {
      SharedPreferencesUtil.setString(
          Constant.USER_INFO, json.encode(result.data["userinfo"]));
      Navigator.pushNamedAndRemoveUntil(
          context, "/index_page", (route) => route == null,arguments: {"tab_index":0 });
    } else {
      ToastUtil.showMsg(result.data["message"]);
    }
  }
}
