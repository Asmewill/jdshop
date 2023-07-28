import 'package:flutter/material.dart';

class FlexDemo extends StatefulWidget {
  const FlexDemo({Key? key}) : super(key: key);

  @override
  State<FlexDemo> createState() => _FlexDemoState();
}

class _FlexDemoState extends State<FlexDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex演示Demo"),
      ),
      body: ListView(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.red,
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    height: 30,
                    color: Colors.green,
                  ))
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            height: 100,//必须给一个固定高度才可以的
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.green,
                    )),
                Expanded(
                    flex: 3,
                    child: Container(
                      height: 30,
                      color: Colors.blue,
                    )),
                Expanded(
                    flex: 4,
                    child: Container(
                      height: 30,
                      color: Colors.yellow,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
