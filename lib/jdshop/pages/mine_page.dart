import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/jdshop/event/event_bus.dart';
import 'package:jdshop/jdshop/pages/order_page.dart';
import 'package:jdshop/jdshop/util/user_util.dart';

import '../../widget/statefulwidget/scaffold_bottom_navigation_bar_1.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  List userList = [];
  bool isLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventBus.on<UserEvent>().listen((event) {
      print("UserEvent:${event.text}");
      getUserInfo();
    });
    getUserInfo();
  }

  /***
   * 获取用户信息数据
   */
  getUserInfo() async {
    List userList = await UserUtil.getUserInfo();
    bool isLogin = await UserUtil.getUserLoginState();
    setState(() {
      this.userList = userList;
      this.isLogin = isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.only(bottom: 0),//给底部一个0的padding,有一个沉浸式透明状态栏的效果
        children: [
          Container(
            height: 150,
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
                            "用户名:${userList[0]["tel"]}",
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
                            Navigator.pushNamed(context, "/login_page");
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
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OrderPage(arguments: {"tab_index": 0});
              }));
            },
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
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return OrderPage(arguments: {"tab_index": 1});
              }));
            },
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ScaffoldBottomNavigationBar1();
              }));
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
            onTap: () {
              ToastUtil.showMsg("我的收藏");
            },
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
            onTap: () {
              ToastUtil.showMsg("在线客服");
            },
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
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 0.2,
            color: Colors.black26,
          ),
          isLogin?
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 30),
            height: 46,
            child:  ElevatedButton(onPressed: (){
              UserUtil.loginOut();
              ToastUtil.showMsg("退出登录成功");
              getUserInfo();
            }, child: Text("退出登录")) ,
          ):Text("")

        ],
      ),
    ));
  }
}
