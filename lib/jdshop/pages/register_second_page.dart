import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/jdshop/config/config.dart';
import 'package:jdshop/jdshop/widget/jd_textfield.dart';

import '../util/dio_proxy.dart';

class RegisterSecondPage extends StatefulWidget {
  var arguments;

  RegisterSecondPage({this.arguments, Key? key}) : super(key: key);

  @override
  State<RegisterSecondPage> createState() => _RegisterSecondPageState();
}

class _RegisterSecondPageState extends State<RegisterSecondPage> {
  late Timer timer;
  var phone = "";
  int second = 10;
  bool isEnable = true;
  TextEditingController? controller;
  var vCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phone = widget.arguments["phone"];
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (timer != null) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户注册第二步"),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 30),
            child: Text("请输入${phone}收到的手机验证码"),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 5),
                    child: JdTextField(
                      controller: controller,
                      hint: "请输入验证码",
                      onChanged: (value) {
                        vCode = value;
                      },
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          if (this.isEnable) {
                            sendCode();
                          }
                        },
                        child: isEnable ? Text("发送") : Text("${second}s后重发")),
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15, left: 10, right: 10),
            height: 44,
            child: ElevatedButton(onPressed: () {
                 validateCode();
            }, child: Text("下一步")),
          )
        ],
      ),
    );
  }

  void _showTime() {
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        this.second--;
        if (this.second == 0) {
          timer.cancel();
          this.isEnable = true;
        }
      });
    });
  }

  void sendCode() async {
    print("重新发送验证码");
    var api = "${Config.domain}api/sendCode";
    print("api:${api}");
    print("tel:" + phone);
    var result = await DioProxy().dio.post(api, data: {"tel": phone});
    print("返回结果:${result}");
    ToastUtil.showMsg("验证码:${result.data}");
    if (result.data["success"] == true) {
      setState(() {
        vCode = result.data["code"];
        controller?.text = vCode;
        this.second = 10;
        isEnable = false;
      });
      _showTime();
    } else {
      ToastUtil.showMsg(result.data["message"]);
    }
  }

  validateCode() async {
    if (vCode.toString().length == 0||vCode==null) {
      ToastUtil.showMsg("请输入验证码");
    } else {
      var api = "${Config.domain}api/validateCode";
      print("api:${api}");
      print("vCode:"+vCode!);
      var result =await DioProxy().dio.post(api, data: {"tel": phone, "code": vCode});
      print(result);
      if(result.data["success"]==true){
        Navigator.pushReplacementNamed(context, "/register_thrid_page",arguments: {"phone":phone,"vCode":vCode});
      }else{
        ToastUtil.showMsg(result.data["message"]);
      }
    }
  }
}
