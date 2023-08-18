import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/jdshop/config/config.dart';
import 'package:jdshop/jdshop/util/dio_proxy.dart';
import 'package:jdshop/jdshop/util/sign_util.dart';

import '../Util/toast_util.dart';
import '../event/event_bus.dart';
import '../util/user_util.dart';
import '../widget/jd_textfield.dart';

class EditAddressPage extends StatefulWidget {

   dynamic arguments;
  EditAddressPage(
      {
        this.arguments,
      Key? key})
      : super(key: key);

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {

  String id = "";
  String name = "";
  String phone = "";
  String address = "";
  String detailAddress = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.arguments["id"];
    name = widget.arguments["name"];
    phone = widget.arguments["phone"];
    address = widget.arguments["address"].toString().split("/")[0];
    detailAddress= widget.arguments["address"].toString().split("/")[1];
    nameController.text = name;
    phoneController.text = phone;
    detailController.text =detailAddress;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("编辑收货地址"),
        ),
        body: ListView(
          children: [
            Container(
              height: 50,
              child: JdTextField(
                controller: nameController,
                hint: "收件人姓名",
                onChanged: (value) {
                  this.name = value;
                },
              ),
            ),
            Container(
              height: 50,
              child: JdTextField(
                controller: phoneController,
                hint: "收件人电话号码",
                onChanged: (value) {
                  this.phone = value;
                },
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  //  this.widget.address = "湖北省孝感市云梦县";
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
                    Text(address.length > 0 ? "${this.address}" : "省/市/区")
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black12))),
              child: TextField(
                controller: detailController,
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
                  doEditAddress();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "修改",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }


  doEditAddress()async{
    List userInfo= await UserUtil.getUserInfo();
    print("${userInfo}");
    if(name.length<=0){
      ToastUtil.showMsg("请输入收件人姓名");
      return;
    }
    if(phone.length<=0){
      ToastUtil.showMsg("请输入收件人电话号码");
      return;
    }
    if(address.length<=0){
      ToastUtil.showMsg("请选择省/市/区");
      return;
    }
    if(detailAddress.length<=0){
      ToastUtil.showMsg("请填写详细地址");
      return;
    }
    var tempJson={
      "id":this.id,
      "uid":userInfo[0]["_id"],
      "name":this.name,
      "phone":this.phone,
      "address":this.address+"/"+detailAddress,
      "salt":userInfo[0]['salt']
    };
    var sign=SignUtil.sign(tempJson);
    var result= await DioProxy().dio.post(Config.doEditAddress,data: {
      "id":this.id,
      "uid":userInfo[0]["_id"],
      "name":this.name,
      "phone":this.phone,
      "address":this.address+"/"+detailAddress,
      "sign":sign
    });
    if(result.data["success"]){
      ToastUtil.showMsg(result.data['message']);
      eventBus.fire(AddressEvent(text: "修改地址"));
      Navigator.pop(context);
    }else{
      ToastUtil.showMsg(result.data['message']);
    }
  }

}

