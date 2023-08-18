import 'package:flutter/material.dart';

import '../custom_elevated_button.dart';
import '../custom_icon_container.dart';
import '../demo_column_row_expanded.dart';
import '../devide_line.dart';
import '../gridview_builder_for_container.dart';
import '../gridview_count_for_container.dart';
import '../gridview_count_map_container.dart';
import '../gridview_count_padding.dart';
import '../listview_axis_horizontal.dart';
import '../listview_builder_listtile.dart';
import '../listview_for_listtile.dart';
import '../listview_listtile.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5),
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return CustomElevatedButton("content");
              }));
            },
            child: Text("CustomElevatedButton")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return CustomIconContainer(Icons.add);
              }));
            },
            child: Text("CustomIconContainer")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return DemoColumnRowExpanded();
              }));
            },
            child: Text("DemoColumnRowExpanded")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return DeviceLine();
              }));
            },
            child: Text("DeviceLine")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return GridViewBuilderForContainer();
              }));
            },
            child: Text("GridViewBuilderForContainer")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return GridViewCountForContainer();
              }));
            },
            child: Text("GridViewCountForContainer")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return GridViewCountMapContainer();
              }));
            },
            child: Text("GridViewCountMapContainer")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return GridViewCountPadding();
              }));
            },
            child: Text("GridViewCountPadding")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ListViewAxisHorizontal();
              }));
            },
            child: Text("ListViewAxisHorizontal")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ListViewBuilderListTile();
              }));
            },
            child: Text("ListViewBuilderListTile")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ListviewForListTile();
              }));
            },
            child: Text("ListviewForListTile")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ListViewListTile();
              }));
            },
            child: Text("ListViewListTile")),
      ],
    );
  }
}
