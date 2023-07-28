import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.menu),
        title: const Text("Drawer用法"),
      ),
      body: const Center(
        child: Text("center"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://www.itying.com/images/flutter/2.png"))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30, top: 40),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                              "https://www.itying.com/images/flutter/1.png"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, top: 20),
                        child: Text(
                          "邮箱：1621722181@qq.com",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, top: 10),
                        child: Text(
                          "地址：深圳市宝安区海纳百川大厦B座7楼",
                          style: TextStyle(fontSize: 14, color: Colors.white,overflow:TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text("个人中心"),
              onTap: (){
                ToastUtil.showMsg("个人中心");
              },
            ),
           Container(
            height: 0.2,
            decoration: BoxDecoration(
              color: Colors.grey
            )),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text("设置中心"),
              onTap: (){
                ToastUtil.showMsg("设置中心");
              },
            ),
            Divider(height: 0.2,color:Colors.grey)
          ],
        ),
      ),
      endDrawer: Drawer(),
    );
  }
}



// 3.5 + 6.7+11.5 + 2 =
//13.5+10.2=21.7
//10+6 =16+3+2.7=21.7

//6+4+7=17w
// 4.7w




