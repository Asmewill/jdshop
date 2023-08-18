import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/jdshop/widget/jd_textfield.dart';

class RegisterFirstPage extends StatefulWidget {
  const RegisterFirstPage({Key? key}) : super(key: key);

  @override
  State<RegisterFirstPage> createState() => _RegisterFirstPageState();
}

class _RegisterFirstPageState extends State<RegisterFirstPage> {
  String phoneStr = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户注册第一步"),
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 10, right: 10),
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            child: JdTextField(
              hint: "请输入手机号码",
              onChanged: (value) {
                phoneStr = value;
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 46,
            child: ElevatedButton(
              onPressed: () {
                if (phoneStr.length <= 0) {
                  ToastUtil.showMsg("请输入手机号码");
                  return;
                }
                if (phoneStr.length < 11) {
                  ToastUtil.showMsg("请输入正确的手机号码");
                  return;
                }
                Navigator.pushNamed(context, "/register_second_page",arguments: {"phone":phoneStr});
              },
              child: Text("下一步"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
            ),
          ),
        ],
      ),
    );
  }
}
