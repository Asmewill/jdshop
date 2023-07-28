
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil{
  static void showMsg(String str){
     Fluttertoast.showToast(msg: str,gravity: ToastGravity.CENTER,toastLength: Toast.LENGTH_SHORT);
  }
}