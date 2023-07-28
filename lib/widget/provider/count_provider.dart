import 'package:flutter/cupertino.dart';

class CountProvider with ChangeNotifier{
  int _count=1;
  int get count=>_count;
  updateCount(){
    _count++;
    notifyListeners();
  }
}