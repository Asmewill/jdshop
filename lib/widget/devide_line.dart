import 'package:flutter/material.dart';

class DeviceLine extends StatelessWidget {
  const DeviceLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        //padding: EdgeInsets.only(bottom: 0),
        children: [
          Container(
            margin: EdgeInsets.only(top: 200),
            child:  SizedBox(
              height: 0.2,
              child: Container(
                height: 0.2,
                decoration: BoxDecoration(
                    color: Colors.grey
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
