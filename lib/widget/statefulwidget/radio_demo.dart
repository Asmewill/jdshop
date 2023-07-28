import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({Key? key}) : super(key: key);

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  var sex = 2;
  var flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Radio用法演示"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("男"),
                Radio(
                    value: 1,
                    groupValue: this.sex,
                    onChanged: (value) {
                      setState(() {
                        this.sex = value!;
                      });
                    }),
                Text("女"),
                Radio(
                    value: 2,
                    groupValue: this.sex,
                    onChanged: (value) {
                      setState(() {
                        this.sex = value!;
                      });
                    })
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 0),
              child: Text(this.sex == 1 ? "男" : "女"),
            ),
            RadioListTile(
              value: 1,
              groupValue: this.sex,
              onChanged: (value) {
                setState(() {
                  this.sex = value!;
                });
              },
              title: Text("标题"),
              subtitle: Text("这是二级标题"),
              secondary: Icon(Icons.help),
              selected: this.sex == 1,
            ),
            RadioListTile(
              value: 2,
              groupValue: this.sex,
              onChanged: (value) {
                setState(() {
                  this.sex = value!;
                });
              },
              title: Text("标题"),
              subtitle: Text("这是二级标题"),
              secondary:
                  Image.network("https://www.itying.com/images/flutter/1.png"),
              selected: this.sex == 2,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 100,
              height: 40,
              child: Switch(
                  value: this.flag,
                  onChanged: (value) {
                    setState(() {
                      this.flag = value;
                    });
                  }) ,
            )
          ],
        ));
  }
}
