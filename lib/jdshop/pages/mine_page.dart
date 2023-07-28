import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 134,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/user_bg.jpg"),
                    fit: BoxFit.cover)),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage("images/user.png"),
                ),
                SizedBox(
                  width: 12,
                ),
                isLogin
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "用户名:18279259491",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                "普通会员",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ))
                        ],
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            isLogin = !isLogin;
                          });
                        },
                        child: Text(
                          "登录注册",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.assignment,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "全部订单",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 0.2,
            color: Colors.black26,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.payment,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "待付款",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 0.2,
            color: Colors.black26,
          ),
          InkWell(
            onTap: () {
              ToastUtil.showMsg("FlutterDemo");
            },
            child: Container(
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.local_car_wash,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "FlutterDemo",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 0.2,
            color: Colors.black26,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "我的收藏",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 0.2,
            color: Colors.black26,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.people,
                      color: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      "在线客服",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 0.2,
            color: Colors.black26,
          ),
        ],
      ),
    );
  }
}
