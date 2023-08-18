import 'dart:convert';

import 'package:jdshop/jdshop/config/constant.dart';
import 'package:jdshop/jdshop/util/sharedpreferences_util.dart';

class UserUtil {
  //登录信息
  static Future<List> getUserInfo() async {
    String? userInfo =
        await SharedPreferencesUtil.getString(Constant.USER_INFO);
    if (userInfo != null) {
      List userInfoList = json.decode(userInfo);
      return userInfoList;
    } else {
      return [];
    }
  }
  //登录状态
  static getUserLoginState() async{
    var userInfo = await UserUtil.getUserInfo();
    if(userInfo.length>0&&userInfo[0]["username"]!=""){
      return true;
    }else {
      return false;
    }
  }
}
