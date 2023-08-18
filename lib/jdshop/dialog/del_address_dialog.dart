import 'package:flutter/material.dart';

class DelAddressDialog extends Dialog {
  var title;
  var message;
  var cancelText;
  var sureText;
  var onCancelEvent;
  var onSureEvent;
  var mainAxisAlignment;

  DelAddressDialog(
      {this.mainAxisAlignment = MainAxisAlignment.center,
      this.title,
      this.message,
      this.cancelText,
      this.sureText,
      this.onCancelEvent,
      this.onSureEvent});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              Container(
                // constraints: BoxConstraints(minHeight: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${title}",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: InkWell(
                                  child: Icon(Icons.close),
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                )
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(height: 0.1, color: Colors.grey),
                    Container(
                      constraints: BoxConstraints(minHeight: 80),
                      padding: EdgeInsets.only(
                          left: 15, top: 15, right: 15, bottom: 15),
                      alignment: Alignment.center,
                      child: Text("${message}",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Divider(height: 0.1, color: Colors.grey),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 48,
                              child: TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(8))))),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("取消"),
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                              height: 48,
                              child: TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(8))))),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  if(onSureEvent!=null){
                                     onSureEvent();
                                  }
                                },
                                child: Text("确定"),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
