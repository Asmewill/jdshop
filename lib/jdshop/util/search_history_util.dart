

import 'dart:convert';

import 'package:jdshop/jdshop/config/config.dart';
import 'package:jdshop/jdshop/config/constant.dart';
import 'package:jdshop/jdshop/util/sharedpreferences_util.dart';

class SearchHistoryUtil{
     static setHistoryData(keyWords) async {
       /*
          1、获取本地存储里面的数据  (searchList)
          2、判断本地存储是否有数据
              2.1、如果有数据
                    1、读取本地存储的数据
                    2、判断本地存储中有没有当前数据，
                        如果有不做操作、
                        如果没有当前数据,本地存储的数据和当前数据拼接后重新写入
              2.2、如果没有数据

                    直接把当前数据放在数组中写入到本地存储
      */
       //注意：新版shared_preferences增加了可空类型，如果为空不会报错了，所以这里直接可以判断。
        String? searchList= await SharedPreferencesUtil.getString(Constant.SEARCH_LIST);
        if(searchList!=null){
          List searchListData= json.decode(searchList);
          var hasData=searchListData.any((element) => element==keyWords);
          if(!hasData){
            searchListData.add(keyWords);
            await SharedPreferencesUtil.setString(Constant.SEARCH_LIST,json.encode(searchListData));
          }
        }else{
          List tempList=[];
          tempList.add(keyWords);
          await SharedPreferencesUtil.setString(Constant.SEARCH_LIST, json.encode(tempList));
        }
     }

     static Future<List> getHistoryList() async{
       String? searchList = await SharedPreferencesUtil.getString(Constant.SEARCH_LIST);
       if(searchList!=null){
         List searchListData = json.decode(searchList);
         return searchListData;
       }
       return [];
     }


}