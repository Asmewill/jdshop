
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                )),
            SizedBox(width: 20),
            Text(
              '加载中...',
              style: TextStyle(fontSize: 12.0,color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
