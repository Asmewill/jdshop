import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';

class PayPage extends StatefulWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  List payList = [
    {
      "title": "支付宝支付",
      "checked": true,
      "image": "https://www.itying.com/themes/itying/images/alipay.png"
    },
    {
      "title": "微信支付",
      "checked": false,
      "image": "https://www.itying.com/themes/itying/images/weixinpay.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("去支付"),
      ),
      body: ListView(
        children: [
          Column(
            children: payList.map((item){
              return InkWell(
                onTap: (){
                  setState(() {
                    for(var i=0;i<payList.length;i++){
                      if(payList[i]==item){
                        payList[i]["checked"]=true;
                      }else{
                        payList[i]["checked"]=false;
                      }
                    }
                  });
                },
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black12))),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.only(left: 15),
                              child: Image.network("${item["image"]}"),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text("${item["title"]}"),
                            )
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.only(right: 15),
                            child: item["checked"]==true?Icon(Icons.check):Container(),
                          ))
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 70),
            height: 45,
            child: ElevatedButton(
              onPressed: (){
                ToastUtil.showMsg("去支付");
              },
              child: Text("去支付"),
            ),
          )
        ],
      )
    );
  }
}
