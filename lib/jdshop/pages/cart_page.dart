import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var imageLink =
      "https://jdmall.itying.com/public/upload/RQXtJTh1WbzxpSbLF-vjDYTo.png";
  bool? isAllSelect = true;
  bool? isChecked=false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                ToastUtil.showMsg("Edit");
              },
              icon: Icon(Icons.launch))
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: 90,
                child: Row(
                  children: [
                    Checkbox(value: isChecked, onChanged: (value) {
                      setState(() {
                        isChecked=value;
                      });

                    }),
                    Image.network(
                      imageLink,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text("AAAAAAAAAAAAAAA"),
                        ),
                        Expanded(flex: 1, child: Container()),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10,bottom: 10),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("￥688",style: TextStyle(color: Colors.red),),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text("688"),
                              )
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
              Divider(height: 1),
            ],
          ),
          Positioned(
              bottom: 0,
              child: Container(
                  //Container一定要有宽度，否则不予显示
                  height: 50,
                  width: ScreenUtil().screenWidth,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Checkbox(
                                value: isAllSelect,
                                onChanged: (value) {
                                  setState(() {
                                    isAllSelect = value;
                                  });
                                }),
                            Text("全选"),
                            SizedBox(
                              width: 10,
                            ),
                            Text("总计:"),
                            Text(
                              "￥253.63",
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 38,
                          width: 68,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                            onPressed: () {
                              ToastUtil.showMsg("结算");
                            },
                            child: Text("结算"),
                          ),
                        ),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
