import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  const CheckBoxDemo({Key? key}) : super(key: key);

  @override
  State<CheckBoxDemo> createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool? flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox用法演示"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: flag,
                  onChanged: (value) {
                    setState(() {
                      this.flag = value;
                    });
                  }),
              Text(flag! ? "选中" : "未选中")
            ],
          ),
          CheckboxListTile(
            value: this.flag,
            onChanged: (value) {
              setState(() {
                this.flag = value;
              });
            },
            title: Text("标题"),
            subtitle: Text("二级标题"),
            secondary: Icon(Icons.map),
          )
        ],
      ),
    );
  }
}
