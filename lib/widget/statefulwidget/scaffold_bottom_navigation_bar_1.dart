import 'package:flutter/material.dart';
import 'package:jdshop/widget/pages/category_page.dart';
import 'package:jdshop/widget/pages/home_page.dart';
import 'package:jdshop/widget/pages/setting_page.dart';
import 'package:jdshop/widget/pages/square_page.dart';

class ScaffoldBottomNavigationBar1 extends StatefulWidget {
  final int index;
  const ScaffoldBottomNavigationBar1({this.index=0,Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ScaffoldBottomNavigationBar1> createState() => _ScaffoldBottomNavigationBar1State(this.index);
}

class _ScaffoldBottomNavigationBar1State extends State<ScaffoldBottomNavigationBar1> {
  int _currentIndex=0;
  _ScaffoldBottomNavigationBar1State(this._currentIndex);

  List<Widget> listPage=[
    const HomePage(),
    const CategoryPage(),
    const SettingPage(),
    const SquarePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Demo")),
      body: listPage[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:_currentIndex ,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,//当BottomNavigationBarItem>3时，必须设置
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "首页"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "分类"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "设置"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "广场"
          ),
        ],
      ),
    );
  }
}

