import 'package:flutter/material.dart';
import 'package:jdshop/widget/row_expanded_1.dart';

import '../listview_map_listtile.dart';
import '../listview_padding_image_container.dart';
import '../row_expanded_2.dart';
import '../row_mainaxis_crossaxis_alignment.dart';
import '../stack_align.dart';
import '../stack_alignment.dart';
import '../stack_positioned.dart';
import '../stack_test_demo.dart';
import '../wrap_elevated_button_1.dart';
import '../wrap_elevated_button_2.dart';

class SquarePage extends StatefulWidget {
  const SquarePage({Key? key}) : super(key: key);

  @override
  State<SquarePage> createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 10, right: 10),
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ListViewMapListTile();
              }));
            },
            child: const Text("ListViewMapListTile")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ListViewPaddingImageContainer();
              }));
            },
            child: const Text("ListViewPaddingImageContainer")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return RowExpanded1();
              }));
            },
            child: const Text("RowExpanded1")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return RowExpanded2();
              }));
            },
            child: const Text("RowExpanded2")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return RowMainAxisCrossAxisAlignment();
              }));
            },
            child: const Text("RowMainAxisCrossAxisAlignment")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return StackAlign();
              }));
            },
            child: const Text("StackAlign")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return StackAlignment();
              }));
            },
            child: const Text("StackAlignment")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return StackPositioned();
              }));
            },
            child: const Text("StackPositioned")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return StackTestDemo();
              }));
            },
            child: const Text("StackTestDemo")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return WrapElevatedButton1();
              }));
            },
            child: const Text("WrapElevatedButton1")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return WrapElevatedButton2();
              }));
            },
            child: const Text("WrapElevatedButton2")),
      ],
    );
  }
}
