import 'package:flutter/material.dart';
import 'data/listData.dart';

class ListViewMapListTile extends StatelessWidget {
  List<Widget> _getData() {
    var list = listData.map(
      (item) => Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black12, width: 0.5))),
          child: ListTile(
            title: Text(item['title']),
            subtitle: Text(item['author']),
            leading: Image.network(item["imageUrl"]),
          )),
    );

    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _getData(),
      ),
    );
  }
}
