import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';
import 'package:jdshop/jdshop/config/config.dart';
import 'package:jdshop/jdshop/event/event_bus.dart';
import 'package:jdshop/jdshop/util/dio_proxy.dart';
import 'package:jdshop/jdshop/util/sign_util.dart';
import 'package:jdshop/jdshop/util/user_util.dart';
import 'package:jdshop/jdshop/widget/jd_textfield.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  String name = "";
  String phone = "";
  String address = "";
  String detailAddress = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("增加收货地址"),
        ),
        body: ListView(
          children: [
            Container(
              height: 50,
              child: JdTextField(
                hint: "收件人姓名",
                onChanged: (value) {
                  this.name = value;
                },
              ),
            ),
            Container(
              height: 50,
              child: JdTextField(
                hint: "收件人电话号码",
                onChanged: (value) {
                  this.phone = value;
                },
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  address="湖北省孝感市云梦县";
                });
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    Text(address.length > 0 ? "${address}" : "省/市/区")
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))),
              child: TextField(
                maxLines: 3,
                decoration: InputDecoration(
                    hintText: "详细地址",
                    hintStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
                onChanged: (value) {
                  this.detailAddress = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 15),
              height: 50,
              width: ScreenUtil().screenWidth,
              child: ElevatedButton(
                onPressed: () {
                  addAddress();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Icon(
                    //   Icons.add,
                    //   color: Colors.white,
                    // ),
                    Text(
                      "增加",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  addAddress() async {
    List userList = await UserUtil.getUserInfo();
    print("userList:${userList}");
    if (name.length <= 0) {
      ToastUtil.showMsg("请输入收件人姓名");
      return;
    }
    if (phone.length <= 0) {
      ToastUtil.showMsg("请输入收件人电话号码");
      return;
    }
    if (address.length <= 0) {
      ToastUtil.showMsg("请选择省/市/区");
      return;
    }
    if (detailAddress.length <= 0) {
      ToastUtil.showMsg("请填写详细地址");
      return;
    }
    var tempJson = {
      "uid": userList[0]["_id"],
      "name": this.name,
      "phone": this.phone,
      "address": this.address+"/"+detailAddress,
      "salt": userList[0]["salt"]
    };
    print("参数:${tempJson}");
    var sign = SignUtil.sign(tempJson);
    print("sign:$sign");
    var api = "${Config.doAddAddress}";
    print("api:${api}");
    var result = await DioProxy().dio.post(api, data: {
      "uid": userList[0]["_id"],
      "name": this.name,
      "phone": this.phone,
      "address": this.address+"/"+detailAddress,
      "sign": sign
    });
    print("返回结果:${result}");
    if(result.data["success"]){
      ToastUtil.showMsg(result.data["message"]);
      eventBus.fire(AddressEvent(text: "新增地址"));
      eventBus.fire(CheckoutEvent(text: "结算地址"));
      Navigator.pop(context);
    }else{
      ToastUtil.showMsg(result.data['message']);
    }
  }
}
