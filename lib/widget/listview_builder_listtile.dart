import 'package:flutter/material.dart';

import 'data/listData.dart';

class ListViewBuilderListTile extends StatelessWidget {
  Widget _getListData(context, index) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Colors.black12, width: 0.5))),
      height: 200,
      alignment: Alignment.centerLeft,
      child: Text(listData[index]['title']),
    );
    ListTile(
      title: Text(listData[index]['title']),
      subtitle: Text(listData[index]['author']),
      leading: Image.network(
        listData[index]['imageUrl'],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: listData.length, itemBuilder: _getListData),
    );
  }
}
