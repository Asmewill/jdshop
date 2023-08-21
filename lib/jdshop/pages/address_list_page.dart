import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/jdshop/dialog/del_address_dialog.dart';
import 'package:jdshop/jdshop/util/dio_proxy.dart';
import 'package:jdshop/jdshop/widget/loading_widget.dart';

import '../config/config.dart';
import '../event/event_bus.dart';
import '../util/sign_util.dart';
import '../util/user_util.dart';

class AddressListPage extends StatefulWidget {
  AddressListPage({Key? key}) : super(key: key);
  @override
  State<AddressListPage> createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
  List addressList = [];
  late StreamSubscription<AddressEvent> actionEventBus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAddressList();
    actionEventBus = eventBus.on<AddressEvent>().listen((event) {
      this._getAddressList();
    });
  }

  _getAddressList() async {
    List userList = await UserUtil.getUserInfo();
    var tempJson = {"uid": userList[0]['_id'], 'salt': userList[0]['salt']};
    var sign = SignUtil.sign(tempJson);
    var api =
        '${Config.domain}api/addressList?uid=${userList[0]['_id']}&sign=${sign}';
    print("api:${api}");
    var result = await DioProxy().dio.get(api);
    print(result.data is Map);
    print("返回结果:${result}");
    setState(() {
      this.addressList = result.data['result'];
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (actionEventBus != null) {
      actionEventBus.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("地址列表"),
        ),
        body: getBodyWidget());
  }

  Widget getBodyWidget() {
    if (addressList.length > 0) {
      return Stack(
        children: [
          ListView.builder(
              padding: EdgeInsets.only(bottom: 50),
              itemCount: addressList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    changeDefaultAddress(addressList[index]["_id"]);
                  },
                  onLongPress: (){
                    showDelDialog(addressList[index]["_id"]);

                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1, color: Colors.black12))),
                    height: 78,
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                addressList[index]["default_address"] == 1
                                    ? Container(
                                        width: 40,
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.red,
                                        ),
                                      )
                                    : Container(
                                        width: 60,
                                      ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                          "${addressList[index]["name"]}${" " + addressList[index]["phone"]}"),
                                    ),
                                    Container(
                                      width: ScreenUtil().screenWidth*15/20,
                                      child:Text("${addressList[index]["address"]}",overflow: TextOverflow.ellipsis,maxLines:1)
                                    )
                                  ],
                                )
                              ],
                            )),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.only(right: 5),
                            child: IconButton(
                              icon: Icon(Icons.edit, color: Colors.black),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, "/edit_address_page",
                                    arguments: {
                                      "id": addressList[index]["_id"],
                                      "name": addressList[index]["name"],
                                      "phone": addressList[index]["phone"],
                                      "address": addressList[index]["address"]
                                    });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
          Positioned(
              bottom: 0,
              width: ScreenUtil().screenWidth,
              child: Container(
                height: 50,
                width: ScreenUtil().screenWidth,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/add_address_page");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.add), Text("新增收货地址")],
                    ),
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0)))))),
              ))
        ],
      );
    } else {
      return LoadingWidget();
    }
  }


  changeDefaultAddress(String id) async{
    List userList= await UserUtil.getUserInfo();
    var tempJson={
      "uid":userList[0]["_id"],
      "id":id,
      "salt":userList[0]["salt"]
    };
    var sign=SignUtil.sign(tempJson);
    var result= await DioProxy().dio.post(Config.doChangeDefaultAddress,data:{
      "uid":userList[0]["_id"],
      "id":id,
      "sign":sign
    });
    if(result.data["success"]==true){
      ToastUtil.showMsg(result.data["message"]);
      eventBus.fire(CheckoutEvent(text: "修改默认地址成功"));
      Navigator.pop(context);
    }else{
      ToastUtil.showMsg(result.data["message"]);
    }
  }

  void showDelDialog(String addressId) {
    showDialog(barrierDismissible:true,context: context, builder: (context){
      return DelAddressDialog(
        title: "提示",
        message: "确定删除该地址吗?",
        onSureEvent: ()async{
          List userList =await UserUtil.getUserInfo();
          var tempMap={
            "id":addressId,
            "uid":userList[0]["_id"],
            "salt":userList[0]["salt"]
          };
          var sign=SignUtil.sign(tempMap);
          var api="${Config.domain}api/deleteAddress";
          print("api:${api}");
          var result=await DioProxy().dio.post(api,data: {
            "id":addressId,
            "uid":userList[0]["_id"],
            "sign":sign
          });
          if(result.data["success"]){
            ToastUtil.showMsg(result.data['message']);
            _getAddressList();
            eventBus.fire(CheckoutEvent(text: "删除地址"));
            Navigator.pop(context);
          }else{
            ToastUtil.showMsg(result.data['message']);
          }
        },
      );
    });
  }
}
