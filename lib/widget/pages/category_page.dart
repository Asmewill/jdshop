import 'package:flutter/material.dart';
import 'package:jdshop/widget/aspectratio_to_parent.dart';

import '../aspectratio_to_container.dart';
import '../card_column_aspectratio_listtile.dart';
import '../card_column_listtile.dart';
import '../card_map_column_aspectratio_listtile.dart';
import '../center_circleavatar_circle_img3.dart';
import '../center_clipoval_circle_img_2.dart';
import '../center_cliprrect.dart';
import '../center_container_circle_img_1.dart';
import '../center_container_image_network.dart';
import '../center_container_text.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView(
        padding: EdgeInsets.all(15),
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AspectRatioToContainer();
                }));
              },
              child: const Text("AspectRatioToContainer")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AspectRatioToParent();
                }));
              },
              child: const Text("AspectRatioToParent")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CardColumnAspectRatioListTile();
                }));
              },
              child: const Text("CardColumnAspectRatioListTile")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CardColumnListTile();
                }));
              },
              child: const Text("CardColumnListTile")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CardMapColumnAspectRadioListTile();
                }));
              },
              child: const Text("CardMapColumnAspectRadioListTile")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CenterCircleAvatarCircleImage3();
                }));
              },
              child: const Text("CenterCircleAvatarCircleImage3")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CenterClipOvalImage2();
                }));
              },
              child: const Text("CenterClipOvalImage2")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CenterClipRRect();
                }));
              },
              child: const Text("CenterClipRRect")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CenterContainerCircleImage1();
                }));
              },
              child: const Text("CenterContainerCircleImage1")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CenterContainerImageNetWork();
                }));
              },
              child: const Text("CenterContainerImageNetWork")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CenterContainerText();
                }));
              },
              child: const Text("CenterContainerText")),
        ],
      ),
    );
  }
}
