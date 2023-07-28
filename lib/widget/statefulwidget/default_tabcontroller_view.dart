
import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';

class DefaultTabControllerView extends StatefulWidget {
  const DefaultTabControllerView({Key? key}) : super(key: key);

  @override
  State<DefaultTabControllerView> createState() => _DefaultTabControllerViewState();
}

class _DefaultTabControllerViewState extends State<DefaultTabControllerView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 8,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("DefaultTabController"),
            centerTitle: false,
            leading: IconButton(
               icon: const Icon(Icons.menu),
               onPressed: () {
                   ToastUtil.showMsg("menu");
               },
            ),
            actions: [
              IconButton(
                onPressed: (){
                  ToastUtil.showMsg("settings");
                },
                icon: const Icon(Icons.settings)
              ),
              IconButton(
                  onPressed: (){
                    ToastUtil.showMsg("search");
                  },
                  icon: const Icon(Icons.search)
              )
            ],
            bottom:const TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.black,
              labelColor: Colors.red,
              indicatorColor: Colors.red,
              tabs: [
                Tab(child: Text("热门")),
                Tab(child: Text("推荐")),
                Tab(child: Text("热门")),
                Tab(child: Text("推荐")),
                Tab(child: Text("热门")),
                Tab(child: Text("推荐")),
                Tab(child: Text("热门")),
                Tab(child: Text("推荐")),
              ],
            ),
          ),
          body:  TabBarView(children:[
            ListView(
              children: const [
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
              ],
            ),
            ListView(
              children: const [
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
              ],
            ),
            ListView(
              children: const [
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
              ],
            ),
            ListView(
              children: const [
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
              ],
            ),
            ListView(
              children: const [
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
              ],
            ),
            ListView(
              children: const [
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
              ],
            ),
            ListView(
              children: const [
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
              ],
            ),
            ListView(
              children: const [
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
                ListTile(title: Text("data")),
              ],
            ),
          ],
        ),
       )
    );
  }
}
