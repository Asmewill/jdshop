

import 'dart:convert';

import 'package:crypto/crypto.dart';

class SignUtil {
  static sign(Map json) {
    List attrKeys=json.keys.toList();
    attrKeys.sort();
    String str="";
    for(var i=0;i<attrKeys.length;i++){
      str+="${attrKeys[i]}${json[attrKeys[i]]}";
    }
    return md5.convert((utf8.encode(str))).toString();
  }
}