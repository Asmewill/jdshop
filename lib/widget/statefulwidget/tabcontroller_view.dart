import 'package:flutter/material.dart';
import 'package:jdshop/jdshop/Util/toast_util.dart';

class TabControllerView extends StatefulWidget {
  const TabControllerView({Key? key}) : super(key: key);

  @override
  State<TabControllerView> createState() => _TabControllerViewState();
}

class _TabControllerViewState extends State<TabControllerView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TabController"),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            ToastUtil.showMsg("menu");
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                ToastUtil.showMsg("settings");
              },
              icon: const Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                ToastUtil.showMsg("search");
              },
              icon: const Icon(Icons.search))
        ],
        bottom: TabBar(
          controller: _tabController,
          //需要TabController
          isScrollable: true,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.red,
          indicatorColor: Colors.red,
          tabs: const [
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
      body: TabBarView(
        controller: _tabController, //需要TabController
        children: [
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
    );
  }
}
